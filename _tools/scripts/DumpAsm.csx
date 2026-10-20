// Prints the bytecode of the code entries named in the CODES environment variable.
using System;
using System.Linq;
using UndertaleModLib.Decompiler;
foreach (var n in Environment.GetEnvironmentVariable("CODES").Split(','))
{
    var c = Data.Code.ByName(n);
    ScriptMessage("=== " + n + " locals=" + (Data.CodeLocals?.ByName(n)?.Locals.Count.ToString() ?? "none"));
    ScriptMessage(c.Disassemble(Data.Variables, Data.CodeLocals?.For(c)));
}
