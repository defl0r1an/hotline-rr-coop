text = "FLOOR CLEARED";
addx = 44;
i = 0;
on = 1;
alarm[0] = 100;
i = 0;
repeat (11)
{
    addy[i] = 0;
    lvisible[i] = 1;
    i += 1;
}
current = 10;
surface = surface_create(global.viewwview, global.viewhview);
surface_set_target(surface);
draw_clear_alpha(c_black, 0);
surface_reset_target();
blink = 0;
audio_play_sound(sndFloorCleared, 0, false);
scrSetRasmusEvent(choose("Keep going", "Isnt that enough for you?", "I know you liked it", "Lets not waste any time"), 1, 15);
