if (sprite_index == sprWallTVBreak)
{
    exit;
}
image_xscale = 3;
image_yscale = 3;
global.my_id = id;
bullets = 0;
with (objBullet)
{
    if (place_meeting(x, y, global.my_id))
    {
        global.my_id.bullets += 1;
        my_id = instance_create(x, y, objSmokeHit);
        my_id.color1 = 8421504;
        my_id.color2 = 4210752;
        my_id.image_angle = image_angle;
        my_id.direction = image_angle;
        my_id.speed = random(1);
        instance_destroy();
        alert = 1;
    }
}
image_xscale = 1;
image_yscale = 1;
if (sprite_index == sprELisWallTV)
{
    global.shake = 3;
    audio_play_sound(sndBottleBreak, 0, false);
    audio_play_sound(sndTaser, 0, false);
    sprite_index = sprWallTVBreak;
    i = 0;
    repeat (12)
    {
        my_id = instance_create(x + lengthdir_x(5, (image_angle - 45) + (i * 7.5)), y + lengthdir_y(5, (image_angle - 45) + (i * 7.5)), objTVShards);
        my_id.direction = (image_angle - 45) + (i * 7.5);
        my_id.speed = 1 + random(3);
        i += 1;
    }
}
