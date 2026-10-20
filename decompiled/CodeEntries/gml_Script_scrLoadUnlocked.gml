global.masks[0] = 1;
i = 1;
repeat (26)
{
    global.masks[i] = 0;
    i += 1;
}
i = 1;
global.hardmodemasks[0] = 1;
i = 1;
repeat (26)
{
    global.hardmodemasks[i] = 0;
    i += 1;
}
i = 1;
global.levels[0] = 1;
repeat (24)
{
    global.levels[i] = 0;
    i += 1;
}
i = 0;
repeat (17)
{
    global.newgun[i] = 0;
    i += 1;
}
i = 0;
repeat (16)
{
    global.letter[i] = 0;
    i += 1;
}
i = 0;
repeat (24)
{
    global.grade[i] = 0;
    i += 1;
}
i = 0;
repeat (24)
{
    global.hardmodegrade[i] = 0;
    i += 1;
}
i = 0;
repeat (24)
{
    global.highscore[i] = 0;
    i += 1;
}
i = 0;
repeat (24)
{
    global.hardmodehighscore[i] = 0;
    i += 1;
}
global.totalscore = 0;
global.puzzledone = 0;
i = 0;
repeat (4)
{
    global.bikerKills[i] = 0;
    i += 1;
}
global.puzzleIgel = 0;
if (file_exists(working_directory + "\saves.dat"))
{
    file = file_text_open_read(working_directory + "\saves.dat");
    file_text_readln(file);
    masks = file_text_read_string(file);
    i = 0;
    repeat (string_length(masks))
    {
        global.masks[i] = real(string_char_at(masks, i + 1));
        i += 1;
    }
    file_text_readln(file);
    file_text_readln(file);
    masks = file_text_read_string(file);
    i = 0;
    repeat (string_length(masks))
    {
        global.hardmodemasks[i] = real(string_char_at(masks, i + 1));
        i += 1;
    }
    file_text_readln(file);
    file_text_readln(file);
    levels = file_text_read_string(file);
    i = 0;
    repeat (string_length(levels))
    {
        global.levels[i] = real(string_char_at(levels, i + 1));
        i += 1;
    }
    file_text_readln(file);
    file_text_readln(file);
    newguns = file_text_read_string(file);
    i = 0;
    repeat (string_length(newguns))
    {
        global.newgun[i] = real(string_char_at(newguns, i + 1));
        i += 1;
    }
    file_text_readln(file);
    file_text_readln(file);
    letters = file_text_read_string(file);
    i = 0;
    repeat (string_length(letters))
    {
        global.letter[i] = real(string_char_at(letters, i + 1));
        i += 1;
    }
    file_text_readln(file);
    file_text_readln(file);
    global.totalscore = real(file_text_read_string(file));
    file_text_readln(file);
    i = 0;
    repeat (24)
    {
        file_text_readln(file);
        global.grade[i] = real(file_text_read_string(file));
        i += 1;
    }
    i = 0;
    file_text_readln(file);
    repeat (24)
    {
        file_text_readln(file);
        global.hardmodegrade[i] = real(file_text_read_string(file));
        i += 1;
    }
    i = 0;
    file_text_readln(file);
    repeat (24)
    {
        file_text_readln(file);
        global.highscore[i] = real(file_text_read_string(file));
        i += 1;
    }
    i = 0;
    file_text_readln(file);
    repeat (24)
    {
        file_text_readln(file);
        global.hardmodehighscore[i] = real(file_text_read_string(file));
        i += 1;
    }
    i = 0;
    file_text_readln(file);
    repeat (7)
    {
        file_text_readln(file);
        global.PastSaved[i] = real(file_text_read_string(file));
        i += 1;
    }
    file_text_readln(file);
    file_text_readln(file);
    global.puzzledone = real(file_text_read_string(file));
    file_text_readln(file);
    file_text_readln(file);
    global.masksavedbiker = real(file_text_read_string(file));
    file_text_readln(file);
    i = 0;
    file_text_readln(file);
    kills = file_text_read_string(file);
    repeat (string_length(kills))
    {
        global.bikerKills[i] = real(string_char_at(kills, i + 1));
        i += 1;
    }
    file_text_readln(file);
    file_text_readln(file);
    global.puzzleIgel = real(file_text_read_string(file));
    file_text_close(file);
}
else
{
    file = file_text_open_write(working_directory + "\saves.dat");
    file_text_write_string(file, "Masks:");
    file_text_writeln(file);
    file_text_write_string(file, "1000000000000000000000000000");
    file_text_writeln(file);
    file_text_write_string(file, "Masks Hardmode:");
    file_text_writeln(file);
    file_text_write_string(file, "1000000000000000000000000000");
    file_text_writeln(file);
    file_text_write_string(file, "Levels:");
    file_text_writeln(file);
    file_text_write_string(file, "10000000000000000000");
    file_text_writeln(file);
    file_text_write_string(file, "New Guns:");
    file_text_writeln(file);
    file_text_write_string(file, "0000000000000000");
    file_text_writeln(file);
    file_text_write_string(file, "Letters:");
    file_text_writeln(file);
    file_text_write_string(file, "0000000000000000");
    file_text_writeln(file);
    file_text_write_string(file, "Total Score:");
    file_text_writeln(file);
    file_text_write_string(file, "0");
    file_text_writeln(file);
    file_text_write_string(file, "Grades Normal:");
    repeat (24)
    {
        file_text_writeln(file);
        file_text_write_string(file, "0");
    }
    file_text_writeln(file);
    file_text_write_string(file, "Grades Hardmode:");
    repeat (24)
    {
        file_text_writeln(file);
        file_text_write_string(file, "0");
    }
    file_text_writeln(file);
    file_text_write_string(file, "Highscore Normal:");
    repeat (24)
    {
        file_text_writeln(file);
        file_text_write_string(file, "0");
    }
    file_text_writeln(file);
    file_text_write_string(file, "Highscore Hardmode:");
    repeat (24)
    {
        file_text_writeln(file);
        file_text_write_string(file, "0");
    }
    file_text_writeln(file);
    file_text_write_string(file, "Past Save:");
    repeat (7)
    {
        file_text_writeln(file);
        file_text_write_string(file, "0");
    }
    file_text_writeln(file);
    file_text_write_string(file, "Puzzle Done:");
    file_text_writeln(file);
    file_text_write_string(file, "0");
    file_text_writeln(file);
    file_text_write_string(file, "Biker Mask Save:");
    file_text_writeln(file);
    file_text_write_string(file, "0");
    file_text_writeln(file);
    file_text_write_string(file, "Biker Kills:");
    file_text_writeln(file);
    file_text_write_string(file, "0000");
    file_text_writeln(file);
    file_text_write_string(file, "Puzzle Igel:");
    file_text_writeln(file);
    file_text_write_string(file, "0");
    file_text_close(file);
}
