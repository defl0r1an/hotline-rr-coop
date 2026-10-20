objEffectorHospital.blackout = 26;
objPlayer.active = 1;
objMorgueDoor.solid = 1;
objMorgueDoor.image_index = 0;
objMorgueDoor.image_angle = 0;
objGuardSleep.sprite_index = sprGuardFatSleepDead;
objHospitalSink.image_index = 1;
global.Paranormal = 1;
objСoldMorgue.collision = 1;
my_id = instance_create(318, 247, objElisMagazines);
my_id.image_index = 4;
my_id = instance_create(348, 260, objGuardCap);
my_id.sprite_index = sprGuardCapFat;
my_id = instance_create(385, 302, objBloodWordMorgue);
my_id.image_index = string(sprite_get_number(sprBloodWordMorgue) - 1);
objTableGuard.randomlight = 15;
with (objLight)
{
    instance_destroy();
}
with (objGurneyHospitalDeadBody)
{
    if (image_index == 1)
    {
        image_index = 0;
    }
}
with (objComputerMonitorBlack)
{
    sprite_index = sprComputerMonitorBlackBreak;
    image_index = 0;
    image_speed = 0;
}
with (objGurneyHospital)
{
    if (image_index == 1)
    {
        sprite_index = sprGurneyHospitalBlood;
        image_index = 0;
    }
}
instance_destroy();
