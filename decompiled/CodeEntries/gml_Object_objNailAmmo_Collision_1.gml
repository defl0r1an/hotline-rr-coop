if (speed <= 0 && instance_exists(objPlayer) && (objPlayer.sprite_index == sprPWalkNailgun || objPlayer.sprite_index == sprPAttackNailgun || objPlayer.sprite_index == sprPWalkHumanShieldNailgun || objPlayer.sprite_index == sprPAttackHumanShieldNailgun || objPlayer.sprite_index == sprPShieldSnapNailgun))
{
    other.ammo += 1;
    audio_play_sound(sndPickupWeapon, 0, false);
    instance_destroy();
}
