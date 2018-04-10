#ifdef GL_ES
precision mediump float;
#endif

void main() {
	vec2 st = gl_FragCoord.xy/u_resolution;

	float radius = (fract(u_time * 0.2) - 0.4) * 2.5;
	vec2 center = st - 0.5;
    float color = 1. - pow(length(center) - radius, 0.2);

	gl_FragColor = vec4(vec3(color), 1.);
}
