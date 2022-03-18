// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function SC_EnemySelectWaypoint(arrayPoints, size){

size = instance_number(OB_WanderPoint);
mypoint = arrayPoints[irandom_range(0,size-1)];

return mypoint;

}

