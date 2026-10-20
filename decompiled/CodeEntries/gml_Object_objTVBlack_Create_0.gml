solid = 1;
image_speed = 0.5;
energie = 3;
life = 30;
if (room == rmSequence12b)
{
    solid = 0;
}
if (room == rmSequence1 || room == rmSequence2 || room == rmSequence3 || room == rmSequence4 || room == rmSequence5 || room == rmSequence6 || room == rmSequence7 || room == rmSequence8 || room == rmSequence9 || room == rmSequence10 || room == rmSequence11 || room == rmSequence12 || room == rmSequence12b || room == rmSequence12c || room == rmSequence13 || room == rmSequence14)
{
    instance_create(x, y, objJacketsTV);
    instance_destroy();
}
