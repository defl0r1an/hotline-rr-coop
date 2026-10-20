if (global.maskon != 1 || global.maskindex != 27)
{
    exit;
}
if (global.trailspawn > 0)
{
    global.trailspawn -= 1;
}
global.flicker += global.flickerspeed;
global.DebuffSkippySpeed = clamp(global.BuffSkippy, 0.15, 0.5);
global.flickerCharge += (global.chargeSkippy + (global.GlowCharge * 12));
global.DebuffSkippy = lerp(global.DebuffSkippy, 0, global.DebuffSkippySpeed);
if (global.soundDebuff == 0 && global.DebuffSkippy <= 0 && global.powerIgel == 0 && instance_exists(objPlayer) && objPlayer.sprite_index != sprPWalkThrow)
{
    audio_play_sound(sndSkippyReadyShootMedium, 0, false);
    global.GlowDebuff = 5;
    global.soundDebuff = 1;
}
else
{
    global.GlowDebuff = lerp(global.GlowDebuff, 0, 0.15);
}
if (global.GlowSkippyEnd == 1)
{
    global.PShaking = 0;
    global.flickerspeed = lerp(global.flickerspeed, 7, 0.25);
    exit;
}
if (!instance_exists(objBackgroundColor))
{
    exit;
}
switch (objBackgroundColor.lifeIgel)
{
    case 4:
        global.PShaking = 0;
        global.GlowSkippy = lerp(global.GlowSkippy, 0, 0.05);
        global.flickerspeed = lerp(global.flickerspeed, 0.15, 0.05);
        break;
    case 3:
        global.PShaking = random_range(-0.5, 0.5);
        global.GlowSkippy = lerp(global.GlowSkippy, 0.25, 0.05);
        global.flickerspeed = lerp(global.flickerspeed, 1, 0.05);
        break;
    case 2:
        global.PShaking = random_range(-0.75, 0.75);
        global.GlowSkippy = lerp(global.GlowSkippy, 0.75, 0.05);
        global.flickerspeed = lerp(global.flickerspeed, 2.5, 0.15);
        break;
    case 1:
        global.PShaking = random_range(-1, 1);
        global.GlowSkippy = lerp(global.GlowSkippy, 1, 0.05);
        global.flickerspeed = lerp(global.flickerspeed, 5, 0.25);
        break;
    case 0:
        global.deadIgel = 1;
        objBackgroundColor.lifeIgel = -1;
        audio_stop_sound(sndFlameThrower);
        break;
    default:
        global.GlowSkippy = lerp(global.GlowSkippy, 0, 0.25);
        global.PShaking = random_range(-1.5, 1.5);
        break;
}
