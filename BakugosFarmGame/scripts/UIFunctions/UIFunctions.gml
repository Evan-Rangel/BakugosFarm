// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

enum RESOURCE_TYPE
{
	SINGLE_OBJ,
	MULTIPLE_OBJ,
	EMPTY
}
function vector(_x,_y) constructor
{
	x=_x;
	y=_y;
	static set=function (_x,_y) 
	{
		x=_x;
		y=_y;
	}
	function get_vector()
	{
		return new vector(x,y);
	}
}

inv_xlenght=9;
inv_ylenght=3;
inv_holders=[inv_xlenght,inv_ylenght];
inv_h=ds_map_create();
t_obj=noone;
can_show_inventory=false;
inv_background=noone;
toolbar=noone;
resource_can_move=false;
resource=noone;
resource_count=0;
holder_t=noone;
max_capacity=64;
resource_info_holder=noone;


function resource_show_info()
{
	if(!global.resource_can_move)
	{
		var _resource_info=global.resource_info_holder;
		_resource_info.visible=true;
		_resource_info.can_draw=true;
		_resource_info.resource_name=resource_obj.resource_name;
		_resource_info.resource_description=resource_obj.resource_description;
	}
}
function resource_hide_info()
{
	var _resource_info=global.resource_info_holder;
	_resource_info.visible=false;
	_resource_info.resource_name="";
	_resource_info.can_draw=false;
	_resource_info.resource_description="";
}
function resource_cancel_move_position()
{
	global.resource_can_move = false;
	in_movement = false;
	add_to_inventory(global.resource, global.resource_count);
}
function resource_start_move_position(_resource, _count)
{
	resource_hide_info();
	global.resource=_resource;
	_resource.in_movement=true;
	resource_count-=_count;
	global.holder_t=self.id;
	global.resource_count+=_count;
	global.resource_can_move=true;
}
function resource_stop_move_position()
{
	if(	global.resource_can_move)
	{
		var _h_temp=global.holder_t;
		var _count=global.resource_count;
		
		switch(resource_type)
		{
			case RESOURCE_TYPE.MULTIPLE_OBJ:
				if(resource_name == _h_temp.resource_name)
				{
					global.resource_can_move = false;
					with(_h_temp)
					{
						resource_show_info();
					}
					var _result = resource_count + _count - global.max_capacity;
					if(_result>0)
					{
						resource_count=global.max_capacity;
						_h_temp.resource_count=_result;
						//add_to_inventory(_h_temp.resource_obj, _result)
					}
					else
					{
						resource_count += _count;
						//_h_temp.resource_count -= _count;
					}	
					
					_h_temp.resource_obj.in_movement=false;
					if(_h_temp.resource_count == 0)
					{
						instance_destroy(_h_temp.resource_obj);
						_h_temp.resource_obj = noone;
						_h_temp.resource_type = RESOURCE_TYPE.EMPTY;
						_h_temp.resource_name = "";
					}
					
					global.holder_t = noone;
					global.resource_count=0;
				}
			
				else
				{
					with(resource_obj)
					{
						in_movement = true;
					}
					var _temp_count = resource_count;				
					var _object_temp = resource_obj;
					var _name_temp = resource_name;
					var _type_temp = resource_type;
				
					resource_count = _count;
					resource_obj = _h_temp.resource_obj;
					resource_name = _h_temp.resource_name;
					resource_type = _h_temp.resource_type; 
				
					_h_temp.resource_count=_temp_count;
					_h_temp.resource_obj=_object_temp;
					_h_temp.resource_name=_name_temp;
					_h_temp.resource_type=_type_temp;
				
					with(resource_obj)
					{
						in_movement = false;
					}
				}
			break;
			case RESOURCE_TYPE.EMPTY://instance_create_layer(_h_temp.x,_h_temp.y, "Instances",_h_temp.object_index) ;//
				global.resource_can_move = false;
				with(_h_temp)
				{
					resource_show_info();
				}
				resource_obj=instance_create_layer(0,0, "Instances", _h_temp.resource_obj.object_index) ;
				resource_type = _h_temp.resource_type;
				resource_name = _h_temp.resource_name;
				resource_count =_count;
				//_h_temp.resource_count -= _count;
				_h_temp.resource_obj.in_movement=false;
				if(_h_temp.resource_count==0)
				{
					instance_destroy(_h_temp.resource_obj);
					_h_temp.resource_type = RESOURCE_TYPE.EMPTY;
					_h_temp.resource_name = "";
					_h_temp.resource_obj = noone;
				}
				resource_obj.in_movement = false;
				global.holder_t = noone;
				global.resource_count=0;
			break;
		}
	}
	
	
}
function get_inventory_holders()
{
	global.inv_h=ds_map_create();
	_idx=0;
	for( _i=0; _i<global.inv_ylenght;_i++)
	{
		for( _j=0; _j<global.inv_xlenght;_j++)
		{
			var _t= instance_find(obj_tool_holder,_idx);
			ds_map_set(global.inv_h,_idx ,_t);
			_idx++;
		}
	}
	global.resource_info_holder=instance_create_layer(0,0, "Instances", obj_info_inv);
	global.resource_info_holder.visible=false;
	global.inv_background= instance_find(obj_inventory_manager, 0);
	global.toolbar=instance_find(obj_toolbar, 0);
	hide_inventory();
}

function show_inventory()
{
	_idx=0;
	for( _i=0; _i<global.inv_ylenght;_i++)
	{
		for( _j=0; _j<global.inv_xlenght;_j++)
		{
			temp_holder=ds_map_find_value(global.inv_h, _idx);
			_idx++;
			if(_i==0)
			{
				temp_holder.y=335;
			}
			else
			{
				temp_holder.visible=true;
			}
		}
	}
	global.can_show_inventory=true;
	global.inv_background.visible=true;
	global.toolbar.visible=false;
}

function hide_inventory()
{
_idx=0;

for( _i=0; _i<global.inv_ylenght;_i++)
	{
		for( _j=0; _j<global.inv_xlenght;_j++)
		{
			temp_holder=ds_map_find_value(global.inv_h, _idx);
			if(_i==0)
			{
				temp_holder.y=705;
			}
			else
			{
				temp_holder.visible=false;
			}
			_idx++;
		}
	}
	global.can_show_inventory=false;
	global.inv_background.visible=false;
	global.toolbar.visible=true;
}

function add_to_inventory(_resource_obj, _resource_count)
{
	_idx=0;
	for( _i=0; _i<global.inv_ylenght;_i++)
	{
		for( _j=0; _j<global.inv_xlenght;_j++)
		{
			temp_holder=ds_map_find_value(global.inv_h, _idx);
			_idx++;
			
			if(temp_holder.resource_type==RESOURCE_TYPE.EMPTY|| _resource_obj.resource_name == temp_holder.resource_name)
			{
				switch(_resource_obj.resource_t)
				{ 
					case RESOURCE_TYPE.MULTIPLE_OBJ:
						if(temp_holder.resource_count<global.max_capacity)
						{
							var _result = temp_holder.resource_count + _resource_count - global.max_capacity;// si es positivo se añadira a otro holder
							
							if(temp_holder.resource_count>1)
							{
								instance_destroy(_resource_obj);
							}
							else
							{
								temp_holder.resource_obj = _resource_obj;
								temp_holder.resource_name = _resource_obj.resource_name;
								temp_holder.resource_type = RESOURCE_TYPE.MULTIPLE_OBJ;
							}
							
							if(_result>0)
							{
								temp_holder.resource_count = global.max_capacity;
								add_to_inventory(instance_create_layer(0,0,"Instances", temp_holder.resource_obj.object_index),_result);
							}
							else
							{
								temp_holder.resource_count += _resource_count;
							}
							return true;
						}
					break;
					case RESOURCE_TYPE.SINGLE_OBJ:
						if(temp_holder.resource_count==0)
						{
							temp_holder.resource_count = 1;
							temp_holder.resource_type = RESOURCE_TYPE.SINGLE_OBJ
							temp_holder.resource_obj = _resource_obj;
							temp_holder.resource_name = _resource_obj.resource_name;
							return true;
						}
						
					break;
				}
			}
		}
	}
	return false;
}