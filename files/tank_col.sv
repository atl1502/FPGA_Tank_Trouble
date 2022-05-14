module tank_col (input logic Clk,
				input logic [9:0] center_x, center_y,
				input logic [6:0] angle,
				input logic [3:0] wall [6:0],
				output logic front_col, back_col,
				output logic [7:0] addr [6:0],
				output logic pos [6:0]);
				
				
logic [9:0] x_arr [6:0];
logic [9:0] y_arr [6:0];
logic [9:0] rotatedx_arr [6:0];
logic [9:0] rotatedy_arr [6:0];
logic [6:0] nangle;
logic collision_arr [6:0];
				
transform_matrix points[6:0] (.x(x_arr), .y(y_arr), 
								 .rot_pointx(center_x), .rot_pointy(center_y),
								 .angle(nangle),
								 .x_out(rotatedx_arr), .y_out(rotatedy_arr));
								 

check_for_col cols[6:0] (.x(rotatedx_arr), .y(rotatedy_arr),
							.wall(wall),
							.addr(addr),
							.pos(pos),
							.collision(collision_arr));
								 
always_comb begin 

	x_arr[3'b000] = center_x + 10'd12;
	x_arr[3'b001] = center_x + 10'd12;
	x_arr[3'b010] = center_x + 10'd7;
	x_arr[3'b011] = center_x - 10'd7;
	x_arr[3'b100] = center_x - 10'd7;
	x_arr[3'b101] = center_x + 10'd7;
	x_arr[3'b110] = center_x - 10'd7;
	
	y_arr[3'b000] = center_y - 10'd2;
	y_arr[3'b001] = center_y + 10'd2;
	y_arr[3'b010] = center_y + 10'd7;
	y_arr[3'b011] = center_y + 10'd7;
	y_arr[3'b100] = center_y - 10'd7;
	y_arr[3'b101] = center_y - 10'd7;
	y_arr[3'b110] = center_y;
	
//	if (back_col)
//		front_col = 0;
//	else
	front_col = collision_arr[3'b000] | collision_arr[3'b001] | collision_arr[3'b010] | collision_arr[3'b101];
		
//	if (front_col)
//		back_col = 0;
//	else
	back_col = collision_arr[3'b011] | collision_arr[3'b100] | collision_arr[3'b110];
	if(angle == 0)
		nangle = 0;
	else
		nangle = 90-angle;
	
	
	
end
				
				
				
endmodule
				
				