// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SC_InRange(obj1, obj2, range){

    tmpx = obj1.x - obj2.x;
    tmpy = obj1.y - obj2.y;
    length = sqrt((tmpx * tmpx) + (tmpy * tmpy));


    return length <= range;

}