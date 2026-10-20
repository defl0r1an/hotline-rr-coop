spr = sprite_add(argument0, argument1, argument2, argument3, argument4, argument5);
ds_map_add(global.loaded_sprites, string_replace(filename_name(argument0), ".png", ""), string(spr));
return spr;
