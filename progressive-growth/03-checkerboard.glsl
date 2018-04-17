#ifdef GL_ES
precision mediump float;
#endif

void main() {
	// Let's make a checkerboard!

	// First, we'll normalize the coordinates along the X axis.
	// This means that X will go from 0. to 1., as well as dictate
	// the size of the Y coordinate system.
	// For example, if we're  at a 56.25% aspect ratio, the bottom
	// left will be (0., 0.) and the top right (1., 0.5625).
	vec2 st = gl_FragCoord.xy/u_resolution.x;

	// how many spaces wide will the board be?
	float spaces = 10.;

	// scale up the space by the number of spaces
	// now there are 10 spaces that go from 0 to 1
	st *= spaces;

	// get the non-decimal component (floor) of our current X coordinate
	float fx = floor(st.x);
	// if f is even, color starts at 0; if odd, it starts at 1
	float color = mod(fx, 2.);

	// get our current Y floor
	float yf = floor(st.y);
	// if it's even, we'll leave the color where it is (ie, subtract by 0);
	// otherwise we'll subtract 1, which will either take the color to 0 or -1
	color -= mod(yf, 2.);

	// make the color the absolute value of itself
	color = abs(color);

	// apply!
    vec3 c = vec3(color);

	gl_FragColor = vec4(c, 1.);
}
