if (global.deadIgel == 1 || sprite_index == sprPStartSkippyAim || sprite_index == sprPWalkSkippyAim || sprite_index == sprPSkippyPunchWalk || sprite_index == sprPSkippyPunch || sprite_index == sprPSkippyPunchStart || ((throwindex == 8 || throwindex == 9 || throwindex == 10 || throwindex == 11) && sprite_index == sprPWalkThrow) || sprite_index == sprPKillHeadComeOffEnd)
{
    exit;
}
scrKillShield(0, 0, 0, 0, 0);
