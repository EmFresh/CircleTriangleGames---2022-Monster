// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SC_GetAllObjectIDs(objectType){

	size = instance_number(objectType)
	result = [];
	for (var i = 0; i < size; ++i){ 
		result[i] = instance_find(objectType,i);
		//show_debug_message(result[i]);
	}
return result;
}