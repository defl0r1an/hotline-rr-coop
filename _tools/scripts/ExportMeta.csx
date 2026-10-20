// Exports object hierarchy/events and room instance lists as plain text for analysis.
using System.IO;
using System.Linq;
using System.Text;

string outDir = Path.Combine(Path.GetDirectoryName(FilePath), "..", "decompiled", "meta");
Directory.CreateDirectory(outDir);

var objs = new StringBuilder();
objs.AppendLine("index\tname\tparent\tsprite\tmask\tdepth\tpersistent\tsolid\tvisible\tevents");
for (int i = 0; i < Data.GameObjects.Count; i++)
{
    var o = Data.GameObjects[i];
    var evs = new List<string>();
    for (int t = 0; t < o.Events.Count; t++)
        foreach (var e in o.Events[t])
            evs.Add(((EventType)t).ToString() + "_" + e.EventSubtype);
    objs.AppendLine(string.Join("\t", i, o.Name?.Content, o.ParentId?.Name?.Content ?? "-",
        o.Sprite?.Name?.Content ?? "-", o.TextureMaskId?.Name?.Content ?? "-",
        o.Depth, o.Persistent, o.Solid, o.Visible, string.Join(",", evs)));
}
File.WriteAllText(Path.Combine(outDir, "objects.tsv"), objs.ToString());

var rooms = new StringBuilder();
for (int r = 0; r < Data.Rooms.Count; r++)
{
    var room = Data.Rooms[r];
    rooms.AppendLine($"=== [{r}] {room.Name?.Content} size={room.Width}x{room.Height} speed={room.Speed} persistent={room.Persistent} creation={room.CreationCodeId?.Name?.Content ?? "-"} views={room.Flags}");
    var counts = new Dictionary<string, int>();
    foreach (var layerInst in room.GameObjects)
    {
        string n = layerInst.ObjectDefinition?.Name?.Content ?? "?";
        counts[n] = counts.TryGetValue(n, out var c) ? c + 1 : 1;
    }
    foreach (var kv in counts.OrderByDescending(k => k.Value))
        rooms.AppendLine($"  {kv.Value}x {kv.Key}");
}
File.WriteAllText(Path.Combine(outDir, "rooms.txt"), rooms.ToString());

var order = new StringBuilder();
order.AppendLine("Room order:");
foreach (var ri in Data.GeneralInfo.RoomOrder) order.AppendLine("  " + ri.Resource?.Name?.Content);
order.AppendLine("Global init scripts:");
foreach (var g in Data.GlobalInitScripts) order.AppendLine("  " + g.Code?.Name?.Content);
order.AppendLine("Scripts:");
foreach (var s in Data.Scripts) order.AppendLine("  " + s.Name?.Content + " -> " + s.Code?.Name?.Content);
order.AppendLine("Functions referenced:");
foreach (var f in Data.Functions) order.AppendLine("  " + f.Name?.Content);
File.WriteAllText(Path.Combine(outDir, "general.txt"), order.ToString());
ScriptMessage("Meta exported to " + outDir);

// Event bindings: which code entry each object event actually runs (file names alone are unreliable in this mod).
var binds = new StringBuilder();
binds.AppendLine("object_index\tobject\tevent\tsubtype\tcode");
for (int i = 0; i < Data.GameObjects.Count; i++)
{
    var o = Data.GameObjects[i];
    for (int t = 0; t < o.Events.Count; t++)
        foreach (var e in o.Events[t])
            foreach (var a in e.Actions)
                binds.AppendLine(string.Join("\t", i, o.Name?.Content, ((EventType)t).ToString(), e.EventSubtype, a.CodeId?.Name?.Content ?? "-"));
}
File.WriteAllText(Path.Combine(outDir, "event_bindings.tsv"), binds.ToString());
var bound = new HashSet<string>();
foreach (var line in binds.ToString().Split('\n').Skip(1)) { var p = line.Split('\t'); if (p.Length == 5) bound.Add(p[4].Trim()); }
var orphans = new StringBuilder();
foreach (var c in Data.Code)
    if (c.Name?.Content != null && c.Name.Content.StartsWith("gml_Object_") && !bound.Contains(c.Name.Content) && c.ParentEntry == null)
        orphans.AppendLine(c.Name.Content);
File.WriteAllText(Path.Combine(outDir, "orphan_object_code.txt"), orphans.ToString());
var opt = Data.Options;
File.WriteAllText(Path.Combine(outDir, "options.txt"), "Info flags: " + opt.Info + "\nGEN8 info: " + Data.GeneralInfo.Info + "\nWindow " + Data.GeneralInfo.DefaultWindowWidth + "x" + Data.GeneralInfo.DefaultWindowHeight + "\n");
ScriptMessage("Bindings exported");
