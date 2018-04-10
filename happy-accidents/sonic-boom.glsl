#ifdef GL_ES
precision mediump float;
#endif

void main() {
	vec2 st = gl_FragCoord.xy/u_resolution;

	// u_time is the time in seconds since load
	// (above) * 0.2 slows down the timescale
	// fract(above) creates a pattern that increases from 0 to 1, then cuts to 0 and repeats (sawtooth wave)
	// (above) - 0.4 pushes our starting state below 0, so it looks like we fade in
	// (above) * 2.5 increases the size of the radius
	float radius = (fract(u_time * 0.2) - 0.4) * 2.5;

	// st is the 0-1 coordinate of the current pixel
	// (above) - 0.5 moves the coordinate system so it's (-.5, -.5) to (.5, .5)
	vec2 center = st - 0.5;
    float color = 1. - pow(length(center) - radius, 0.2);

	gl_FragColor = vec4(vec3(color), 1.);
}
