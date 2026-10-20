if (global.eventupdate)
{
    message = global.eventmessage;
    global.eventupdate = 0;
    global.eventactive = 1;
    global.rasmustalk = 1;
    talkstyle = global.rasmustalkstyle;
    i = 1;
    repeat (string_length(message))
    {
        if (string_char_at(message, i) != "#" && string_char_at(message, i) != " ")
        {
            messagey[i] = 60;
            messagealpha[i] = 0;
        }
        i += 1;
    }
}
if (global.transitionshadow == 1)
{
    shadow0 = lerp(shadow0, 1, 0.35);
    shadow1 = lerp(shadow1, 1, 0.35);
    if (shadow0 >= 1 && shadow1 >= 1)
    {
        global.transitionshadow = 0;
    }
}
else
{
    shadow0 = lerp(shadow0, 0, 0.025);
    shadow1 = lerp(shadow1, 0, 0.005);
}
