//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 screen_pos;

const int MAX_LIGHTS = 8;

uniform vec3 light_color[MAX_LIGHTS];
uniform float light_radius[MAX_LIGHTS];
uniform vec2 light_pos[MAX_LIGHTS];

void main()
{
	vec3 total_light_color = vec3(0.0);
	for (int i = 0; i < MAX_LIGHTS; ++i) {
	    float inv_light_dist = light_radius[i] / distance(light_pos[i], screen_pos);
		total_light_color += inv_light_dist * light_color[i];
	}
	
	vec4 texture = texture2D( gm_BaseTexture, v_vTexcoord );
    gl_FragColor = vec4(0.5 * total_light_color + 0.5 * v_vColour.rgb * texture.rgb, v_vColour.a *  texture.a);
}
