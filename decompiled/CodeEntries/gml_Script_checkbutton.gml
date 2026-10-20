if (argument1 == getid(5))
{
    test1 = external_call(global.__checkButton, 0, getid(5));
    test2 = external_call(global.__checkButton, 0, getid(11));
    return test1 + test2;
}
return external_call(global.__checkButton, argument0, argument1);
