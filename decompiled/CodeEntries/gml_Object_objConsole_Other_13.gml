if (keyboard_string == "")
{
    exit;
}
var l = array_length_1d(cmd_buffer);
for (var i = 0; i < l; i++)
{
    if (cmd_buffer[i] == keyboard_string)
    {
        exit;
    }
}
cmd_buffer[l] = keyboard_string;
