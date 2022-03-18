// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SC_InRangeY(obj1, obj2, range){

  
    tmpy = obj1.y - obj2.y;
    length = sqrt((tmpy * tmpy));


    return length <= range;

}