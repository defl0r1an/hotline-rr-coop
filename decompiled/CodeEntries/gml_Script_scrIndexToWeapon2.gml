switch (argument0)
{
    case 0:
        objPlayer.sprite_index = sprPWalkM16;
        break;
    case 1:
        objPlayer.sprite_index = sprPWalkShotgun;
        break;
    case 2:
        objPlayer.sprite_index = sprPWalkClub;
        break;
    case 3:
        objPlayer.sprite_index = sprPWalkPipe;
        break;
    case 4:
        objPlayer.sprite_index = sprPWalkBat;
        break;
    case 5:
        objPlayer.sprite_index = sprPWalkKnife;
        audio_play_sound(sndDrawKnife, 0, false);
        break;
    case 6:
        objPlayer.sprite_index = sprPWalkDoubleBarrel;
        break;
    case 7:
        objPlayer.sprite_index = sprPWalkSilencer;
        break;
    case 8:
        objPlayer.sprite_index = sprPWalkSword;
        break;
    case 9:
        objPlayer.sprite_index = sprPWalkUzi;
        break;
    case 10:
        objPlayer.sprite_index = sprPWalkMagnum;
        break;
    case 11:
        objPlayer.sprite_index = sprPWalkScorpion;
        break;
    case 12:
        objPlayer.sprite_index = sprPWalkMP5;
        break;
    case 13:
        objPlayer.sprite_index = sprPWalkPool;
        break;
    case 14:
        objPlayer.sprite_index = sprPWalkPoolBroke;
        break;
    case 15:
        objPlayer.sprite_index = sprPWalkAxe;
        break;
    case 16:
        objPlayer.sprite_index = sprPWalkNightStick;
        break;
    case 17:
        objPlayer.sprite_index = sprPWalkCrowbar;
        break;
    case 18:
        objPlayer.sprite_index = sprPWalkMachete;
        break;
    case 19:
        objPlayer.sprite_index = sprPWalkSledgeHammer;
        break;
    case 20:
        objPlayer.sprite_index = sprPWalkTrophy;
        break;
    case 21:
        objPlayer.sprite_index = sprPWalkDrill;
        break;
    case 22:
        objPlayer.sprite_index = sprPWalkPan;
        break;
    case 23:
        objPlayer.sprite_index = sprPWalkBoilingPot;
        break;
    case 24:
        objPlayer.sprite_index = sprPWalkPot;
        break;
    case 25:
        objPlayer.sprite_index = sprPWalkSilencedUzi;
        break;
    case 26:
        objPlayer.sprite_index = sprPWalkChainsaw;
        break;
    case 27:
        objPlayer.sprite_index = sprPWalkHuntingRifle;
        break;
    case 28:
        objPlayer.sprite_index = sprPWalk9mm;
        break;
    case 29:
        objPlayer.sprite_index = sprPWalkKalashnikov;
        break;
    case 39:
        objPlayer.sprite_index = sprJacketWalkShorty;
        break;
    case 40:
        objPlayer.sprite_index = sprPWalkM60;
        break;
    case 41:
        objPlayer.sprite_index = sprPWalkFlameThrower;
        break;
    case 42:
        objPlayer.sprite_index = sprPWalkNailgun;
        break;
    case 45:
        objPlayer.sprite_index = sprPWalkAks;
        break;
    case 46:
        objPlayer.sprite_index = sprPWalkTaser;
        break;
    case 47:
        objPlayer.sprite_index = sprPWalkButterfly;
        audio_play_sound(sndDrawKnife, 0, false);
        break;
    case 44:
        objPlayer.sprite_index = sprPWalkThrow;
        objPlayer.throwindex = 9;
        break;
    case 49:
        objPlayer.sprite_index = sprPWalkCleaver;
        audio_play_sound(sndDrawKnife, 0, false);
        break;
    case 48:
        objPlayer.sprite_index = sprPJacketWalkSkateboard;
        break;
    case 52:
        objPlayer.sprite_index = sprPJacketWalkRPG;
        break;
    case 38:
        objPlayer.sprite_index = sprPWalkToyMP5;
        break;
    case 30:
        objPlayer.sprite_index = sprPWalkThrow;
        objPlayer.throwindex = 0;
        break;
    case 31:
        objPlayer.sprite_index = sprPWalkThrow;
        objPlayer.throwindex = 1;
        break;
    case 32:
        objPlayer.sprite_index = sprPWalkThrow;
        objPlayer.throwindex = 2;
        break;
    case 33:
        objPlayer.sprite_index = sprPWalkThrow;
        objPlayer.throwindex = 3;
        break;
    case 34:
        objPlayer.sprite_index = sprPWalkThrow;
        objPlayer.throwindex = 4;
        break;
    case 35:
        objPlayer.sprite_index = sprPWalkThrow;
        objPlayer.throwindex = 5;
        break;
    case 36:
        objPlayer.sprite_index = sprPWalkThrow;
        objPlayer.throwindex = 6;
        break;
    case 37:
        objPlayer.sprite_index = sprPWalkThrow;
        objPlayer.throwindex = 7;
        break;
    default:
        break;
}
