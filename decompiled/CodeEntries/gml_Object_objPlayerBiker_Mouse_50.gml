if (global.xbox == 1)
{
    exit;
}
if (reload > 0)
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
if (global.gotbeaten == 1)
{
    sprite_index = choose(sprBikerAttackCleaverUnmasked, sprBikerAttackCleaver2Unmasked);
}
else
{
    sprite_index = choose(sprBoss2AttackCleaver, sprBikerAttackCleaver2);
}
image_index = 0;
image_speed = 0.5;
reload = 15;
audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
impact = 3.5;
impside = 8;
