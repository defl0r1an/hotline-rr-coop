if (choicetext[select + (6 * pageoffset)] == "Next Page")
{
    pageoffset += 1;
    selectmax = array_length_1d(choicetext) - (6 * pageoffset);
    select = 0;
}
else if (choicetext[select + (6 * pageoffset)] == "Back")
{
    pageoffset -= 1;
    selectmax = 5;
    select = 0;
}
