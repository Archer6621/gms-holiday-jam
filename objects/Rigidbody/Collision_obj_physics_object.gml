/// @description Insert description here
// You can write your code in this editor

var dts = delta_time / 1000000;
col_dir = direction;
bounce_dir = point_direction(other.x, other.y, self.x, self.y);
rel_speed = abs(self.speed - other.speed);

// This is an impulse
motion_add(bounce_dir, rel_speed * elasticity * 1/mass);
move_outside_all(bounce_dir, 10);