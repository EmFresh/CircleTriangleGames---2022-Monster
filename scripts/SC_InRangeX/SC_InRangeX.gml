// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SC_InRangeX(obj1, obj2, range){

    tmpx = obj1.x - obj2.x;
   
    length = sqrt((tmpx * tmpx) );


    return length <= range;

}