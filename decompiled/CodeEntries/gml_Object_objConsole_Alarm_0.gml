if (touch_down)
{
    log_offset += (array_length_1d(log_buffer) - prev_lb_len);
    if (log_offset < 0)
    {
        log_offset = 0;
    }
}
