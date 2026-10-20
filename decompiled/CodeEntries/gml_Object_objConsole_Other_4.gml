event_user(2);
if (global.restart == 0)
{
    rooms_entered++;
    ds_list_add(rooms_list_entered, room);
}
external_call(global.clean_mem_func);
game_set_speed(60, gamespeed_fps);
