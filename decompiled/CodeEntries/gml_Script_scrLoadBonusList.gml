ds_list_copy(global.bonuslist, global.load_list);
ds_list_destroy(global.load_list);
global.load_list = -1;
