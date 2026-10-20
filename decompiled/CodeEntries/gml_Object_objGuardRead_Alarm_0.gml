if (!(test == 0 || test == 2))
{
    if (state == "Read")
    {
        state = "Look";
    }
    else if (state == "Look")
    {
        state = "Read";
    }
}
