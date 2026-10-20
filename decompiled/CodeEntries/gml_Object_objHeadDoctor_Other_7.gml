if (sprite_index == sprHeadDoctorPickUpStart)
{
    image_index = 0;
    sprite_index = sprHeadDoctorPickUpLoop;
    exit;
}
if (sprite_index == sprHeadDoctorPickUpLoop)
{
    if (searchloop != 5)
    {
        searchloop += 1;
    }
    else
    {
        image_index = 0;
        sprite_index = sprHeadDoctorPickUpEnd;
    }
    exit;
}
if (sprite_index == sprHeadDoctorPointDocument || sprite_index == sprHeadDoctorPoint)
{
    image_speed = 0;
    image_index = -1;
    exit;
}
if (sprite_index == sprHeadDoctorPickUpEnd)
{
    state = "GoToClosetTarget";
    documents = 1;
    sprite_index = sprHeadDoctorWalkDocument;
    closetstart.visible = true;
    direction = -90;
    exit;
}
if (sprite_index == sprHeadDoctorLayDown)
{
    state = "GoToClosetStart";
    documents = 0;
    sprite_index = sprHeadDoctorWalk;
    closetend.visible = true;
    direction = 90;
    exit;
}
if (sprite_index == sprHeadDoctorTypingEnd)
{
    image_index = 8;
    image_speed = 0;
}
if (sprite_index == sprHeadDoctorGetUpSit)
{
    if (global.talkedhospital == 0)
    {
        alarm[1] = 70;
    }
    state = "GoToClosetTarget";
    sprite_index = sprHeadDoctorWalk;
    x += 10;
    closetend.visible = true;
    direction = 90;
    exit;
}
