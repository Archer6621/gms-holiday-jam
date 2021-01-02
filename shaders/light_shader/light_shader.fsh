//
// Simple passthrough fragment shader
//
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
uniform float cos_angle;
uniform float sin_angle;

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
	
	// Need this to correct the normals for the light angle
	mat2 rotation_matrix = mat2( 
		vec2(cos_angle, -sin_angle), 
		vec2(sin_angle,  cos_angle) 
	);
	
	vec3 total_light_color = vec3(0.0);
	for (int i = 0; i < MAX_LIGHTS; ++i) {
		// Diffuse lighting
		vec2 flipped_dir = light_pos[i] - screen_pos;
		flipped_dir = vec2(flipped_dir.x, -flipped_dir.y); // Possibly because y is down in GM
		vec3 light_dir = normalize(vec3(rotation_matrix * flipped_dir, -light_height)); // Negative z means above
		float diffuse = max(dot(normal, light_dir), 0.0);
		
		// Specular lighting
		vec3 half_way_dir = normalize(light_dir + view_dir); // blinn-phong
		float spec = pow(max(dot(normal, half_way_dir), 0.0), 128.0);
		
		// Falloff calculation (basic inverse linear)
	    float inv_light_dist = light_radius[i] / distance(light_pos[i], screen_pos);
		total_light_color += light_intensity[i] * inv_light_dist * (diffuse * light_color[i] + spec);
	}
	
	vec4 texture = texture2D(gm_BaseTexture, v_vTexcoord );
    gl_FragColor = vec4(max(emission_strength * emission, lighting_intensity * total_light_color + ambient * v_vColour.rgb * texture.rgb), v_vColour.a *  texture.a);
}
