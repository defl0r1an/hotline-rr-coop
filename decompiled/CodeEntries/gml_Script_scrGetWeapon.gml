switch (image_index)
{
    case 0:
        objPlayer.sprite_index = sprPWalkM16;
        global.usedgun[0] = 1;
        break;
    case 1:
        objPlayer.sprite_index = sprPWalkShotgun;
        global.usedgun[1] = 1;
        break;
    case 2:
        objPlayer.sprite_index = sprPWalkClub;
        global.usedmelee[0] = 1;
        break;
    case 3:
        objPlayer.sprite_index = sprPWalkPipe;
        global.usedmelee[1] = 1;
        break;
    case 4:
        objPlayer.sprite_index = sprPWalkBat;
        global.usedmelee[2] = 1;
        break;
    case 5:
        objPlayer.sprite_index = sprPWalkKnife;
        audio_play_sound(sndDrawKnife, 0, false);
        global.usedmelee[3] = 1;
        break;
    case 6:
        objPlayer.sprite_index = sprPWalkDoubleBarrel;
        global.usedgun[2] = 1;
        break;
    case 7:
        objPlayer.sprite_index = sprPWalkSilencer;
        global.usedgun[3] = 1;
        break;
    case 8:
        objPlayer.sprite_index = sprPWalkSword;
        global.usedmelee[4] = 1;
        break;
    case 9:
        objPlayer.sprite_index = sprPWalkUzi;
        global.usedgun[4] = 1;
        break;
    case 10:
        objPlayer.sprite_index = sprPWalkMagnum;
        global.usedgun[5] = 1;
        break;
    case 11:
        objPlayer.sprite_index = sprPWalkScorpion;
        global.usedgun[6] = 1;
        break;
    case 12:
        objPlayer.sprite_index = sprPWalkMP5;
        global.usedgun[7] = 1;
        break;
    case 13:
        objPlayer.sprite_index = sprPWalkPool;
        global.usedmelee[5] = 1;
        break;
    case 14:
        objPlayer.sprite_index = sprPWalkPoolBroke;
        global.usedmelee[6] = 1;
        break;
    case 15:
        objPlayer.sprite_index = sprPWalkAxe;
        global.usedmelee[7] = 1;
        break;
    case 16:
        objPlayer.sprite_index = sprPWalkNightStick;
        global.usedmelee[8] = 1;
        break;
    case 17:
        objPlayer.sprite_index = sprPWalkCrowbar;
        global.usedmelee[9] = 1;
        break;
    case 18:
        objPlayer.sprite_index = sprPWalkMachete;
        global.usedmelee[10] = 1;
        break;
    case 19:
        objPlayer.sprite_index = sprPWalkSledgeHammer;
        global.usedmelee[11] = 1;
        break;
    case 20:
        objPlayer.sprite_index = sprPWalkTrophy;
        global.usedmelee[12] = 1;
        break;
    case 21:
        objPlayer.sprite_index = sprPWalkDrill;
        global.usedmelee[13] = 1;
        break;
    case 22:
        objPlayer.sprite_index = sprPWalkPan;
        global.usedmelee[14] = 1;
        break;
    case 23:
        objPlayer.sprite_index = sprPWalkBoilingPot;
        global.usedmelee[15] = 1;
        global.usedmelee[16] = 1;
        break;
    case 24:
        objPlayer.sprite_index = sprPWalkPot;
        global.usedmelee[15] = 1;
        global.usedmelee[16] = 1;
        break;
    case 25:
        objPlayer.sprite_index = sprPWalkSilencedUzi;
        global.usedgun[8] = 1;
        break;
    case 26:
        objPlayer.sprite_index = sprPWalkChainsaw;
        global.usedmelee[17] = 1;
        break;
    case 27:
        objPlayer.sprite_index = sprPWalkHuntingRifle;
        global.usedgun[9] = 1;
        break;
    case 28:
        objPlayer.sprite_index = sprPWalk9mm;
        global.usedgun[10] = 1;
        break;
    case 29:
        objPlayer.sprite_index = sprPWalkKalashnikov;
        global.usedgun[11] = 1;
        break;
    case 39:
        objPlayer.sprite_index = sprJacketWalkShorty;
        global.usedgun[12] = 1;
        break;
    case 40:
        objPlayer.sprite_index = sprPWalkM60;
        global.usedgun[13] = 1;
        break;
    case 41:
        objPlayer.sprite_index = sprPWalkFlameThrower;
        scrAchievementSet("FUCK YEAH!");
        global.usedgun[14] = 1;
        break;
    case 42:
        objPlayer.sprite_index = sprPWalkNailgun;
        global.usedgun[15] = 1;
        break;
    case 45:
        objPlayer.sprite_index = sprPWalkAks;
        global.usedgun[16] = 1;
        break;
    case 46:
        objPlayer.sprite_index = sprPWalkTaser;
        global.usedmelee[18] = 1;
        break;
    case 47:
        objPlayer.sprite_index = sprPWalkButterfly;
        audio_play_sound(sndDrawKnife, 0, false);
        global.usedmelee[19] = 1;
        break;
    case 44:
        objPlayer.sprite_index = sprPWalkThrow;
        objPlayer.throwindex = 9;
        break;
    case 50:
        objPlayer.sprite_index = sprPWalkThrow;
        objPlayer.throwindex = 10;
        break;
    case 51:
        objPlayer.sprite_index = sprPWalkThrow;
        objPlayer.throwindex = 11;
        break;
    case 49:
        objPlayer.sprite_index = sprPWalkCleaver;
        audio_play_sound(sndDrawKnife, 0, false);
        global.usedmelee[20] = 1;
        break;
    case 48:
        objPlayer.sprite_index = sprPJacketWalkSkateboard;
        global.usedmelee[21] = 1;
        break;
    case 52:
        objPlayer.sprite_index = sprPJacketWalkRPG;
        break;
    case 38:
        objPlayer.sprite_index = sprPWalkToyMP5;
        global.usedgun[17] = 1;
        break;
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
        objPlayer.sprite_index = sprPWalkThrow;
        objPlayer.throwindex = image_index - 30;
        global.usedthrow[objPlayer.throwindex] = 1;
        break;
    default:
        break;
}
scrCheckUsedGuns();
scrCheckUsedMelee();
scrCheckUsedThrows();
if (image_index >= 0)
{
    global.flexibility[image_index] = 1;
}
global.barehanded = 0;
