//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 object_pos;



void main()
{
	vec4 base_color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord);
    gl_FragColor = smoothstep(0.0, 0.95, pow(base_color, vec4(2.0)));
}
