var time = get_timer() + (argument0 * 1000);
while (!get_timer() >= time)
{
    break;
}
