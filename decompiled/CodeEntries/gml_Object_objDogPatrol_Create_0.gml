scrDogInit();
image_speed = 0;
image_index = random(1000);
speed = 1;
image_speed = 0.1;
energie = 0;
checkreload = floor(random(30));
ammo = 20;
alert = 0;
reload = 13;
light = 0;
start_x = x;
start_y = y;
stopchase = 0;
add = 1;
gotowall = 0;
DirectionFriendDog = image_angle;
if (object_index == objDogPatrolFriend)
{
    global.combo += 1;
    global.combotime = 240;
    global.dogsave += 1;
    textmercy = ".";
}
else
{
    textmercy = "";
}
randomspeedtail = random(0.15);
sound = 0;
NearFriendDog = 0;
