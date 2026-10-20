masks = 29;
name[0] = "Richard";
name[1] = "Rasmus";
name[2] = "Tony";
name[3] = "Aubrey";
name[4] = "Don Juan";
name[5] = "Graham";
name[6] = "Dennis";
name[7] = "George";
name[8] = "Ted";
name[9] = "Rufus";
name[10] = "Rami";
name[11] = "Willem";
name[12] = "Peter";
name[13] = "Zack";
name[14] = "Oscar";
name[15] = "Rick";
name[16] = "Brandon";
name[17] = "Charlie";
name[18] = "Louie";
name[19] = "Phil";
name[20] = "Nigel";
name[21] = "Earl";
name[22] = "Jones";
name[23] = "Carl";
name[24] = "Jake";
name[25] = "Richter";
name[26] = "Russell";
name[27] = "Igel";
global.loaded_sprites = ds_map_create();
global.skins = ds_list_create();
i = 0;
repeat (masks)
{
    global.selectskin[i] = 0;
    i++;
}
if (!directory_exists(working_directory + "Custom_Skin"))
{
    directory_create(working_directory + "Custom_Skin");
}
for (k = 0; k < (masks - 1); k++)
{
    ds_list_add(global.skins, ds_list_create());
    if (!directory_exists(working_directory + "Custom_Skin\" + name[k]))
    {
        directory_create(working_directory + "Custom_Skin\" + name[k]);
    }
    else
    {
        filename = file_find_first(working_directory + "Custom_Skin\" + name[k] + "\*.png", 0);
        while (filename != "")
        {
            fname = string_replace(filename_name(filename), ".png", "");
            index = real(string_char_at(fname, string_length(filename) - 4));
            if (index > (ds_list_size(ds_list_find_value(global.skins, k)) - 1))
            {
                ds_list_add(ds_list_find_value(global.skins, k), ds_map_create());
            }
            for (l = 0; l < 5; l++)
            {
                iname = "None";
                switch (string_letters(fname))
                {
                    case "Big":
                        iname = "Big";
                        ix = 55;
                        iy = 65;
                        break;
                    case "Mask":
                        iname = "Mask";
                        ix = 9;
                        iy = 8;
                        break;
                    case "Icon":
                        iname = "Icon";
                        ix = 16;
                        iy = 16;
                        break;
                    case "Slip":
                        iname = "Slip";
                        ix = 9;
                        iy = 8;
                        break;
                    case "DropFront":
                        iname = "DropFront";
                        ix = 8;
                        iy = 8;
                        break;
                    case "DropBack":
                        iname = "DropBack";
                        ix = 8;
                        iy = 8;
                        break;
                    default:
                        name = "None";
                        break;
                }
                if (name != "None")
                {
                    ds_map_add(ds_list_find_value(ds_list_find_value(global.skins, k), index), iname, sprite_add(working_directory + "Custom_Skin\" + name[k] + "\" + filename, 1, false, false, ix, iy));
                }
            }
            filename = file_find_next();
        }
        file_find_close();
    }
}
