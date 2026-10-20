if (instance_exists(objPlayerBiker))
{
    exit;
}
file = file_text_open_read("mask.nfo");
if (room != room152)
{
    global.maskindex = file_text_read_real(file);
}
global.maskon = 1;
with (objMaskMenu)
{
    instance_destroy();
}
with (objPlayer)
{
    scrInitMaskPos();
    scrUpdateMaskPos(sprite_index);
    maskon = 1;
}
file_text_close(file);
