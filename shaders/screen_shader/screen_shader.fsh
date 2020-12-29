//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 object_pos;

uniform float supernova_shockwave_y;
uniform float supernova_horizon_y;
uniform float frames;

const float PI = 3.14;

//float logistic(float x) {
//	return 1.0 / (1.0 + exp(-0.025*x));
//}

void main()
{
	float mask0 = pow(clamp(0.1 * sin(PI + PI * (v_vTexcoord.x) ) + supernova_shockwave_y - v_vTexcoord.y + 0.5, 0.0, 1.0), 6.0);
	float mask2 = 1.0 - clamp(0.1 * sin(PI + PI * (v_vTexcoord.x) ) + supernova_horizon_y - v_vTexcoord.y, 0.0, 1.0);
	float mask1 = (1.0 - mask0) * (1.0 - mask2);
	
	vec4 base_color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord);
	//0.007 * sin(0.1 * frames + pow(0.25 * (-0.5 + sin(PI * v_vTexcoord.x)) * (supernova_shockwave_y - v_vTexcoord.y), -1.0))
	float x_mess = (1.0 - clamp(supernova_shockwave_y - v_vTexcoord.y, 0.0, 1.0)) * 0.001 * sin(0.2 * frames + v_vTexcoord.x) + v_vTexcoord.x;
	float y_mess = 0.2 * (1.0 + sin(PI + PI * v_vTexcoord.x)) +  0.005 * sin(0.06 * frames + 0.05 * object_pos.x) + 0.1 + 0.8 * v_vTexcoord.y;
	vec4 crangled = v_vColour * texture2D( gm_BaseTexture,  vec2(x_mess, y_mess));
	
	
	float fade1  = clamp(0.1 * sin(PI + PI * (v_vTexcoord.x) ) + supernova_shockwave_y - v_vTexcoord.y + 0.15, -1.0, 1.0);
	float fade2 = pow(clamp(0.1 * sin(PI + PI * (v_vTexcoord.x) ) + supernova_shockwave_y - v_vTexcoord.y - 0.25, -1.0, 1.0), 3.0);
	//float fade = -0.4 * cos(1.1*(0.5 * v_vTexcoord.x * 3.14 - 0.25 * 3.14) ) + 0.5 * cos(0.5 * v_vTexcoord.x * 3.14 - 0.25 * 3.14 ) + (supernova_shockwave_y - v_vTexcoord.y) + 1.0;//0.75 * cos(0.5 * v_vTexcoord.x * 3.14 +  0.5 * 3.14) + 1.0 + 0.05 * sin(0.02 * frames + 11.0 * v_vTexcoord.x) + (1.0 - 0.4 * pow(v_vTexcoord.y - supernova_shockwave_y, 1.0) - 0.3);
	//float fade2 = (1.0 - clamp(0.4 * pow(v_vTexcoord.y - supernova_shockwave_y, 0.5) - 0.8, 0.0, 1.0));
	vec4 shockwave = 0.9 * crangled +  0.3 * vec4(1.0, 1.0, 1.0, 1.0) - clamp(2.0 * fade1 * crangled, -1.0, 1.0) + fade2 * crangled;
		//(1.0 + sin(0.095 * frames)) *  
		//fade * vec4(1.4, 1.2, 1.0, 1.0) * crangled +
		//fade2 * vec4(1.0, 0.3, 0.1, 1.0) * crangled +
		//(1.0 - fade) * vec4(0.9, 0.7, 0.5, 1.0);
	vec4 horizon = 4.0 * base_color + 0.9 * vec4(1.0, 1.0, 1.0, 1.0);//vec4(5.0 * base_color.r, 0.0, 0.0, 0.5);
	
    gl_FragColor = mask2 * horizon + mask1 * shockwave + mask0 * base_color;
}
