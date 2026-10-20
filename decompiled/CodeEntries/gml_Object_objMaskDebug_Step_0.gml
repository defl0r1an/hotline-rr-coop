if (keyboard_check_pressed(vk_control))
{
    switch (mode)
    {
        case "Mask Coord":
            mode = "Origin Set";
            break;
        case "Origin Set":
            mode = "Animation";
            break;
        case "Animation":
            mode = "Mask Coord";
            break;
    }
}
if (mode == "Mask Coord")
{
    if (keyboard_check_pressed(vk_add))
    {
        image_index++;
    }
    if (keyboard_check_pressed(vk_subtract))
    {
        image_index--;
    }
    if (keyboard_check_pressed(vk_right))
    {
        d_maskx++;
    }
    if (keyboard_check_pressed(vk_left))
    {
        d_maskx--;
    }
    if (keyboard_check_pressed(vk_down))
    {
        d_masky++;
    }
    if (keyboard_check_pressed(vk_up))
    {
        d_masky--;
    }
    if (keyboard_check_pressed(vk_multiply))
    {
        maskindex = !maskindex;
    }
    if (keyboard_check_pressed(vk_divide))
    {
        if (d_maskangle < 270)
        {
            d_maskangle += 90;
        }
        else
        {
            d_maskangle = 0;
        }
    }
    if (keyboard_check_pressed(vk_space))
    {
        maskx[image_index] = d_maskx;
        masky[image_index] = d_masky;
        maskangle[image_index] = d_maskangle;
        image_index++;
        audio_play_sound(sndPump, 0, false);
    }
    if (keyboard_check_pressed(vk_backspace))
    {
        file = file_text_open_write("result.txt");
        i = 0;
        repeat (array_length_1d(maskx))
        {
            file_text_write_string(file, "maskaddx[" + string(i) + "] = " + string(maskx[i]));
            file_text_writeln(file);
            i++;
        }
        i = 0;
        repeat (array_length_1d(masky))
        {
            file_text_write_string(file, "maskaddy[" + string(i) + "] = " + string(masky[i]));
            file_text_writeln(file);
            i++;
        }
        i = 0;
        repeat (array_length_1d(maskangle))
        {
            file_text_write_string(file, "maskangle[" + string(i) + "] = " + string(maskangle[i]));
            file_text_writeln(file);
            i++;
        }
        audio_play_sound(sndComplete, 0, false);
        file_text_close(file);
    }
}
else if (mode == "Origin Set")
{
    if (keyboard_check_pressed(vk_add))
    {
        rotationspeed++;
    }
    if (keyboard_check_pressed(vk_subtract))
    {
        rotationspeed--;
    }
    if (keyboard_check_pressed(vk_right))
    {
        originx++;
    }
    if (keyboard_check_pressed(vk_left))
    {
        originx--;
    }
    if (keyboard_check_pressed(vk_down))
    {
        originy++;
    }
    if (keyboard_check_pressed(vk_up))
    {
        originy--;
    }
    if (originx != 0 && originy != 0)
    {
        sprite_set_offset(sprite_index, originx, originy);
    }
}
else if (mode == "Animation")
{
    if (keyboard_check_pressed(vk_add))
    {
        image_index++;
        image_speed = 0;
    }
    if (keyboard_check_pressed(vk_subtract))
    {
        image_index--;
        image_speed = 0;
    }
    if (keyboard_check_pressed(vk_right))
    {
        image_speed += 0.05;
    }
    if (keyboard_check_pressed(vk_left))
    {
        image_speed -= 0.05;
    }
    if (keyboard_check_pressed(vk_space))
    {
        if (image_speed != 0)
        {
            image_speed_save = image_speed;
            image_speed = 0;
        }
        else
        {
            image_speed = image_speed_save;
        }
    }
}
if (image_index > image_number)
{
    image_index = 0;
}
