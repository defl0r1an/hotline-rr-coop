// Client-side ghost of a host enemy / knocked-out enemy / corpse. Drawn from ENT messages only; it has no
// collisions or AI, so the client's own game code does not see it as an enemy.
image_speed = 0;
nid = -1;
stale = 0;
mode = 4;
t_x = x;
t_y = y;
e_ang = 0;
e_legspr = -1;
e_legimg = 0;
