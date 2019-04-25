#region MOVEMENT
	//SET HSPEED
		hspeed = (keyboard_check(vk_right) - keyboard_check(vk_left)) * walk_speed
	
	//CHECK IF ON GROUND THIS FRAME
		on_ground = check_box_collision(obj_gui.Collision,obj_gui.Jumpthrough,0, 1);
	
	//SET NORMAL WALK SPEED
		walk_speed = 1;
          
#endregion

#region HORIZONTAL COLLISION CHECK (LOOK AHEAD)
	if check_box_collision(obj_gui.Collision,obj_gui.Jumpthrough, hspeed, 0) then {
		//REMOVE X FRACTION
			x = floor(x);               
		
		//MOVE CLOSER UNTIL TOUCHING WALL
			while not check_box_collision(obj_gui.Collision,obj_gui.Jumpthrough,sign(hspeed), 0) {
				x += sign(hspeed);
			}//end while
	
		//STOP HSPEED
			hspeed = 0;	
	}//end if
#endregion

#region VERTICAL COLLISION CHECK (LOOK AHEAD)
	if check_box_collision(obj_gui.Collision,obj_gui.Jumpthrough,0, vspeed + sign(vspeed)) then {
		//REMOVE Y FRACTION
			y = floor(y); 
	
		//MOVE CLOSER UNTIL TOUCHING WALL
			while not check_box_collision(obj_gui.Collision,obj_gui.Jumpthrough,0, sign(vspeed)){
				y += sign(vspeed);		
			}//end if 
			
		//STOP VSPEED & GRAVITY
			vspeed = 0;	
			gravity = 0;
	}//end if
#endregion

#region JUMPING/GRAVITY
	//THIS CODE MAKES ME FALL IF IM NOT IN THE GROUND
		if not on_ground then {	
			gravity = gravity_speed;
			
		}//end if
	
	//IF I AM ON THE GROUND AND I PUSHED SPACEBAR JUMP
		if on_ground {		
			if keyboard_check_pressed(vk_space) then {
				vspeed -= jump_speed;
				mask_index = mario_jump
				}//end if		
		}//end if
#endregion

#region ANIMATION
//IF WERE MOVING
				if hspeed != 0 then {				
					image_xscale = sign(hspeed);          //SET FAFING DIRECTION
					if on_ground then image_speed = .125; //SET ANIMATION SPEED
				}else{ 
					image_speed = .5;                     //SPEED FOR IDLE ANIMATION
				}//end if

			if on_ground then { 
				#region ON GROUND ANIMATIONS
					//DUCKING CODE
					if keyboard_check(vk_down) then {
								hspeed = 0
								walk_speed = 0;
							mask_index = spr_witch_mask_duck;
				
						// IF ON GROUND AND MOVING CHANGE TO CRAWL ANIMATION
							if hspeed != 0 then {
								sprite_index = spr_witch_crawl;
							}//end if
				
						// IF ON GROUND AND NOT MOVING USE DUCK ANIMATION			
							if hspeed == 0 {
								sprite_index = spr_witch_duck;				
							}//end if
					
					}else{ // not ducking
				
						//IF MOVING USE WALK SPRITE OTHERWISE IDLE IDLE SPRITE
						if hspeed != 0 then {		
							sprite_index = mario_run;	
						}else{
							sprite_index = mario;					
						}//end if
					}//end if
				#endregion
			}
#endregion
				