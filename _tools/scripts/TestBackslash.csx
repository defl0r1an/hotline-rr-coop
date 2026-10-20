// Checks that recompiling GMS1 code keeps backslashes in string literals as-is (GMS1 has no escapes):
// if the compiler treated "\h" as an escape, it would add a new string without the backslash.
using System.Linq;
using UndertaleModLib.Compiler;

string name = "gml_Object_objTitleNew_KeyPress_13";
int before = Data.Strings.Count;
var g = new CodeImportGroup(Data);
g.QueuePrepend(name, "// probe\n");
var r = g.Import();
ScriptMessage("compiled: " + r.Successful + ", strings " + before + " -> " + Data.Strings.Count);
for (int i = before; i < Data.Strings.Count; i++)
    ScriptMessage("NEW STRING: [" + Data.Strings[i].Content + "]");
foreach (var s in Data.Strings.Where(s => s.Content != null && s.Content.Contains("hardmode")))
    ScriptMessage("existing: [" + s.Content + "]");
