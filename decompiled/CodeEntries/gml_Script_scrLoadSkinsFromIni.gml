ini_open("options.ini");
i = 0;
repeat (ds_list_size(global.skins))
{
    temp = ini_read_real("Skin", name[i], 0);
    if (temp > (ds_list_size(ds_list_find_value(global.skins, i)) + 1))
    {
        ini_write_real("Skin", name[i], 0);
        global.MissingSkinWarning = 1;
    }
    temp = ini_read_real("SkinHard", name[i], 0);
    if (temp > (ds_list_size(ds_list_find_value(global.skins, i)) + 1))
    {
        ini_write_real("SkinHard", name[i], 0);
        global.MissingSkinWarning = 1;
    }
    i += 1;
}
ini_close();
