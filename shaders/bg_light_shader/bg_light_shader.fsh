#extension GL_OES_standard_derivatives : require

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 screen_pos;

const int MAX_LIGHTS = 50;

uniform vec3 light_color[MAX_LIGHTS];
uniform float light_radius[MAX_LIGHTS];
uniform float light_intensity[MAX_LIGHTS];
uniform vec2 light_pos[MAX_LIGHTS];
uniform float ambient;
uniform float lighting_intensity;
uniform float emission_strength;
uniform float normal_strength;
//uniform float cos_angle;
//uniform float sin_angle;
uniform float depth;

uniform sampler2D normal;
uniform sampler2D emission;

const vec3 view_dir = vec3(0.0, 0.0, 1.0);	// Straight from above, pointing into the background
const float light_height = 5.0;

void main()
{
	vec3 normal = texture2D(normal, v_vTexcoord).rgb;
	normal = normalize(normal * 2.0 - 1.0);
	normal.xy *= normal_strength;
	normal.z = -normal.z - 0.0001; // This way we can omit a normal map
	normal = normalize(normal);
	
	vec3 emission = texture2D(emission, v_vTexcoord).rgb;
	
	// Don't need to send uniforms thanks to this nifty trick, which does require an extension
	// No big deal for the regular meshes, but for the backgrounds this saves a couple of hundred vertex buffer breaks
	vec2 dx = normalize(dFdx(v_vTexcoord));
	float c = dot(dx, vec2(1.0, 0.0)); // dot(v1, v2) = |v1||v2|cos(angle)
	float s = dot(dx, vec2(0.0, 1.0)); // We can get the sine by just rotating the base vector 90 degrees
	
	// Need this to correct the normals for the light angle
	mat2 rotation_matrix = mat2( 
		vec2(c, -s), 
		vec2(s,  c) 
	);
	
	vec3 total_light_color = vec3(0.0);
	for (int i = 0; i < 10; ++i) {
		// Diffuse lighting
		vec2 flipped_dir = light_pos[i] - screen_pos;
		flipped_dir = vec2(flipped_dir.x, -flipped_dir.y); // Possibly because y is down in GM
		vec3 light_dir = normalize(vec3( rotation_matrix * flipped_dir, -light_height + depth)); // Negative z means above
		float diffuse = max(dot(normal, light_dir), 0.0);
		
		// Specular lighting - don't use this for the background stuff as it tends to be far away and very diffuse
		//vec3 half_way_dir = normalize(light_dir + view_dir); // blinn-phong
		float spec = 0.0;//pow(max(dot(normal, half_way_dir), 0.0), 128.0);
		
		// Falloff calculation (basic inverse linear)
	    float inv_light_dist = light_radius[i] / distance(vec3(light_pos[i], -light_height), vec3(screen_pos, depth));
		total_light_color += light_intensity[i] * inv_light_dist * (diffuse * light_color[i] + spec);
	}
	
	vec4 texture = texture2D(gm_BaseTexture, v_vTexcoord );
    gl_FragColor = vec4(max(emission_strength * emission, pow(texture.rgb, vec3(0.25)) * lighting_intensity * total_light_color *  texture.a + ambient * v_vColour.rgb * texture.rgb), v_vColour.a *  texture.a);
}
