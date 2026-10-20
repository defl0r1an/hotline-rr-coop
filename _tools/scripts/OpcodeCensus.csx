// Counts which push variants the original compiler used, to see what this runner understands.
using System.Linq;
using System.Collections.Generic;
var counts = new Dictionary<string, int>();
foreach (var c in Data.Code.Where(c => c.ParentEntry == null))
{
    var text = c.Disassemble(Data.Variables, Data.CodeLocals?.For(c));
    foreach (var line in text.Split('\n'))
    {
        var t = line.Trim();
        foreach (var op in new[] { "pushglb.", "pushloc.", "pushbltn.", "pushi.", "push.v self.", "push.v global.", "push.v local.", "push.v [array]", "push.v other." })
            if (t.StartsWith(op)) { counts[op] = counts.TryGetValue(op, out var n) ? n + 1 : 1; }
    }
}
foreach (var kv in counts.OrderByDescending(k => k.Value)) ScriptMessage(kv.Key + " " + kv.Value);
