// Injects the co-op code into a clean Super R-R data.win:
//   coop\gml\*.gml   new scripts and objCoopNet events (full code entries)
//   coop\hooks\*.gml small edits of existing game events, named <object>.<Event>.<subtype>.<mode>.gml
//                    mode = prepend | append | findreplace | replace-level0 (objTitleNew's level-0 menu drawing block)
// Run on the untouched backup and write to a new file:
//   UndertaleModCli load _backup_original\data.win -s coop\patch\ApplyCoop.csx -o _work\data.win -f < NUL
using System;
using System.IO;
using System.Linq;
using UndertaleModLib.Compiler;

string root = Path.GetFullPath(Path.Combine(Path.GetDirectoryName(FilePath), ".."));
string gmlDir = Path.Combine(root, "coop", "gml");
string hookDir = Path.Combine(root, "coop", "hooks");

if (Data.GameObjects.ByName("objCoopNet") != null)
    throw new Exception("This data.win already contains co-op code; patch the clean backup instead.");

// Create the new objects up front, so code that names them compiles against them.
var net = new UndertaleGameObject
{
    Name = Data.Strings.MakeString("objCoopNet"),
    Persistent = true,
    Visible = true,
    Depth = -1000000,
};
Data.GameObjects.Add(net);
// The partner's body. Not a child of objPlayer on purpose; drawn just under the local player (depth -3).
Data.GameObjects.Add(new UndertaleGameObject
{
    Name = Data.Strings.MakeString("objCoopPuppet"),
    Persistent = false,
    Visible = true,
    Depth = -2,
});
// Projectile watermark object: created and destroyed every frame to learn the next instance id.
Data.GameObjects.Add(new UndertaleGameObject
{
    Name = Data.Strings.MakeString("objCoopMarker"),
    Persistent = false,
    Visible = false,
    Depth = 0,
});
// Client-side ghosts of host enemies / corpses (depth is set per entity when created).
Data.GameObjects.Add(new UndertaleGameObject
{
    Name = Data.Strings.MakeString("objCoopEnt"),
    Persistent = false,
    Visible = true,
    Depth = 0,
});

var files = Directory.GetFiles(gmlDir, "*.gml").OrderBy(f => f).ToArray();
// variable_global_exists / variable_local_exists crash this runner build ("trying to index a variable which is
// not an array"); the game only calls them from its dev console.
foreach (var f in files.Concat(Directory.GetFiles(hookDir, "*.gml")))
    foreach (var line in File.ReadAllLines(f).Where(l => !l.TrimStart().StartsWith("//")))
        if (line.Contains("variable_global_exists(") || line.Contains("variable_local_exists("))
            throw new Exception(Path.GetFileName(f) + ": do not use variable_*_exists (crashes this runner)");
var group = new CodeImportGroup(Data) { AutoCreateAssets = true };
foreach (var f in files)
    group.QueueReplace(Path.GetFileNameWithoutExtension(f), File.ReadAllText(f));
var r1 = group.Import();
if (!r1.Successful)
    throw new Exception("Co-op code failed to compile:\n" + r1.PrintAllErrors(false));

// The code entry an object event actually runs. Event bindings, not file names, are the truth:
// this mod has orphaned entries whose names look like live events.
string BoundCode(string objName, string eventName, uint subtype)
{
    var obj = Data.GameObjects.ByName(objName) ?? throw new Exception("no object " + objName);
    var ev = obj.Events[(int)Enum.Parse<EventType>(eventName)].FirstOrDefault(e => e.EventSubtype == subtype)
        ?? throw new Exception($"{objName} has no {eventName}_{subtype} event");
    return ev.Actions[0].CodeId.Name.Content;
}

var hooks = new CodeImportGroup(Data) { ThrowOnNoOpFindReplace = true };
hooks.QueueAppend("gml_Script_script458", "\nscrCoopInit();\n");  // global_init ends by bootstrapping co-op
var hookFiles = Directory.GetFiles(hookDir, "*.gml").OrderBy(f => f).ToArray();
foreach (var f in hookFiles)
{
    var p = Path.GetFileNameWithoutExtension(f).Split('.');
    // "script.<name>.0.<mode>" hooks a script instead of an object event.
    string code = p[0] == "script" ? "gml_Script_" + p[1] : BoundCode(p[0], p[1], uint.Parse(p[2]));
    string text = File.ReadAllText(f);
    switch (p[3])
    {
        case "prepend": hooks.QueuePrepend(code, text); break;
        case "append": hooks.QueueAppend(code, text); break;
        case "replace-level0":
            // The whole "if (level == 0) { repeat (4) { ...draw item... } }" block, up to the line
            // that follows it in the original Step.
            hooks.QueueRegexFindReplace(code,
                @"if \(level == 0\)\r?\n\{\r?\n    repeat \(4\)[\s\S]*?\r?\n\}\r?\n(?=draw_set_blend_mode\(bm_normal\);\r?\ni = 10;)",
                text);
            break;
        case "findreplace":
        case "findreplace-x":
        case "findreplace-y":
            // File: <exact text from the decompiled event>, a line "//@@REPLACE@@", <replacement>.
            var parts = text.Replace("\r\n", "\n").Split(new[] { "\n//@@REPLACE@@\n" }, StringSplitOptions.None);
            if (parts.Length != 2) throw new Exception("findreplace hook needs one //@@REPLACE@@ line: " + f);
            hooks.QueueFindReplace(code, parts[0].TrimEnd('\n'), parts[1].TrimEnd('\n'));
            break;
        default: throw new Exception("unknown hook mode in " + f);
    }
    ScriptMessage($"hook {p[3]} -> {code}");
}
// Enemy AI retargeting (see ai_retarget.txt and scrCoopTarget).
var aiScripts = File.ReadAllLines(Path.Combine(root, "coop", "patch", "ai_retarget.txt"))
    .Select(l => l.Trim()).Where(l => l.Length > 0 && !l.StartsWith("#")).ToArray();
foreach (var s in aiScripts)
{
    // "@object.Event.subtype" = an object event (resolved through the bindings), otherwise a script name.
    string code;
    if (s.StartsWith("@"))
    {
        var q = s.Substring(1).Split('.');
        code = BoundCode(q[0], q[1], uint.Parse(q[2]));
    }
    else
    {
        code = "gml_Script_" + s;
    }
    // Hooks fail on no-op replacements, so only queue what the original source (decompiled/) contains.
    string src = File.ReadAllText(Path.Combine(root, "decompiled", "CodeEntries", code + ".gml"));
    if (System.Text.RegularExpressions.Regex.IsMatch(src, @"\bobjPlayer\.x\b"))
        hooks.QueueRegexFindReplace(code, @"\bobjPlayer\.x\b", "global.coop_tx");
    if (System.Text.RegularExpressions.Regex.IsMatch(src, @"\bobjPlayer\.y\b"))
        hooks.QueueRegexFindReplace(code, @"\bobjPlayer\.y\b", "global.coop_ty");
    // Safe only because these entries use objPlayer for nothing else (checked, see ai_retarget.txt): enemies
    // keep hunting the partner while the host's player is dead.
    if (src.Contains("instance_exists(objPlayer)"))
        hooks.QueueRegexFindReplace(code, @"\binstance_exists\(objPlayer\)", "scrCoopHasTarget()");
    hooks.QueuePrepend(code, "scrCoopTarget();\n");
}
ScriptMessage($"AI retarget: {aiScripts.Length} scripts");
// Special enemies (see ai_retarget_special.txt).
var special = File.ReadAllLines(Path.Combine(root, "coop", "patch", "ai_retarget_special.txt"))
    .Select(l => l.Trim()).Where(l => l.Length > 0 && !l.StartsWith("#")).ToArray();
const string NotWrite = @"(?!\s*[-+*/]?=(?!=))";  // not followed by an assignment (== / != / <= / >= are reads)
foreach (var line in special)
{
    var parts2 = line.Split(' ');
    var q = parts2[0].Substring(1).Split('.');
    string code = BoundCode(q[0], q[1], uint.Parse(q[2]));
    string src = File.ReadAllText(Path.Combine(root, "decompiled", "CodeEntries", code + ".gml"));
    string rx = @"\bobjPlayer\.x\b" + NotWrite, ry = @"\bobjPlayer\.y\b" + NotWrite;
    // Fields this event writes anywhere stay on the host for reads too (e.g. save/restore of persistent).
    var written = System.Text.RegularExpressions.Regex.Matches(src, @"\bobjPlayer\.([A-Za-z_][A-Za-z0-9_]*)\s*[-+*/]?=(?!=)")
        .Cast<System.Text.RegularExpressions.Match>().Select(m => m.Groups[1].Value).Distinct().ToList();
    string keep = string.Join("", written.Select(w => "|" + w + @"\b"));
    string rf = @"\bobjPlayer\.(?!x\b|y\b" + keep + @")([A-Za-z_][A-Za-z0-9_]*)\b" + NotWrite;
    if (System.Text.RegularExpressions.Regex.IsMatch(src, rx)) hooks.QueueRegexFindReplace(code, rx, "global.coop_tx");
    if (System.Text.RegularExpressions.Regex.IsMatch(src, ry)) hooks.QueueRegexFindReplace(code, ry, "global.coop_ty");
    if (System.Text.RegularExpressions.Regex.IsMatch(src, rf)) hooks.QueueRegexFindReplace(code, rf, "global.coop_tinst.$1");
    if (parts2[1] == "full" && src.Contains("instance_exists(objPlayer)"))
        hooks.QueueRegexFindReplace(code, @"\binstance_exists\(objPlayer\)", "scrCoopHasTarget()");
    hooks.QueuePrepend(code, "scrCoopTarget();\n");
}
ScriptMessage($"AI retarget (special): {special.Length} events");

var r2 = hooks.Import();
if (!r2.Successful)
    throw new Exception("Hooks failed to compile:\n" + r2.PrintAllErrors(false));

// This runner build (GMS 1.0.0.1763) crashes on var locals used inside with() ("trying to index a variable
// which is not an array"); the game's own code never does it. Refuse to build co-op code that does.
foreach (var f in files)
{
    var code = Data.Code.ByName(Path.GetFileNameWithoutExtension(f));
    int depth = 0;
    foreach (var l in code.Disassemble(Data.Variables, Data.CodeLocals?.For(code)).Split('\n').Select(s => s.Trim()))
    {
        if (l.StartsWith("pushenv")) depth++;
        else if (l.StartsWith("popenv")) depth = Math.Max(0, depth - 1);
        else if (depth > 0 && l.Contains("local.") && !l.Contains("local.arguments"))
            throw new Exception($"{code.Name.Content}: var local used inside with(): {l}");
    }
}

// Report what was created.
ScriptMessage($"Imported {files.Length} co-op code files and {hookFiles.Length + 1} hooks.");
foreach (var s in files.Select(Path.GetFileNameWithoutExtension).Where(n => n.StartsWith("gml_Script_")))
    ScriptMessage("script " + s.Substring(11) + ": " + (Data.Scripts.ByName(s.Substring(11)) != null));
net = Data.GameObjects.ByName("objCoopNet");
for (int t = 0; t < net.Events.Count; t++)
    foreach (var e in net.Events[t])
        ScriptMessage($"objCoopNet {(EventType)t}_{e.EventSubtype} -> {e.Actions.FirstOrDefault()?.CodeId?.Name?.Content}");
ScriptMessage($"objCoopNet persistent={net.Persistent} visible={net.Visible} depth={net.Depth}");
