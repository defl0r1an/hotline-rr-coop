global.mouse = 0;
global.key = 0;
log_buffer[0] = "[UP/DOWN] to view history;  [UP/DOWN] + [CTRL] to scroll;  [ENTER] to send command";
log_buffer[1] = "Type 'help' to see list of commands";
log_color_buffer[0] = 65535;
log_color_buffer[1] = 16777215;
log_offset = 0;
cmd_buffer[0] = "";
cmd_selector = 0;
cmd_saved = "";
cmd_suggested = "";
scmd_states = ds_map_create();
console_mode = 0;
noclip = 1;
touch_down = 0;
keyboard_prev = "";
prev_lb_len = 0;
keys_timer_max = 30;
nav_keys_timer = keys_timer_max;
cursor_keys_timer = keys_timer_max;
cursor_main_pos = 0;
global.pause = 0;
global.wtf = 0;
cursor_sel_pos = 0;
r_offset = 5;
init_y_offset = 5;
line_sep = 2;
interloper2 = 0;
cmd_prefix = "> ";
console_height = display_get_height() * 0.5;
console_width = display_get_width();
ls_ch = console_height + line_sep;
rooms_entered = 0;
myspeed = 0;
rooms_list_entered = ds_list_create();
consoleInitDocs();
consoleInitSpecKeys();
cpref_fn = working_directory + "console_prefs.txt";
if (file_exists(cpref_fn))
{
    h = file_text_open_write(cpref_fn);
    font = file_text_read_real(h);
    font_size = file_text_read_real(h);
    cmd_suggestions = file_text_read_real(h);
    log_timing = file_text_read_real(h);
    cleanup_input = file_text_read_real(h);
    file_text_close(h);
}
else
{
    font = 1;
    font_size = 2;
    cmd_suggestions = 1;
    log_timing = 0;
    cleanup_input = 0;
}
ds_map_add(scmd_states, "Suggestions", cmd_suggestions);
ds_map_add(scmd_states, "Time logging", log_timing);
ds_map_add(scmd_states, "Cleanup input", cleanup_input);
timer_s = 0;
timer_m = 0;
timer_h = 0;
timer_ms = 0;
F3 = 0;
