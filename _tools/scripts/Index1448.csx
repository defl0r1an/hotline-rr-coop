// Which assets share index 1448 / 1449 (the new objects' indices)?
foreach (int i in new[] { 1448, 1449 })
{
    ScriptMessage($"{i}: sprite={(i < Data.Sprites.Count ? Data.Sprites[i].Name.Content : "-")} sound={(i < Data.Sounds.Count ? Data.Sounds[i].Name.Content : "-")} script={(i < Data.Scripts.Count ? Data.Scripts[i].Name.Content : "-")}");
}
