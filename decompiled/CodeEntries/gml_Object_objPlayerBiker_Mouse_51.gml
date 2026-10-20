if (place_meeting(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir), objSecretMask))
{
    with (objSecretMask)
    {
        if (room == rmNoodleShop)
        {
            global.masks[17] = 1;
            global.newmask[global.newmasks] = 17;
            global.newmasks += 1;
            audio_play_sound(sndToken, 0, false);
            my_id = instance_create(x, y, objLetterFound);
            my_id.text = '"' + scrMaskGetName(17) + '"';
            instance_destroy();
        }
    }
    exit;
}
if (global.xbox == 1)
{
    exit;
}
if (reload > 0)
{
    exit;
}
if (ammo <= 0)
{
    exit;
}
if (sprite_index == sprMCWalkNoHelmet)
{
    exit;
}
if (sprite_index == sprBikerWalkWounded || global.CleaverSteel == 0)
{
    exit;
}
reload = 30;
if (sprite_index == sprBikerWalkHealed)
{
    sprite_index = choose(sprBikerThrowKnifeUnmasked, sprBikerThrowKnife2Unmasked);
}
else
{
    sprite_index = choose(sprBoss2ThrowKnife, sprBikerAttackKnife);
}
image_speed = 0.5;
ammo -= 1;
my_id = instance_create(x, y, objThrowingKnife);
global.dir = dir;
with (my_id)
{
    move_contact_solid(global.dir, 12);
}
my_id.direction = dir;
my_id.image_angle = dir;
my_id.speed = 12;
audio_play_sound(sndThrow, 0, false);
