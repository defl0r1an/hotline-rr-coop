// Recompiles a few decompiled entries from source to check the GMS1 (bytecode 15) compiler path,
// and injects a brand-new object to check that new code/assets can be created.
using System.IO;
using System.Linq;
using UndertaleModLib.Compiler;

string dir = Path.Combine(Path.GetDirectoryName(FilePath), "..", "decompiled", "CodeEntries");
string[] names = { "gml_Object_objPlayerMouse_Create_0", "gml_Object_objPlayerMouse_Step_0", "gml_Object_objEnemy_Step_0" };

var group = new CodeImportGroup(Data) { AutoCreateAssets = true };
foreach (var n in names)
    group.QueueReplace(n, File.ReadAllText(Path.Combine(dir, n + ".gml")));
group.QueueReplace("gml_Object_objCoopProbe_Create_0",
    "global.coop_probe = external_define(\"coop.dll\", \"coop_version\", dll_cdecl, ty_real, 0);\n" +
    "var b = buffer_create(64, buffer_grow, 1);\n" +
    "show_debug_message(\"probe \" + string(b));");
var result = group.Import();
foreach (var p in result.GetType().GetProperties())
    ScriptMessage("Import result." + p.Name + " = " + p.GetValue(result));
foreach (var m in result.GetType().GetMethods().Where(m => m.Name.Contains("Error") && m.GetParameters().Length <= 1 && m.ReturnType == typeof(string)))
    ScriptMessage(m.Name + ": " + m.Invoke(result, m.GetParameters().Length == 0 ? null : new object[] { false }));
var probe = Data.GameObjects.ByName("objCoopProbe");
ScriptMessage("objCoopProbe exists: " + (probe != null));
foreach (var n in names)
{
    var code = Data.Code.ByName(n);
    ScriptMessage(n + " instructions=" + code?.Instructions.Count);
}
