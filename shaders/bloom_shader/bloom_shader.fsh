//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 object_pos;

uniform sampler2D thresholded;
uniform int h;
const int SIZE = 15;
void main()
{
	float weight[SIZE];
weight[0] =  0.25730392048967;
weight[1] =  0.25025494504784;
weight[2] =  0.23673103490875;
weight[3] =  0.21780306643721;
weight[4] =  0.19489874717075;
weight[5] =  0.16962519869665;
weight[6] =  0.14358463077766;
weight[7] =  0.11821206569864;
weight[8] =  0.09465682248096;
weight[9] =  0.07371880747122;
weight[10] =  0.05583942596646;
weight[11] =  0.04113768547320;
weight[12] =  0.02947643968608;
weight[13] =  0.02054217681988;
weight[14] =  0.01392368420159;







	vec4 base_color = v_vColour * vec4(0.0);//texture2D(gm_BaseTexture, v_vTexcoord);
	vec3 rgb_base = base_color.rgb;
	//vec4 threshold = step(0.95, base_color);
	vec2 tex_offset = 1.0 / vec2(1920.0 * 0.5, 1080.0 * 0.5);
	float intensity = 0.4;
	if (h==1) {
		for(int i = 0; i < SIZE; ++i)
	    {
	        rgb_base += texture2D(thresholded, v_vTexcoord + vec2(tex_offset.x * float(i), 0.0)).rgb * intensity * weight[i];
	        rgb_base += texture2D(thresholded, v_vTexcoord - vec2(tex_offset.x * float(i), 0.0)).rgb * intensity * weight[i];
	    }
	} else {
		for(int i = 0; i < SIZE; ++i)
	    {
	        rgb_base += texture2D(thresholded, v_vTexcoord + vec2(0.0, tex_offset.y * float(i))).rgb * intensity * weight[i];
	        rgb_base += texture2D(thresholded, v_vTexcoord - vec2(0.0, tex_offset.y * float(i))).rgb * intensity * weight[i];
	    }
	}
	
    gl_FragColor = vec4(rgb_base, 1.0);
}
