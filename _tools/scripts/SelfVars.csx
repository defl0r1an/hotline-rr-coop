// For the scripts in CODES: instance variables read on self outside with-blocks, on other inside with-blocks,
// and scripts called outside with-blocks (they run with the same self).
using System;
using System.Linq;
using System.Collections.Generic;
foreach (var n in Environment.GetEnvironmentVariable("CODES").Split(','))
{
    var c = Data.Code.ByName(n);
    var selfVars = new SortedSet<string>(); var otherVars = new SortedSet<string>(); var calls = new SortedSet<string>();
    int depth = 0;
    foreach (var raw in c.Disassemble(Data.Variables, Data.CodeLocals?.For(c)).Split('\n'))
    {
        var l = raw.Trim();
        if (l.StartsWith("pushenv")) { depth++; continue; }
        if (l.StartsWith("popenv")) { depth = Math.Max(0, depth - 1); continue; }
        var m = System.Text.RegularExpressions.Regex.Match(l, @"^(push|pop)[a-z]*\.[a-z.]*\s+(?:\[[a-z]+\])?(self|other)\.([A-Za-z_][A-Za-z0-9_]*)");
        if (m.Success)
        {
            if (m.Groups[2].Value == "self" && depth == 0) selfVars.Add(m.Groups[1].Value + ":" + m.Groups[3].Value);
            if (m.Groups[2].Value == "other" && depth > 0) otherVars.Add(m.Groups[1].Value + ":" + m.Groups[3].Value);
        }
        var k = System.Text.RegularExpressions.Regex.Match(l, @"^call\.i (scr[A-Za-z0-9_]+)\(");
        if (k.Success && depth == 0) calls.Add(k.Groups[1].Value);
    }
    ScriptMessage("== " + n);
    ScriptMessage("self(depth0): " + string.Join(" ", selfVars));
    ScriptMessage("other(in with): " + string.Join(" ", otherVars));
    ScriptMessage("calls(depth0): " + string.Join(" ", calls));
}
