dialogue = choose("Cookies on the spot", "Order completed", "We hope youll leave a review");
chance = 75;
priority = 5;
if (instance_exists(objHobo))
{
    instance_destroy();
}
