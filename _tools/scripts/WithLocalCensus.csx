// Does the original code ever touch a var local inside a with() block (between pushenv and popenv)?
using System.Linq;
int entries = 0; var examples = new System.Collections.Generic.List<string>();
foreach (var c in Data.Code.Where(c => c.ParentEntry == null))
{
    var lines = c.Disassemble(Data.Variables, Data.CodeLocals?.For(c)).Split('\n').Select(l => l.Trim()).ToArray();
    int depth = 0; bool hit = false;
    foreach (var l in lines)
    {
        if (l.StartsWith("pushenv")) depth++;
        else if (l.StartsWith("popenv")) depth = System.Math.Max(0, depth - 1);
        else if (depth > 0 && l.Contains("local.") && !l.Contains("local.arguments")) hit = true;
    }
    if (hit) { entries++; if (examples.Count < 5) examples.Add(c.Name.Content); }
}
ScriptMessage("entries touching locals inside with: " + entries + " e.g. " + string.Join(", ", examples));
