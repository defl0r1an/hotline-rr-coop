i = 0;
repeat (28)
{
    global.usedmask[i] = 0;
    i += 1;
}
i = 0;
repeat (18)
{
    global.usedgun[i] = 0;
    i += 1;
}
i = 0;
repeat (21)
{
    global.usedmelee[i] = 0;
    i += 1;
}
i = 0;
repeat (7)
{
    global.usedthrow[i] = 0;
    i += 1;
}
i = 0;
repeat (51)
{
    global.usedkill[i] = 0;
    i += 1;
}
i = 0;
repeat (8)
{
    global.cameradestroy[i] = 0;
    i += 1;
}
i = 0;
if (!file_exists(working_directory + "\achievements.dat"))
{
    file = file_text_open_write(working_directory + "\achievements.dat");
    repeat (28)
    {
        file_text_write_string(file, "0");
    }
    file_text_writeln(file);
    repeat (18)
    {
        file_text_write_string(file, "0");
    }
    file_text_writeln(file);
    repeat (21)
    {
        file_text_write_string(file, "0");
    }
    file_text_writeln(file);
    repeat (7)
    {
        file_text_write_string(file, "0");
    }
    file_text_writeln(file);
    repeat (51)
    {
        file_text_write_string(file, "0");
    }
    file_text_writeln(file);
    repeat (8)
    {
        file_text_write_string(file, "0");
    }
    file_text_close(file);
}
else
{
    file = file_text_open_read(working_directory + "\achievements.dat");
    masks = file_text_read_string(file);
    i = 0;
    repeat (string_length(masks))
    {
        global.usedmask[i] = real(string_char_at(masks, i + 1));
        i += 1;
    }
    file_text_readln(file);
    guns = file_text_read_string(file);
    i = 0;
    repeat (string_length(guns))
    {
        global.usedgun[i] = real(string_char_at(guns, i + 1));
        i += 1;
    }
    file_text_readln(file);
    melee = file_text_read_string(file);
    i = 0;
    repeat (string_length(melee))
    {
        global.usedmelee[i] = real(string_char_at(melee, i + 1));
        i += 1;
    }
    file_text_readln(file);
    throws = file_text_read_string(file);
    i = 0;
    repeat (string_length(throws))
    {
        global.usedthrow[i] = real(string_char_at(throws, i + 1));
        i += 1;
    }
    file_text_readln(file);
    kills = file_text_read_string(file);
    i = 0;
    repeat (string_length(kills))
    {
        global.usedkill[i] = real(string_char_at(kills, i + 1));
        i += 1;
    }
    file_text_readln(file);
    camera = file_text_read_string(file);
    i = 0;
    repeat (string_length(camera))
    {
        global.cameradestroy[i] = real(string_char_at(camera, i + 1));
        i += 1;
    }
    file_text_close(file);
}
