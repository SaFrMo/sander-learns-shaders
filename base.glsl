#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

void main() {
	vec2 st = gl_FragCoord.xy/u_resolution;

	float color = st.x;

    vec3 c = vec3(color);

	gl_FragColor = vec4(c, 1.);
}
