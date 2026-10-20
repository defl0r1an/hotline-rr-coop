if (object_get_parent(object_index) == 332 || object_get_parent(object_index) == 1328 || object_index == objEnemyIdleGuard || object_index == objPoliceIdleGuard)
{
    if (object_index != objEnemyIdleGuard && object_index != objPoliceIdleGuard && object_index != objPoliceIdleStick && object_index != objEnemyIdlePipe)
    {
        if (room == rmTrainstationEntrance)
        {
            if (global.hardmode == 1 && global.maskindex == 3)
            {
                sprite_index = choose(sprEWalkShotgun, sprEWalkM16, sprEWalkKalashnikov);
            }
            else
            {
                sprite_index = sprEWalkKnife;
            }
        }
        else
        {
            sprite_index = choose(sprEWalkShotgun, sprEWalkM16, sprEWalkKalashnikov);
        }
    }
    if (sprite_index == sprEWalkM16 || sprite_index == sprEStandGuard || sprite_index == sprEMafiaStandGuardM16 || sprite_index == sprEPoliceStandGuardM16)
    {
        ammo = 20;
    }
    if (sprite_index == sprEWalkShotgun || sprite_index == sprEMafiaStandGuardShotgun || sprite_index == sprEPoliceStandGuardShotgun || sprite_index == sprPoliceWalkShotgun)
    {
        ammo = 6;
    }
    if (sprite_index == sprEWalkSilencer || sprite_index == sprESearchSilencer || sprite_index == sprEMafiaStandGuardSilencer)
    {
        ammo = 13;
    }
    if (sprite_index == sprEMafiaStandGuard9mm || sprite_index == sprEPoliceStandGuard9mm)
    {
        ammo = 13;
    }
    if (sprite_index == sprEMafiaStandGuardDoubleBarrel)
    {
        ammo = 2;
    }
    if (sprite_index == sprEMafiaStandGuardScorpion)
    {
        ammo = 20;
    }
    if (sprite_index == sprEMafiaStandGuardKalashnikov || sprite_index == sprEWalkKalashnikov)
    {
        ammo = 24;
    }
    if (sprite_index == sprETauntPipe)
    {
        sprite_index = sprEWalkPipe;
    }
    if (sprite_index == sprEPoliceIdleStick)
    {
        sprite_index = sprPoliceWalkNightStick;
    }
    if (global.maskindex == 10)
    {
        ammo = ceil(ammo * 1.33);
    }
}
