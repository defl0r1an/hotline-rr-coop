mobilityScore = 0;
medianx = 0;
mediany = 0;
for (i = 0; i < global.kills; i++)
{
    medianx += global.killx[i];
    mediany += global.killy[i];
}
if (global.kills > 0)
{
    medianx /= global.kills;
    mediany /= global.kills;
}
for (i = 0; i < global.kills; i++)
{
    mobilityScore += (floor(point_distance(medianx, mediany, global.killx[i], global.killy[i])) * 2);
}
return mobilityScore;
