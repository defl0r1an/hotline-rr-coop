// Lists code entries whose bytecode calls the functions named in the FUNCS environment variable.
using System;
using System.Linq;
var names = Environment.GetEnvironmentVariable("FUNCS").Split(',');
foreach (var c in Data.Code.Where(c => c.ParentEntry == null))
{
    var asm = c.Disassemble(Data.Variables, Data.CodeLocals?.For(c));
    foreach (var n in names)
        if (asm.Contains("call.i " + n + "("))
            ScriptMessage(n + " <- " + c.Name.Content);
}
