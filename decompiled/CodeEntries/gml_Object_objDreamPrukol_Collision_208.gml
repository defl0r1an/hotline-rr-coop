global.my_id = id;
audio_play_sound(sndGrunt, 1, false);
energie -= 1;
with (objBullet)
{
    if (place_meeting(x, y, global.my_id))
    {
        my_id = instance_create(x, y, objSmokeHit);
        my_id.color1 = 8421504;
        my_id.color2 = 4210752;
        my_id.image_angle = image_angle;
        my_id.direction = image_angle;
        my_id.speed = random(1);
        if (object_index != objBulletSkippyLaser)
        {
            instance_destroy();
        }
        alert = 1;
    }
}
