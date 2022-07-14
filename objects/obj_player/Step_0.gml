#region //Controles
	key_right = keyboard_check(ord("D"))
	key_left = keyboard_check(ord("A"))
	key_jump = keyboard_check_pressed(vk_space)
#endregion

#region //Movimentação	
	var move = key_right - key_left
	
	hspd = move * spd
	vspd = vspd + gravt
	
	//inverter lado da imagem
	if(hspd != 0) image_xscale = sign(hspd)
	
	//colisão X
	if place_meeting(x + hspd, y, Obj_wall) {
		while(!place_meeting(x + sign(hspd), y, Obj_wall)) {
			x = x + sign(hspd)	
		}
		hspd = 0
	}
	x = x + hspd
	
	//colisão Y
	if place_meeting(x, y + vspd, Obj_wall) {
		while(!place_meeting(x, y + sign(vspd), Obj_wall)) {
			y = y + sign(vspd)	
		}
		vspd = 0
	}
	y = y + vspd
	
	// pulo 
	if (place_meeting(x, y + 1, Obj_wall) && key_jump) {
		vspd -= 8
	}
	
	if (keyboard_check_pressed(ord("R"))) {
		game_restart()
	}
#endregion