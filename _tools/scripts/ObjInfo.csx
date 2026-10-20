// Prints the definition of the co-op objects in a data.win.
foreach (var n in new[] { "objCoopNet", "objCoopPuppet", "objLanguage" })
{
    var o = Data.GameObjects.ByName(n);
    if (o == null) { ScriptMessage(n + ": missing"); continue; }
    ScriptMessage($"{n}: index={Data.GameObjects.IndexOf(o)} parent={(o.ParentId?.Name?.Content ?? "null")} sprite={(o.Sprite?.Name?.Content ?? "null")} mask={(o.TextureMaskId?.Name?.Content ?? "null")} persistent={o.Persistent} visible={o.Visible} solid={o.Solid} depth={o.Depth} physics={o.UsesPhysics}");
}
