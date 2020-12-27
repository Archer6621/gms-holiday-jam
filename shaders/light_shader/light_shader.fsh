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
uniform sampler2D normal;

void main()
{
	vec3 normal = texture2D(normal, v_vTexcoord).rgb;
    normal = normalize(normal * 2.0 - 1.0);   

	vec3 total_light_color = vec3(0.0);
	for (int i = 0; i < MAX_LIGHTS; ++i) {
		// Diffuse lighting
		vec3 light_dir = normalize(vec3(light_pos[i], 5.0) - vec3(screen_pos, 0.0)); 
		float diffuse = max(dot(normal, light_dir), 0.0);
		
		// Specular lighting
		vec3 view_dir = vec3(0.0, 0.0, 1.0);	// From above
		vec3 reflect_dir = reflect(-light_dir, normal);  
		float spec = pow(max(dot(view_dir, reflect_dir), 0.0), 32.0);
		
	    float inv_light_dist = light_radius[i] / distance(light_pos[i], screen_pos);
		total_light_color += inv_light_dist * (diffuse * light_color[i] + spec);
	}
	
	vec4 texture = texture2D(gm_BaseTexture, v_vTexcoord );
    gl_FragColor = vec4(0.5 * total_light_color + 0.5 * v_vColour.rgb * texture.rgb, v_vColour.a *  texture.a);
}
