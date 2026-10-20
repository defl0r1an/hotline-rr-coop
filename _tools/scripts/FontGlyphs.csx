// Prints which characters the menu fonts can draw.
using System.Linq;
foreach (var name in new[] { "fntBigMenu", "fntDate", "fntMenu", "fntScore" })
{
    var f = Data.Fonts.ByName(name);
    if (f == null) { ScriptMessage(name + ": missing"); continue; }
    var chars = new string(f.Glyphs.Select(g => (char)g.Character).OrderBy(c => c).ToArray());
    ScriptMessage(name + " size=" + f.EmSize + " glyphs=" + f.Glyphs.Count + ": " + chars);
}
