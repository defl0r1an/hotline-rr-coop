if (instance_exists(objPlayerMouse))
{
    exit;
}
if (global.done == 1)
{
    if (place_meeting(x + lengthdir_x(8, image_angle + 90), y + lengthdir_y(8, image_angle + 90), objPlayerBiker))
    {
        if (objPlayerBiker.x > (x - 6) && objPlayerBiker.x < (x + 6))
        {
            if (instance_exists(objEffector))
            {
                objEffector.playeroncareffector = 1;
            }
            if (instance_exists(objEffectorHouse))
            {
                objEffectorHouse.playeroncareffector = 1;
            }
            with (objPlayerBiker)
            {
                instance_destroy();
            }
            if (global.gotbeaten == 1 && room == rmPhoneHomEntranceBiker)
            {
                sprite_index = sprBikerGetOnBikeWounded;
            }
            else if (global.gotbeaten == 1)
            {
                sprite_index = sprBikerGetOnBikeUnmasked;
            }
            else
            {
                sprite_index = sprMCGetOnBike;
            }
        }
    }
    if (place_meeting(x + lengthdir_x(8, image_angle - 90), y + lengthdir_y(8, image_angle - 90), objPlayerBiker))
    {
        if (objPlayerBiker.x > (x - 6) && objPlayerBiker.x < (x + 6))
        {
            if (instance_exists(objEffector))
            {
                objEffector.playeroncareffector = 1;
            }
            if (instance_exists(objEffectorHouse))
            {
                objEffectorHouse.playeroncareffector = 1;
            }
            with (objPlayerBiker)
            {
                instance_destroy();
            }
            if (global.gotbeaten == 1 && room == rmPhoneHomEntranceBiker)
            {
                sprite_index = sprBikerGetOnBikeWounded;
            }
            else if (global.gotbeaten == 1)
            {
                sprite_index = sprBikerGetOnBikeUnmasked;
            }
            else
            {
                sprite_index = sprMCGetOnBike;
            }
            image_yscale = -1;
        }
    }
}
if (sprite_index == sprMCGetOnBike || sprite_index == sprBikerGetOnBikeUnmasked || sprite_index == sprBikerGetOnBikeWounded)
{
    if (image_index < 15)
    {
        image_index += 0.15;
    }
    else if (objEffector.fade == 0)
    {
        audio_play_sound(sndBikeStart, 0, false);
        objEffector.nextroom = scrGetRoom();
        objEffector.newsong = 1;
        objEffector.song = scrGetSong(room);
        objEffector.fade = 1;
        objEffector.next = 1;
    }
}
