if (global.masks[27] == 1)
{
    masks = 29;
}
else
{
    masks = 28;
}
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
name[masks - 1] = "Random";
i = 0;
repeat (clamp(masks - 1, 0, masks))
{
    MaxSkin[i] = 0;
    i += 1;
}
MaxSkin[0] = 1;
MaxSkin[4] = 1;
MaxSkin[8] = 1;
MaxSkin[9] = 1;
MaxSkin[10] = 1;
MaxSkin[12] = 1;
MaxSkin[14] = 1;
MaxSkin[15] = 1;
MaxSkin[17] = 1;
MaxSkin[18] = 1;
MaxSkin[19] = 1;
MaxSkin[20] = 1;
MaxSkin[23] = 1;
MaxSkin[24] = 1;
MaxSkin[25] = 1;
MaxSkin[26] = 1;
MaxSkin[masks - 1] = 1;
i = 0;
ini_open("options.ini");
repeat (clamp(masks - 1, 0, masks))
{
    global.selectskin[i] = ini_read_real("Skin" + string_repeat("Hard", global.hardmode), name[i], global.hardmode && !MaxSkin[i]);
    i += 1;
}
ini_close();
