friction = 0.1;
rotspeed = (-1 + (round(random(1)) * 2)) * random(8);
startspeed = 0;
dialogue[0] = "It was fast";
dialogue[1] = "Pathetic";
dialogue[2] = "Predictable";
dialogue[3] = "Well...";
dialogue[4] = "Can you just not die?";
dialogue[5] = "Another one";
dialogue[6] = "Why did you die again?";
dialogue[7] = "You know where to click";
dialogue_final[0] = "And now what?";
dialogue_final[1] = "Well I guess its time to say goodbye";
dialogue_final[2] = "But Ill tell you one thing";
emcd = 180 + round(random_range(-60, 60));
dialoguenext = 0;
image_speed = 0;
index = 0;
image_angle = random(360);
alarm[1] = 30 + random(15);
Endlife = 0;
alpha = 0;
wait = 180;
i = 0;
repeat (28)
{
    size[i] = 1 + random(2);
    myx[i] = 0;
    myy[i] = 0;
    mydir[i] = random(360);
    myspeed[i] = 0.5 + random(1.5);
    diradd[i] = -4 + random(8);
    i += 1;
}
