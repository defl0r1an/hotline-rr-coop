var l = array_length_1d(log_buffer);
if (log_timing)
{
    argument0 = "[" + date_time_string(date_current_time()) + "] " + argument0;
}
log_buffer[l] = argument0;
log_color_buffer[l] = argument1;
