if (file_exists(working_directory + "\achievements.dat"))
{
    file_delete(working_directory + "\achievements.dat");
}
file = file_text_open_write(working_directory + "\achievements.dat");
i = 0;
repeat (28)
{
    file_text_write_string(file, string(global.usedmask[i]));
    i += 1;
}
file_text_writeln(file);
i = 0;
repeat (18)
{
    file_text_write_string(file, string(global.usedgun[i]));
    i += 1;
}
file_text_writeln(file);
i = 0;
repeat (21)
{
    file_text_write_string(file, string(global.usedmelee[i]));
    i += 1;
}
file_text_writeln(file);
i = 0;
repeat (7)
{
    file_text_write_string(file, string(global.usedthrow[i]));
    i += 1;
}
file_text_writeln(file);
i = 0;
repeat (51)
{
    file_text_write_string(file, string(global.usedkill[i]));
    i += 1;
}
file_text_writeln(file);
i = 0;
repeat (8)
{
    file_text_write_string(file, string(global.cameradestroy[i]));
    i += 1;
}
file_text_close(file);
