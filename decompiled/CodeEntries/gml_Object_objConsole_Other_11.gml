cheat = 0;
cmd = string_split(consoleCleanString(keyboard_string, cleanup_input), " ");
switch (cmd[0])
{
    case "help":
        if (array_length_1d(cmd) == 1)
        {
            for (i = 0; i < array_length_1d(cmd_list); i++)
            {
                cl_print(" " + cmd_list[i], 16777215);
            }
        }
        else
        {
            help_cmd_index = array_find_first(cmd_list, cmd[1]);
            if (help_cmd_index == -1)
            {
                cl_print("Cannot find command " + str_brack(cmd[1]), 255);
            }
            else
            {
                cl_print(cmd_usage[help_cmd_index], 65535);
                for (i = 0; i < array_length_2d(cmd_desc, help_cmd_index); i++)
                {
                    cl_print(" " + cmd_desc[help_cmd_index, i], 16777215);
                }
            }
        }
        break;
    case "check_mem":
        cl_print(string(round(external_call(global.get_mem_func) * 0.0009765625)) + " KB", 16777215);
        break;
    case "spawnmenu":
        if (!instance_exists(objSpawnMenu))
        {
            instance_create(0, 0, objSpawnMenu);
            cl_print("WIP: Spawn menu enabled, categories ctrl + arrows, items arrows, tools and physgun are a bit broken", 16777215);
            cl_print("WIP: F1 go to rmConstructStuff, F2 play paris, F3 to play Crystals, F4 go to previous room from rmConstructStuff", 16777215);
        }
        else
        {
            cl_print("You already have spawn menu enabled", 255);
        }
        cheat = 1;
        break;
    case "hardcursor":
        if (global.funny == 0)
        {
            global.funny = 2;
        }
        else
        {
            global.funny = 0;
        }
        break;
    case "room_history":
        for (i = 0; i < rooms_entered; i++)
        {
            cl_print(string(i) + ". " + room_get_name(string(ds_list_find_value(rooms_list_entered, i))), 16777215);
        }
        break;
    case "clean_mem":
        cl_print(string(round(external_call(global.clean_mem_func) * 0.0009765625)) + " KB has been cleaned", 16777215);
        break;
    case "hesoyam":
        cl_print("There should be big boom, so here's some text for you :)", 65535);
        instance_create(1032, mouse_x, mouse_y);
        break;
    case "wtf":
        global.wtf = consoleSwitchCommand("wtf is not", cmd);
        break;
    case "showother":
        F3 = consoleSwitchCommand("other text on left is", cmd);
        break;
    case "rpg":
        cl_print("It's all over", 65535);
        my_id = instance_create(global.mousex, global.mousey, objWeapon);
        my_id.image_index = 52;
        cheat = 1;
        break;
    case "mask":
        if (array_length_1d(cmd) < 2)
        {
            i = 0;
        }
        else if (consoleCheckArg(cmd[1], 0))
        {
            exit;
        }
        else
        {
            i = parse_num(cmd[1]);
        }
        global.maskindex = i;
        cheat = 1;
        break;
    case "timescale":
        if (array_length_1d(cmd) < 2)
        {
            i = 1;
        }
        else if (consoleCheckArg(cmd[1], 0))
        {
            exit;
        }
        else
        {
            i = parse_num(cmd[1]);
        }
        if (i >= 1 && i < 300)
        {
            game_set_speed(60, gamespeed_fps);
            room_speed = 60;
        }
        break;
    case "setammo":
        if (instance_exists(objPlayer))
        {
            if (array_length_1d(cmd) < 2)
            {
                o = 98;
            }
            else if (consoleCheckArg(cmd[1], 0))
            {
                exit;
            }
            else
            {
                o = parse_num(cmd[1]);
            }
        }
        cheat = 1;
        objPlayer.ammo = o;
        break;
    case "score":
        if (instance_exists(objPlayer))
        {
            if (array_length_1d(cmd) < 2)
            {
                i = 98;
            }
            else if (consoleCheckArg(cmd[1], 0))
            {
                exit;
            }
            else
            {
                i = parse_num(cmd[1]);
            }
        }
        cl_print("Lmao it's only visual", 8421504);
        global.myscore = i;
        break;
    case "teleport":
        if (instance_exists(objPlayer))
        {
            objPlayer.x = global.mousex;
            objPlayer.y = global.mousey;
        }
        else
        {
            cl_print("There's no player, are you dumb?", 255);
        }
        cheat = 1;
        break;
    case "player":
        if (instance_exists(objPlayer))
        {
            if (array_length_1d(cmd) < 2)
            {
                i = 98;
            }
            else if (consoleCheckArg(cmd[1], 0))
            {
                exit;
            }
            else
            {
                i = parse_num(cmd[1]);
            }
            cx = objPlayer.x;
            cy = objPlayer.y;
            with (objPlayer)
            {
                instance_destroy();
            }
            switch (i)
            {
                case 3:
                    instance_create(cx, cy, objPlayerBikerHouse);
                    break;
                case 2:
                    instance_create(cx, cy, objPlayerBiker);
                    break;
                case 1:
                    instance_create(cx, cy, objPlayerMouseHouse);
                    break;
                case 4:
                    instance_create(cx, cy, objPlayerWoag);
                    break;
                case 5:
                    instance_create(cx, cy, objPigButcher);
                    break;
                case 0:
                    instance_create(cx, cy, objPlayerMouse);
                    break;
            }
        }
        else
        {
            cl_print("We need player", 255);
        }
        cheat = 1;
        break;
    case "death":
        if (instance_exists(objPlayer))
        {
            instance_create(objPlayer.x, objPlayer.y, objEBullet);
        }
        else
        {
            cl_print("HOW WILL YOU KILL SOMETHING THAT YOU DON'T HAVE?", 255);
        }
        break;
    case "killthemall":
        if (instance_exists(objEnemy) || instance_exists(objWaiter) || instance_exists(objFatmanEating) || instance_exists(objFatmanTelephone))
        {
            other.temp = 0;
            if (instance_exists(objFatmanTelephone))
            {
                with (objFatmanTelephone)
                {
                    other.temp++;
                    sprite_index = sprDeputyFatmanTelephoneDie;
                }
            }
            if (instance_exists(objFatmanEating))
            {
                with (objFatmanEating)
                {
                    other.temp++;
                    sprite_index = sprDeputyFatmanEatingDie;
                }
            }
            if (instance_exists(objWaiter))
            {
                with (objWaiter)
                {
                    other.temp++;
                    instance_destroy();
                }
            }
            with (objEnemy)
            {
                other.temp++;
                instance_destroy();
            }
            cl_print(string(temp) + " Must Die. LOL.", 255);
        }
        else
        {
            cl_print("There's nothing we can do...", 16777215);
        }
        cheat = 1;
        break;
    case "object":
        cheat = 1;
        if (array_length_1d(cmd) < 2)
        {
            cmd[1] = "count";
        }
        switch (cmd[1])
        {
            case "list":
                for (i = 0; i < instance_count; i++)
                {
                    j = instance_id_get(i);
                    cl_print(string(i) + ". " + object_get_name(j.object_index), 16777215);
                }
                break;
            case "exists":
                j = asset_get_index(cmd[2]);
                if (j == -1 || !object_exists(j))
                {
                    cl_print("Invalid object name" + str_brack(cmd[2]), 255);
                    exit;
                }
                if (instance_exists(j))
                {
                    cl_print("Exists! Great!", 32768);
                }
                else
                {
                    cl_print("Doesn't Exists! Not Great!", 255);
                }
                break;
            case "count":
                if (array_length_1d(cmd) < 3)
                {
                    cl_print(string(instance_count) + " objects", 16777215);
                    exit;
                }
                else if (is_numeric(cmd[2]))
                {
                    j = instance_id_get(parse_num(cmd[2]));
                    if (!instance_exists(j))
                    {
                        cl_print("Instance with ID " + cmd[2] + " does not exist", 255);
                        exit;
                    }
                    j = j.object_index;
                }
                else
                {
                    j = asset_get_index(cmd[2]);
                    if (j == -1 || !object_exists(j))
                    {
                        cl_print("Invalid object name" + str_brack(cmd[2]), 255);
                        exit;
                    }
                }
                cl_print(string(instance_number(j)) + " instances of" + str_brack(object_get_name(j)), 16777215);
                break;
            case "setvar":
                cheat = 1;
                if (array_length_1d(cmd) < 6)
                {
                    cl_print("You need to specify object name, var name, type and value of variable", 255);
                    cl_print("(At least 4 arguments)", 255);
                    exit;
                }
                switch (cmd[4])
                {
                    case "string":
                        i = cmd[5];
                        break;
                    case "number":
                        if (!consoleCheckArg(cmd[5], 0))
                        {
                            i = parse_num(cmd[5]);
                        }
                        break;
                    case "bool":
                        if (!consoleCheckArg(cmd[5], 1))
                        {
                            i = parse_bool(cmd[5]);
                        }
                        break;
                    case "array":
                        i = parse_array(cmd[5]);
                        break;
                    case "asset":
                        i = asset_get_index(cmd[4]);
                        if (i == -1)
                        {
                            cl_print("No asset with name" + str_brack(cmd[4]), 255);
                            exit;
                        }
                        break;
                    case "instance":
                        i = consoleObjectValid(cmd);
                        if (i == -1010)
                        {
                            exit;
                        }
                        break;
                    default:
                        cl_print("No such variable type as" + str_brack(cmd[4]), 255);
                        exit;
                }
                j = consoleObjectValid(cmd[2]);
                if (j == -1010)
                {
                    exit;
                }
                if (array_length_1d(cmd) < 7)
                {
                    with (j)
                    {
                        variable_local_set(cmd[3], i);
                    }
                }
                else
                {
                    if (consoleCheckArg(cmd[6], 0))
                    {
                        exit;
                    }
                    with (j)
                    {
                        if (variable_local_exists(cmd[3]))
                        {
                            if (is_array(variable_local_get(cmd[3])))
                            {
                                k = parse_num(cmd[6]);
                                if (k > -1 && array_length_1d(variable_local_get(cmd[3])) <= k)
                                {
                                    variable_local_array_set(cmd[3], k, i);
                                }
                                else
                                {
                                    c_print("Provided index [" + cmd[6] + "] is out of range of " + cmd[3], 255);
                                }
                            }
                            else
                            {
                                c_print(cmd[3] + " is not an array", 255);
                            }
                        }
                        else
                        {
                            c_print(str_brack(cmd[3]) + " does not exist in object" + str_brack(object_get_name(object_index)), 255);
                        }
                    }
                }
                break;
            case "getvar":
                if (array_length_1d(cmd) < 3)
                {
                    cl_print("You need to specify object name");
                    exit;
                }
                j = consoleObjectValid(cmd[2]);
                if (j == -1010)
                {
                    exit;
                }
                with (j)
                {
                    if (variable_local_exists(cmd[3]))
                    {
                        c_print(object_get_name(object_index) + "." + cmd[3] + " = " + string(variable_local_get(cmd[3])), 16777215);
                    }
                    else
                    {
                        c_print(str_brack(cmd[3]) + " does not exist in object" + str_brack(object_get_name(object_index)), 255);
                    }
                }
                break;
            case "destroy":
                j = consoleObjectValid(cmd[2]);
                if (j == -1010)
                {
                    exit;
                }
                with (j)
                {
                    instance_destroy();
                }
            case "spawn":
                if (array_length_1d(cmd) < 3)
                {
                    i = 1139;
                }
                else if (is_numeric(cmd[2]))
                {
                    i = parse_num(cmd[2]);
                }
                else
                {
                    i = asset_get_index(cmd[2]);
                    if (i == -1)
                    {
                        cl_print("Invalid object name" + str_brack(cmd[2]), 255);
                        exit;
                    }
                }
                if (object_exists(i))
                {
                    instance_create(global.mousex, global.mousey, i);
                    break;
                }
                else
                {
                    cl_print("Cannot find object ID " + string(i));
                    if (array_length_1d(cmd) < 3)
                    {
                        cl_print("You need to specify object name");
                        exit;
                    }
                    j = consoleObjectValid(cmd[2]);
                    if (j == -1010)
                    {
                        exit;
                    }
                    cl_print(object_get_name(j.object_index) + " [" + cmd[2] + "] {" + string(id) + "}", 65535);
                    if (object_get_parent(j.object_index) > -1)
                    {
                        cl_print("Parent:  " + object_get_name(object_get_parent(j.object_index)), 16777215);
                    }
                    cl_print("Postion: < " + string(j.x) + " ; " + string(j.y) + " >", 16777215);
                    if (j.sprite_index > -1)
                    {
                        cl_print("Sprite: " + object_get_name(j.sprite_index), 16777215);
                    }
                    if (object_get_sprite(j) > -1)
                    {
                        cl_print("  Default sprite: " + object_get_name(object_get_sprite(j)), 16777215);
                    }
                    if (j.mask_index > -1)
                    {
                        cl_print("Mask: " + object_get_name(j.mask_index), 16777215);
                    }
                    if (object_get_mask(j) > -1)
                    {
                        cl_print("  Default mask: " + object_get_name(object_get_mask(j)), 16777215);
                    }
                    cl_print("Visible: " + str_bool(j.visible) + " [" + str_bool(object_get_visible(j.object_index)) + "]", 16777215);
                    cl_print("Solid: " + str_bool(j.solid) + " [" + str_bool(object_get_solid(j.object_index)) + "]", 16777215);
                    cl_print("Persistent: " + str_bool(j.persistent) + " [" + str_bool(object_get_persistent(j.object_index)) + "]", 16777215);
                    k = variable_instance_get_names(j);
                    cl_print("Internal vars [" + string(array_length_1d(k)) + "]:", 65535);
                    for (i = 0; i < array_length_1d(k); i++)
                    {
                        with (j)
                        {
                            c_print("  " + k[i] + " = " + string(variable_local_get(k[i])), 16777215);
                        }
                    }
                    break;
                }
            case "info":
                if (array_length_1d(cmd) < 3)
                {
                    cl_print("You need to specify object name");
                    exit;
                }
                j = consoleObjectValid(cmd[2]);
                if (j == -1010)
                {
                    exit;
                }
                cl_print(object_get_name(j.object_index) + " [" + cmd[2] + "] {" + string(id) + "}", 65535);
                if (object_get_parent(j.object_index) > -1)
                {
                    cl_print("Parent:  " + object_get_name(object_get_parent(j.object_index)), 16777215);
                }
                cl_print("Postion: < " + string(j.x) + " ; " + string(j.y) + " >", 16777215);
                if (j.sprite_index > -1)
                {
                    cl_print("Sprite: " + object_get_name(j.sprite_index), 16777215);
                }
                if (object_get_sprite(j) > -1)
                {
                    cl_print("  Default sprite: " + object_get_name(object_get_sprite(j)), 16777215);
                }
                if (j.mask_index > -1)
                {
                    cl_print("Mask: " + object_get_name(j.mask_index), 16777215);
                }
                if (object_get_mask(j) > -1)
                {
                    cl_print("  Default mask: " + object_get_name(object_get_mask(j)), 16777215);
                }
                cl_print("Visible: " + str_bool(j.visible) + " [" + str_bool(object_get_visible(j.object_index)) + "]", 16777215);
                cl_print("Solid: " + str_bool(j.solid) + " [" + str_bool(object_get_solid(j.object_index)) + "]", 16777215);
                cl_print("Persistent: " + str_bool(j.persistent) + " [" + str_bool(object_get_persistent(j.object_index)) + "]", 16777215);
                k = variable_instance_get_names(j);
                cl_print("Internal vars [" + string(array_length_1d(k)) + "]:", 65535);
                for (i = 0; i < array_length_1d(k); i++)
                {
                    with (j)
                    {
                        c_print("  " + k[i] + " = " + string(variable_local_get(k[i])), 16777215);
                    }
                }
                break;
            default:
                if (string_length(cmd[1]) == 0)
                {
                    cl_print("Specify action first", 255);
                }
                else
                {
                    cl_print("No such action" + str_brack(cmd[1]), 255);
                }
                break;
        }
        break;
    case "global":
        cheat = 1;
        if (array_length_1d(cmd) < 2)
        {
            cmd[1] = "list";
        }
        switch (cmd[1])
        {
            case "setvar":
                if (array_length_1d(cmd) < 5)
                {
                    cl_print("You need to specify name, type and value of variable (3 arguments)", 255);
                    exit;
                }
                switch (cmd[3])
                {
                    case "string":
                        i = cmd[4];
                        break;
                    case "number":
                        if (!consoleCheckArg(cmd[4], 0))
                        {
                            i = parse_num(cmd[4]);
                        }
                        break;
                    case "bool":
                        if (!consoleCheckArg(cmd[4], 0))
                        {
                            i = parse_bool(cmd[4]);
                        }
                        break;
                    case "array":
                        i = parse_array(cmd[4]);
                        break;
                    case "asset":
                        i = asset_get_index(cmd[4]);
                        if (i == -1)
                        {
                            cl_print("No asset with name" + str_brack(cmd[4]), 255);
                            exit;
                        }
                        break;
                    case "instance":
                        i = consoleObjectValid(cmd);
                        if (i == -1010)
                        {
                            exit;
                        }
                        break;
                    default:
                        cl_print("No such variable type as" + str_brack(cmd[3]), 255);
                        exit;
                }
                if (array_length_1d(cmd) < 6)
                {
                    variable_global_set(cmd[3], i);
                }
                else
                {
                    if (consoleCheckArg(cmd[5], 0))
                    {
                        exit;
                    }
                    with (j)
                    {
                        if (variable_global_exists(cmd[3]))
                        {
                            if (is_array(variable_global_get(cmd[3])))
                            {
                                k = parse_num(cmd[5]);
                                if (k > -1 && array_length_1d(variable_global_get(cmd[3])) <= k)
                                {
                                    variable_global_array_set(cmd[2], k, i);
                                }
                                else
                                {
                                    c_print("Provided index [" + cmd[5] + "] is out of range of" + str_brack(cmd[2]), 255);
                                }
                            }
                            else
                            {
                                c_print(cmd[2] + " is not an array", 255);
                            }
                        }
                        else
                        {
                            c_print(cmd[2] + "does not exist in global scope", 255);
                        }
                    }
                }
                break;
            case "getvar":
                if (variable_global_exists(cmd[3]))
                {
                    c_print("global." + cmd[3] + " = " + string(variable_global_get(cmd[3])), 16777215);
                }
                else
                {
                    c_print(cmd[3] + " does not exist in global scope", 255);
                }
                break;
            case "list":
                cl_print("Not Implemented Yet", 255);
                break;
            default:
                if (string_length(cmd[1]) == 0)
                {
                    cl_print("Specify action first", 255);
                }
                else
                {
                    cl_print("No such action" + str_brack(cmd[1]), 255);
                }
                break;
        }
        break;
    case "level":
        cheat = 1;
        print_color = 255;
        if (array_length_1d(cmd) < 2)
        {
            cmd[1] = "list";
        }
        switch (cmd[1])
        {
            case "list":
                for (r = room_first; room_exists(r); r++)
                {
                    if (room == r)
                    {
                        i = 65535;
                    }
                    else
                    {
                        i = 16777215;
                    }
                    cl_print(string(r) + ". " + room_get_name(r), i);
                }
                break;
            case "next":
                room_goto_next();
                break;
            case "prev":
                room_goto_previous();
                break;
            case "curr":
                cl_print(string(room) + ". " + room_get_name(room), 65535);
                break;
            case "restart":
                room_restart();
                break;
            default:
                if (is_numeric(cmd[1]))
                {
                    r = parse_num(cmd[1]);
                    if (room_exists(r))
                    {
                        room_goto(r);
                    }
                    else
                    {
                        cl_print("Invalid room ID", 255);
                        exit;
                    }
                }
                else
                {
                    r = asset_get_index(cmd[1]);
                    if (r > -1 && room_exists(r))
                    {
                        room_goto(r);
                    }
                    else
                    {
                        cl_print("Invalid room name", 255);
                    }
                }
                break;
        }
        break;
    case "font":
        if (array_length_1d(cmd) < 2)
        {
            cl_print(font_get_name(font) + "  '" + font_get_fontname(font) + "'", 16777215);
            exit;
        }
        if (cmd[1] == "LIST")
        {
            for (f = 0; font_exists(f); f++)
            {
                cl_print(string(f) + ". " + font_get_name(f) + " [" + font_get_fontname(f) + "]", 16777215);
            }
            exit;
        }
        if (is_numeric(cmd[1]))
        {
            f = parse_num(cmd[1]);
        }
        else
        {
            f = asset_get_index(cmd[1]);
        }
        if (f > -1)
        {
            if (font_exists(f))
            {
                font = f;
            }
            else
            {
                cl_print("No font with ID " + string(f));
            }
            break;
        }
        else
        {
            cl_print("Invalid asset name or ID", 255);
            break;
        }
    case "font_size":
        if (array_length_1d(cmd) < 2)
        {
            cl_print(string(font_size), 16777215);
            exit;
        }
        if (consoleCheckArg(cmd[1], 0))
        {
            exit;
        }
        font_size = parse_num(cmd[1]);
        break;
    case "pihon":
        game_end();
        break;
    case "exit":
        console_mode = 0;
        global.player_lock = 0;
        cmd_saved = "";
        break;
    case "print":
        if (array_length_1d(cmd) < 2)
        {
            k = "Hello World!";
        }
        else
        {
            k = cmd[1];
        }
        if (array_length_1d(cmd) < 3)
        {
            o = 1;
        }
        else
        {
            if (consoleCheckArg(cmd[2], 0))
            {
                exit;
            }
            o = parse_num(cmd[2]);
        }
        if (array_length_1d(cmd) < 4)
        {
            j = 16777215;
        }
        else
        {
            if (consoleCheckArg(cmd[3], 0))
            {
                exit;
            }
            j = parse_num(cmd[3]);
        }
        for (i = 0; i < o; i++)
        {
            cl_print(k, j);
        }
        break;
    case "cprefs":
        if (array_length_1d(cmd) < 2)
        {
            cl_print("Font: " + font_get_name(font), 16777215);
            cl_print("Font size: " + string(font_size), 16777215);
            cl_print("Command auto suggestions:" + str_bool(cmd_suggestions), 16777215);
            cl_print("Log timestamps: " + str_bool(log_timing), 16777215);
            cl_print("Cleanup spaces in input: " + str_bool(cleanup_input), 16777215);
        }
        switch (cmd[1])
        {
            case "save":
                h = file_text_open_write(cpref_fn);
                file_text_write_real(h, font);
                file_text_write_real(h, font_size);
                file_text_write_real(h, cmd_suggestions);
                file_text_write_real(h, log_timing);
                file_text_write_real(h, cleanup_input);
                file_text_close(h);
                break;
            case "reset":
                font = 1;
                font_size = 1;
                cmd_suggestions = 1;
                log_timing = 0;
                cleanup_input = 1;
                if (file_exists(cpref_fn))
                {
                    file_delete(cpref_fn);
                }
                break;
        }
        break;
    case "woag":
        message_text_font("arial", 16, make_color_rgb(irandom(255), irandom(255), irandom(255)), 0);
        message_alpha(0.5);
        message_mouse_color(65280);
        message_size(900, 900);
        message_background(19);
        message_button(292);
        message_caption(0, "WOAG! WOAG! WOAG!");
        show_message("⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡶⠄⢰⠁⠸⡀⠀⠀⠀
⠀⠀⠀⠀⠀⣠⠔⠉⠉⠈⢹⠃⠀⠙⣄⢈⣦⡀⠳⠊⢳⠀
⠀⠀⣠⠤⠒⠷⢤⡀⠀⠀⡇⠀⡠⡪⢻⢿⢦⢊⠙⡖⢎⠀
⢠⠮⠯⡄⠀⠀⠀⠈⠳⡄⢩⠀⡇⡇⡏⠀⡿⢯⣱⣷⡺⠀
⢸⡀⠀⡗⠀⠀⠀⠀⠀⠈⠲⢇⡄⢇⡇⢸⠄⢸⠫⢭⣩⠆
⠘⣏⠉⠁⠀⠀⠀⠀⠀⠀⠀⠈⠳⡜⢇⠀⠀⢸⠀⠀⠀⠀
⠀⠘⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⣈⡓⢟⡒⣮⠀⠀⠀⠀
⠀⠀⠀⠙⠢⢄⠀⢦⠤⡸⡤⠒⢛⠿⡉⠢⢽⣗⡶⢓⣆⠀
⠀⠀⠀⠀⠀⠀⠉⠠⠑⢵⠌⠢⣱⠀⢹⠀⠀⢯⠀⣈⢓⡇
⠀⠀⠀⠀⠀⠀⠀⠀⠙⠄⠈⠦⠠⠴⠋⠀⠀⠈⠓⡘⠋⠀");
        break;
    case "outofmemory":
        if (!global.strah)
        {
            message_caption(1, "Out of memory!");
            show_message("Out Of Memory!");
            game_end();
        }
        else
        {
            show_error("
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@5777777777?5G#&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&Y77777777777?YG#@@@@@@#&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&#?7777777777777?B&@&&PG@@@@@@@@@&&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@GG5777777777777777?5Y??#B###&@@@@Y@&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Y77777777777777777777777777?JJY5YJ&@@&B@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@&BGP5Y777777777777777777777777777777777?Y5PBB&@@@@@@@&#GPP5555PGB&@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@GJ777777777777777777777777777777777777777777Y5G&@@@#PY?7!!!!!!!!!7?YG&@@@@@@@@
@@@@@@@@@@@@@@@@@@&&#P777777777777777777777777777777777777777777777!GB#&G?!!!!!7777777!!!!7Y&@@@@@@@
@@@@@@@@@@@@@@@@&&YBBYJJYYYYYJ??777777777777??7??JJJJJYYJJJYYY555Y?JB&BJ7!!777777777777777!?&@@@@@@@
@@@@@@@@@@@@@@@@&&PJ77777?7??JYYYJY55YJY5Y5YYYJJJJJJ???77777777775#&B57!!77777777777777!!!75&@@@@@@@
@@#P5YJJJJY55P&GY?!!!!!!!!!!!!!!!7777????555YYYJ!!!!!!!!!!!!!!!!!7J?7!!7777777777777!!!!?YB&@@@@@@@@
GY?!!!!!!!!!!JP7!!YPPPY77777777!!!!!!!!!?GBGGGGY!!777777777777777!!!!!77777777777!!!!?YG#@@@@@@@@@@@
!!!!!777777!!J5777PGGG57!7777777777!7777?JYY55J???777777777777777777777777777!!!!7J5G&@@@@@@@@@@@@@@
!!!!7777777777BY7!7???7Y?!777777777J!!!!77777777777777777777777!!!7777777!!!!7?5PB&@@@@@@@@@@@@@@@@@
Y?77!!!!!!7777#Y77!!7YPYY?!!!!!!!!!PJ??77!!!!!!!!!77777777777777?7!!!!!!!!7?J5G&@@@@@@@@@@@@@@@@@@@@
@&BG5J777!!!7J#?777755?5G?77!77777777?J5Y77777777!!7777777777777Y55YJJJJY55YJ7BYYB@@@@@@@@@@@@@@@@@@
@@@@@@&##GP?!7P57777777??JJJPYJJJ???77!?J7777777777!77777777777!!7?J#G????7!75P7!7J#&@@@@@@@@@@@@@@@
@@@@@@@@@@@P7YPY7777!!!!!?YY57!!!!!!!!!!!!!!!!!!!JB?!!!!777777777!!!?P5!!!!77J!!7J5&&@@@@@@@@@@@@@@@
@@@@@@@@@@BGPY7!!!!!!!!!!!77!777???????????7777777YPY7!!!!!!!!!77777!7Y777!!!!?PG&@@@@@@@@@@@@@@@@@@
@@@@@@@@&GJ@J77777??77????J55Y5#BYYB5YGBYYYP55GPJ??YGPYY??7?777777777!!!!!!7?5&@@@@@@@@@@@@@@@@@@@@@
@@@@@@@&Y77?Y5G#&#GP#&PP&@@@BB#@@##&&#@@##&#PY77777777777?J5JY?777777!!!!?5#&@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@&J!77J5YYB#5J#P5G@@@@@@@@@@@@@@@&BYJ7!!!!7?7!!!!!!!!!!!!7777!!!75G&@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@&&GPYJ?5PG&B5B#&@@&&@@&@@@BB&B5J7!!!7??Y55J7!7?JYY77!!!77!!!7JP#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@&#Y?!!7BGP#PP&&5PPJJ#GPPG5J??7!7?JJYYYJ??7?YYYJ??77777!!!!?5B&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@&J!!!!!7JJYJYPG55YJ?JJ777??JJ?55JJ?7!7??JYJJ77!!!!!!!!7JYG&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@&GJ7!!!!!!!!!!7???JJ??JY555Y?77!!7?JJY5?77!!!77!!!!7?5B&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@&##BBPPP55GGPP5J???7777!!77??JJ5Y?77!!!!!!!!!77J5B&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@B77?J55J7???????YPP5?77!!!!!!!!!777?JB#&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@&&G5J???????????????7???J5555PPPGB#&&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@&&###############&&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
", 0);
        }
        break;
    case "save_logs":
        j = date_datetime_string(date_current_datetime());
        if (!directory_exists(working_directory + "\logs"))
        {
            directory_create(working_directory + "\logs");
        }
        if (array_length_1d(cmd) < 2)
        {
            cmd[1] = "log-" + string_replace_all(string_replace_all(string_replace_all(j, ".", "-"), ",", "-"), ":", "-");
        }
        h = file_text_open_write(working_directory + "\logs\" + cmd[1] + ".log");
        file_text_write_string(h, "--- " + j + " ---");
        for (i = 0; i < array_length_1d(log_buffer); i++)
        {
            file_text_write_string(h, "#" + str_num(log_color_buffer[i], 16) + " " + log_buffer[i]);
        }
        cl_print("Saved to " + working_directory + "\logs\" + cmd[1] + ".log", 16777215);
        break;
    case "app_title":
        if (array_length_1d(cmd) < 2)
        {
            cl_print("You need to specify the title", 255);
        }
        else
        {
            set_application_title(cmd[1]);
        }
        break;
    case "god":
        cheat = 1;
        global.god = consoleSwitchCommand("God", cmd);
        break;
    case "notarget":
        cheat = 1;
        global.notarget = consoleSwitchCommand("Notarget", cmd);
        break;
    case "noclip":
        cheat = 1;
        if (consoleGaming())
        {
            exit;
        }
        noclip = !consoleSwitchCommand("Noclip", cmd);
        event_user(2);
        break;
    case "debug":
        global.strah = consoleSwitchCommand("IT IS", cmd);
        if (global.strah)
        {
            listplayer();
            sxeasy_play(global.panic);
            if (!instance_exists(object1488) && instance_exists(objPlayer))
            {
                instance_create(objPlayer.x, objPlayer.y, object1488);
            }
        }
        else
        {
            sxeasy_stop(0);
            sxeasy_play(string(scrGetSong()));
            with (object1488)
            {
                instance_destroy();
            }
        }
        break;
    case "music_stop":
        sxeasy_stop(0);
        break;
    case "music_play":
        if (array_length_1d(cmd) < 2)
        {
            cl_print("You need to specify the audio file name");
            exit;
        }
        o = working_directory + cmd[1];
        if (file_exists(o))
        {
            sxeasy_play(o);
            cl_print("Succesfully loaded music!", 32768);
        }
        else
        {
            cl_print("File doesn't exist or it's not an .ogg", 255);
        }
        cl_print(o, 65535);
        break;
    case "change_sprite":
        cheat = 1;
        if (array_length_1d(cmd) < 3)
        {
            cl_print("You need to specify object and sprite");
        }
        else if (is_numeric(cmd[2]))
        {
            o = parse_num(cmd[2]);
        }
        else
        {
            o = asset_get_index(cmd[2]);
            if (o == -1)
            {
                cl_print("No asset with name" + str_brack(cmd[2]));
                exit;
            }
        }
        if (!sprite_exists(o))
        {
            cl_print("Sprite with index" + str_brack(string(o)) + " does not exist");
            exit;
        }
        j = consoleObjectValid(cmd[1]);
        if (j == -1010)
        {
            exit;
        }
        j.sprite_index = o;
        break;
    case "key":
        if (array_length_1d(cmd) < 2)
        {
            cmd[1] = "keylist";
        }
        switch (cmd[1])
        {
            case "keylist":
                cl_print("All usual keys like from A - Z and ( - ?", 16777215);
                cl_print("F1 ... F12", 16777215);
                cl_print("NUMPAD0 ... NUMPAD9", 16777215);
                i = ds_map_find_first(bind_spec_keys);
                while (i != ds_map_find_last(bind_spec_keys))
                {
                    cl_print(i, 16777215);
                    i = ds_map_find_next(bind_spec_keys, i);
                }
                break;
            case "list":
                if (ds_map_empty(bind_binds))
                {
                    cl_print("No binds have been created yet", 65535);
                    exit;
                }
                i = ds_map_find_first(bind_binds);
                while (1)
                {
                    if (i > 111 && i < 124)
                    {
                        o = "F" + string(i - 111);
                    }
                    else if (i > 95 && i < 106)
                    {
                        o = "NUMPAD" + string(i - 96);
                    }
                    else
                    {
                        o = chr(i);
                    }
                    cl_print(o + ":" + str_brack(ds_map_find_value(bind_binds, i)), 16777215);
                    if (i == ds_map_find_last(bind_binds))
                    {
                        exit;
                    }
                    else
                    {
                        i = ds_map_find_next(bind_binds, i);
                    }
                }
                break;
            case "bind":
                if (array_length_1d(cmd) < 4)
                {
                    cl_print("You need to specify key and command", 255);
                    exit;
                }
                j = consoleGetKey(cmd[2]);
                if (j == -1)
                {
                    cl_print("No key " + str_brack(cmd[2]), 255);
                    exit;
                }
                o = "";
                for (i = 3; i < array_length_1d(cmd); i++)
                {
                    o += (cmd[i] + " ");
                }
                ds_map_replace(bind_binds, j, o);
                break;
            case "unbind":
                if (array_length_1d(cmd) < 3)
                {
                    cl_print("You need to specify key to delete bind from", 255);
                    exit;
                }
                j = consoleGetKey(cmd[2]);
                if (j == -1)
                {
                    exit;
                }
                if (ds_map_exists(bind_binds, j))
                {
                    ds_map_delete(bind_binds, j);
                }
                else
                {
                    cl_print("No bind with key" + str_brack(cmd[2]), 255);
                }
                break;
            case "save":
                h = file_text_open_write(bind_file);
                file_text_write_string(h, ds_map_write(bind_binds));
                file_text_close(h);
                break;
            case "load":
                h = file_text_open_read(bind_file);
                ds_map_read(bind_binds, file_text_read_string(h));
                file_text_close(h);
                break;
            case "remove_save":
                if (file_exists(bind_file))
                {
                    file_delete(bind_file);
                    cl_print("Removed binds save file", 65280);
                }
                else
                {
                    cl_print("There was no binds file", 255);
                }
                cl_print(bind_file, 16777215);
                break;
            case "clear":
                ds_map_clear(bind_binds);
                cl_print("Binds have been cleared", 65280);
                break;
            default:
                cl_print("No action" + str_brack(cmd[1]), 255);
                break;
        }
        break;
    case "sillybilly":
        cheat = 1;
        if (consoleGaming())
        {
            exit;
        }
        if (instance_exists(objEnemy))
        {
            objEnemy.sprite_index = sprEWalkUnarmed;
        }
        cl_print("Sillied all Billies", 65280);
        break;
    case "suggestions":
        cmd_suggestions = consoleSwitchCommand("Suggestions", cmd);
        break;
    case "log_time":
        log_timing = consoleSwitchCommand("Time logging", cmd);
        break;
    case "cleanup_input":
        cleanup_input = consoleSwitchCommand("Cleanup input", cmd);
        break;
    case "swat":
        if (instance_exists(objSwatOpenDoor))
        {
            with (objSwatOpenDoor)
            {
                state = 1;
                vspeed = 1;
                visible = true;
            }
            with (objLaser)
            {
                on = 1;
            }
        }
        else
        {
            cl_print("There is no swat to summon", 255);
        }
        break;
    case "":
        break;
    default:
        cl_print("No such command" + str_brack(cmd[0]), 255);
        break;
}
if (global.cheater == 0 && cheat == 1)
{
    scrSetRasmusEvent(choose("Cheater!", "I like playing dirty", "What do we have here?"), 10, 75);
    cl_print("CHEATS USED, ACHIEVEMENTS DISABLED", 255);
    global.cheater = 1;
}
