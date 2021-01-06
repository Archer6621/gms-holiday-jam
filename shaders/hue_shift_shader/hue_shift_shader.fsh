varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float h_shift;
uniform float s_shift;

// Obtained from: https://stackoverflow.com/questions/15095909/from-rgb-to-hsv-in-opengl-glsl/17897228#17897228
// Licensed under WTFPL, essentially public domain
vec3 rgb2hsv(vec3 c)
{
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));

    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}
vec3 hsv2rgb(vec3 c)
{
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

void main()
{
	vec4 sampled = texture2D(gm_BaseTexture, v_vTexcoord);
	vec3 hsv = rgb2hsv(sampled.rgb);
	hsv.r += h_shift;
	hsv.s += s_shift;
	vec3 rgb = hsv2rgb(hsv);
    gl_FragColor = v_vColour * vec4(rgb, sampled.a);
}
