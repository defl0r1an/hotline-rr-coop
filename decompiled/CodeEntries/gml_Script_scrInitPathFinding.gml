global.grid = mp_grid_create(0, 0, room_width / 16, room_height / 16, 16, 16);
mp_grid_add_instances(global.grid, objCorner, 1);
mp_grid_add_instances(global.grid, objWallBrickH, 1);
mp_grid_add_instances(global.grid, objWallBrickV, 1);
mp_grid_add_instances(global.grid, objWallHospitalH, 1);
mp_grid_add_instances(global.grid, objWallHospitalV, 1);
mp_grid_add_instances(global.grid, objHorBarrier, 1);
mp_grid_add_instances(global.grid, objVertBarrier, 1);
mp_grid_add_instances(global.grid, objWallHeavyH, 1);
mp_grid_add_instances(global.grid, objWallHeavyV, 1);
mp_grid_add_instances(global.grid, objWallBathroomH, 1);
mp_grid_add_instances(global.grid, objWallBathroomV, 1);
mp_grid_add_instances(global.grid, objMansionGarage, 1);
mp_grid_add_instances(global.grid, objWallSoftH, 1);
mp_grid_add_instances(global.grid, objWallSoftV, 1);
mp_grid_add_instances(global.grid, objEuroPodV, 1);
mp_grid_add_instances(global.grid, objEuroPodH, 1);
mp_grid_add_instances(global.grid, objEuroPillar, 1);
mp_grid_add_instances(global.grid, objTruck, 1);
mp_grid_add_instances(global.grid, objFurniture, 1);
mp_grid_add_instances(global.grid, objHighballCurtain, 1);
mp_grid_add_instances(global.grid, objGlassPanelH, 1);
mp_grid_add_instances(global.grid, objGlassPanelV, 1);
mp_grid_add_instances(global.grid, objWindowLargeH, 1);
mp_grid_add_instances(global.grid, objWindowLargeV, 1);
mp_grid_add_instances(global.grid, objWindowH, 1);
mp_grid_add_instances(global.grid, objWindowV, 1);
mp_grid_add_instances(global.grid, objWallArcadeH, 1);
mp_grid_add_instances(global.grid, objWallArcadeV, 1);
mp_grid_add_instances(global.grid, objWallArcadeInteriorH, 1);
mp_grid_add_instances(global.grid, objWallArcadeInteriorV, 1);
mp_grid_add_instances(global.grid, objWallArcadeSoftH, 1);
mp_grid_add_instances(global.grid, objWallArcadeSoftV, 1);
mp_grid_add_instances(global.grid, objWindowExtraLargeH, 1);
mp_grid_add_instances(global.grid, objWindowExtraLargeV, 1);
mp_grid_add_instances(global.grid, objWindowDoubleH, 1);
mp_grid_add_instances(global.grid, objWindowDoubleV, 1);
mp_grid_add_instances(global.grid, objElevator, 1);
mp_grid_add_instances(global.grid, objDoorV2, 1);
mp_grid_add_instances(global.grid, objDoorV2, 1);
mp_grid_add_instances(global.grid, objBottleExplosion, 1);
with (objDoorV)
{
    if (solid == 1 || sprite_index == sprBombDoorV)
    {
        mp_grid_add_instances(global.grid, id, 1);
    }
}
with (objDoorV2)
{
    mp_grid_add_instances(global.grid, id, 1);
}
with (objDoorH)
{
    if (solid == 1 || sprite_index == sprBombDoorH)
    {
        mp_grid_add_instances(global.grid, id, 1);
    }
}
with (objDoorH2)
{
    if (solid == 1)
    {
        mp_grid_add_instances(global.grid, id, 1);
    }
}
