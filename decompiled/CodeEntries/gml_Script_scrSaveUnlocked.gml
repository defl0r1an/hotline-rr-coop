file_delete(working_directory + "\saves.dat");
file = file_text_open_write(working_directory + "\saves.dat");
i = 0;
test = "";
file_text_write_string(file, "Masks:");
file_text_writeln(file);
repeat (28)
{
    test += string(global.masks[i]);
    i += 1;
}
file_text_write_string(file, test);
file_text_writeln(file);
i = 0;
test = "";
file_text_write_string(file, "Masks Hardmode:");
file_text_writeln(file);
repeat (28)
{
    test += string(global.hardmodemasks[i]);
    i += 1;
}
file_text_write_string(file, test);
file_text_writeln(file);
i = 0;
test = "";
file_text_write_string(file, "Levels:");
file_text_writeln(file);
repeat (24)
{
    test += string(global.levels[i]);
    i += 1;
}
file_text_write_string(file, test);
file_text_writeln(file);
i = 0;
test = "";
file_text_write_string(file, "New guns:");
file_text_writeln(file);
repeat (16)
{
    test += string(global.newgun[i]);
    i += 1;
}
file_text_write_string(file, test);
file_text_writeln(file);
i = 0;
test = "";
file_text_write_string(file, "Letters:");
file_text_writeln(file);
repeat (16)
{
    test += string(global.letter[i]);
    i += 1;
}
file_text_write_string(file, test);
file_text_writeln(file);
file_text_write_string(file, "Total Score:");
file_text_writeln(file);
file_text_write_string(file, string(global.totalscore));
i = 0;
file_text_writeln(file);
file_text_write_string(file, "Grades Normal:");
repeat (24)
{
    file_text_writeln(file);
    file_text_write_string(file, string(global.grade[i]));
    i += 1;
}
i = 0;
file_text_writeln(file);
file_text_write_string(file, "Grades Hardmode:");
repeat (24)
{
    file_text_writeln(file);
    file_text_write_string(file, string(global.hardmodegrade[i]));
    i += 1;
}
i = 0;
file_text_writeln(file);
file_text_write_string(file, "Highscore Normal:");
repeat (24)
{
    file_text_writeln(file);
    file_text_write_string(file, string(global.highscore[i]));
    i += 1;
}
i = 0;
file_text_writeln(file);
file_text_write_string(file, "Highscore Hardmode:");
repeat (24)
{
    file_text_writeln(file);
    file_text_write_string(file, string(global.hardmodehighscore[i]));
    i += 1;
}
i = 0;
file_text_writeln(file);
file_text_write_string(file, "Past Saved:");
repeat (7)
{
    file_text_writeln(file);
    file_text_write_string(file, string(global.PastSaved[i]));
    i += 1;
}
file_text_writeln(file);
file_text_write_string(file, "Puzzle Done:");
file_text_writeln(file);
file_text_write_string(file, string(global.puzzledone));
file_text_writeln(file);
file_text_write_string(file, "Biker Mask Save:");
file_text_writeln(file);
file_text_write_string(file, string(global.masksavedbiker));
file_text_writeln(file);
i = 0;
test = "";
file_text_write_string(file, "Biker Kills:");
file_text_writeln(file);
repeat (4)
{
    test += string(global.bikerKills[i]);
    i += 1;
}
file_text_write_string(file, test);
file_text_writeln(file);
file_text_write_string(file, "Puzzle Igel:");
file_text_writeln(file);
file_text_write_string(file, string(global.puzzleIgel));
file_text_close(file);
