if (wait > 0)
{
    wait -= 1;
}
if (RandomMaskWait > 0)
{
    RandomMaskWait -= 1;
}
SkinEffect = lerp(SkinEffect, 0, 0.25);
SkinEffectScale = lerp(SkinEffectScale, 0, 0.25);
TipY = lerp(TipY, TipYSwitch, 0.15);
TipUnlockAlpha = lerp(TipUnlockAlpha, 0, 0.05);
TipX[TipSwitch] = lerp(TipX[TipSwitch], 0, 0.25);
TipGlow[TipSwitch] = lerp(TipGlow[TipSwitch], 0, 0.15);
ColorChange = lerp(ColorChange, ColorChangedir, 0.25);
if (name[select] == "Random" || SkinAvailable == 1 || StageRandom > 0)
{
    TipColorR = lerp(TipColorR, 255, 0.25);
    TipColorG = lerp(TipColorG, 255, 0.25);
    TipColorB = lerp(TipColorB, 255, 0.25);
    TipAlpha = lerp(TipAlpha, 0.25, 0.15);
}
else
{
    SkinAvailable = 0;
    if (global.BlockSkin != 1)
    {
        if ((global.hardmode == 1 && global.masks[select] == 1) || (global.hardmode == 0 && global.hardmodemasks[select] == 1))
        {
            TipColorR = lerp(TipColorR, 0, 0.25);
            TipColorG = lerp(TipColorG, 255, 0.25);
            TipColorB = lerp(TipColorB, 0, 0.25);
        }
        else if ((global.hardmode == 1 && global.masks[select] == 0) || (global.hardmode == 0 && global.hardmodemasks[select] == 0))
        {
            TipColorR = lerp(TipColorR, 255, 0.25);
            TipColorG = lerp(TipColorG, 0, 0.25);
            TipColorB = lerp(TipColorB, 0, 0.25);
        }
    }
    TipAlpha = lerp(TipAlpha, 1, 0.15);
}
if (global.BlockSkin == 1)
{
    BlockSkin = lerp(BlockSkin, 1, 0.25);
    wave += 0.25;
    TipColorR = lerp(TipColorR, 131, 0.15);
    TipColorG = lerp(TipColorG, 25, 0.15);
    TipColorB = lerp(TipColorB, 223, 0.15);
}
else
{
    BlockSkin = lerp(BlockSkin, 0, 0.25);
    wave = 0;
}
if (rand == 1)
{
    if (select < ds_list_find_value(RandomMask, 0) || name[select] == "Random" || StageRandom != 2)
    {
        TipYSwitch = 50;
        RandomMaskShadow = lerp(RandomMaskShadow, 0.75, 0.05);
        randomEnd = 1;
        if (wheelsp <= 0)
        {
            select += 1;
            audio_play_sound(sndMaskClick, 0, false);
            audio_sound_pitch(sndMaskClick, 1 - clamp(wheelbrake / 2, 0, 0.5));
            wheelbrake += (0.005 + (wheelbrake / 28));
            wheelsp = 0.005 + wheelbrake;
            wait = 38;
        }
        else
        {
            wheelsp -= 0.05;
        }
        if (select > (masks - 1))
        {
            StageRandom += 1;
            select = 0;
        }
    }
    else if (wait == 0)
    {
        randomEnd = 0;
        RandomMaskShadow = lerp(RandomMaskShadow, 0, 0.25);
        if (on == 1)
        {
            audio_play_sound(sndMaskClickEnd, 0, false);
        }
        event_perform(ev_keypress, vk_enter);
    }
}
if (keyboard_check_pressed(vk_up) || mouse_wheel_up())
{
    event_perform(ev_keypress, ord("W"));
}
if (keyboard_check_pressed(vk_down) || mouse_wheel_down())
{
    event_perform(ev_keypress, ord("S"));
}
RandomMaskEffect = lerp(RandomMaskEffect, 0, 0.25);
if (RandomMaskWait == 0 && rand == 0)
{
    RandomMaskCount = ds_list_find_value(RandomMask, random(ds_list_size(RandomMask)));
    if (RandomMaskCount == RandomMaskCountLast)
    {
        return RandomMaskCount == ds_list_find_value(RandomMask, random(ds_list_size(RandomMask)));
    }
    RandomMaskCountLast = RandomMaskCount;
    RandomMaskEffect = choose(-5, 5);
    RandomMaskWait = 45;
}
