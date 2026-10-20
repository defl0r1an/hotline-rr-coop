if (on == 1)
{
    yy = lerp(yy, 0, speedvhs);
    if (yy <= 6)
    {
        if (wait > 0)
        {
            wait -= 1;
        }
        if (wait == 0)
        {
            audio_sound_pitch(audio_play_sound(sndNeck, 0, false), 1 + random_range(0.25, -0.25));
            soundd += 2;
            wait = 1 + soundd;
        }
        if (round(random(150 - (shake * 70))) == 2)
        {
            objEffector.brus = 2 + floor(random(8));
            if (fotonegativ == 0)
            {
                fotonegativ = 1;
            }
            else
            {
                fotonegativ = 0;
            }
        }
        shake = lerp(shake, 1, 0.15);
        speedvhs = 0.005;
        if (sound == 0)
        {
            audio_play_sound(sndHeadshot, 0, false);
            audio_play_sound(sndHit, 0, false);
            audio_play_sound(sndBonesBreak, 0, false);
            repeat (2)
            {
                my_id = instance_create(x, y + yy, objBloodSquirt);
                my_id.image_angle = random_range(-230, -310);
            }
            repeat (2)
            {
                my_id = instance_create(x, y + yy, objBloodSmoke);
                my_id.direction = random_range(-230, -310);
                my_id.speed = random(3);
                my_id.image_angle = my_id.direction;
            }
            sound = 1;
        }
        if (round(random(100)) == 2)
        {
            audio_play_sound(sndHit, 0, false);
            repeat (2)
            {
                my_id = instance_create(x, y + yy, objBloodSmoke);
                my_id.direction = random_range(-230, -310);
                my_id.speed = random(3);
                my_id.image_angle = my_id.direction;
                Circle += 0.5;
            }
        }
        if (round(random(140)) == 2)
        {
            repeat (2)
            {
                my_id = instance_create(x, y + yy, objBloodSquirt);
                my_id.image_angle = random_range(-230, -310);
                Circle += 1;
            }
        }
        if (round(random(150)) == 2)
        {
            audio_play_sound(sndHit, 0, false);
            audio_play_sound(sndBonesBreak, 0, false);
            my_id = instance_create(x, y + yy, objBrainChunk2);
            my_id.direction = random_range(-230, -310);
            my_id.speed = 2 + random(1);
            my_id.image_angle = my_id.direction;
            Circle += 2.5;
        }
    }
    if (yy <= 0.45)
    {
        audio_play_sound(sndHeadshot, 0, false);
        repeat (4)
        {
            my_id = instance_create(x, y + yy, objBrainChunk2);
            my_id.direction = random_range(-230, -310);
            my_id.speed = 2 + random(1);
            my_id.image_angle = my_id.direction;
        }
        objEffector.brus = 28;
        global.hardmodemasks[27] = 1;
        scrSaveUnlocked();
        audio_play_sound(sndToken, 0, false);
        my_id = instance_create(x, y, objLetterFound);
        my_id.text = '"' + scrMaskGetName(38) + '"';
        SizeCircle = 0;
        Circle = lerp(Circle, SizeCircle, 1);
        on = 2;
        depth = -2;
    }
    else
    {
        Circle = lerp(Circle, SizeCircle, 0.005);
        depth = -9999;
    }
}
else
{
    shake = lerp(shake, 0, 0.25);
}
