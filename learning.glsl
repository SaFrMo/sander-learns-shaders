#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

void main() {
	vec2 st = gl_FragCoord.xy/u_resolution;

    vec3 color = vec3(st.x);

	gl_FragColor = vec4(color, 1.);
}
