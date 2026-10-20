global.load_list = ds_list_create();
ds_list_copy(global.load_list, global.bonuslist);
ds_list_clear(global.bonuslist);
ds_list_copy(global.bonuslist, global.load_list);
