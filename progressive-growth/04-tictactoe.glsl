#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

float circle(in vec2 st){
	float o = 0.;
	float d = distance(st, vec2(0.5));

	o += 	smoothstep(0.25, 0.26, d) -
			smoothstep(0.4, 0.41, d);

	return o;
}

mat2 rotate2d(float angle){
	return mat2(cos(angle), -sin(angle),
				sin(angle), cos(angle));
}

float cross(in vec2 st){

	st -= 0.5;
	st = rotate2d(PI / 4.) * st;
	st += 0.5;

	vec2 vrt = smoothstep(vec2(0.4, 0.2), vec2(0.41, 0.21), st) *
			(1. - smoothstep(vec2(0.6, 0.8), vec2(0.61, 0.81), st));

	vec2 hz = smoothstep(vec2(0.2, 0.4), vec2(0.21, 0.41), st) *
			(1. - smoothstep(vec2(0.8, 0.6), vec2(0.81, 0.61), st));


	return hz.x * hz.y + vrt.x * vrt.y;
}

void main() {
	// Let's make a tic-tac-toe board!

	// bottom left to top right = (0., 0.) to (1., 1.)
	vec2 st = gl_FragCoord.xy/u_resolution;

	// scale up to a 3x3 grid
	st *= 3.;

	// start with a black background
	float color = 0.;

	// let's make our board look like this:
	// X | X | O
	// O | X | O
	// X | O | O
	// (with a line through the right-side O's)

	// get our relative coordinates
	// bottom left to top right: (0., 0.) to (2., 2.)
	vec2 rel = vec2(floor(st.x), floor(st.y));

	// normalize to (0., 0.) to (1., 1.) in our current square
	st = fract(st);

	float borderStroke = 0.02;

	// all x = 0 and x = 1 tiles have a border on the right
	if( rel.x == 0. || rel.x == 1. ){
		color = step(1. - borderStroke / 2., st.x);
	}
	// all x = 1 and x = 2 tiles have a border on the left
	if( rel.x == 1. || rel.x == 2. ){
		color += step(st.x, borderStroke / 2.);
	}
	// y = 0 and y = 1 have a border on the top
	if( rel.y == 0. || rel.y == 1. ){
		color += step(1. - borderStroke / 2., st.y);
	}
	// all y = 1 and y = 2 tiles have a border on the bottom
	if( rel.y == 1. || rel.y == 2. ){
		color += step(st.y, borderStroke / 2.);
	}

	// all x = 2 squares get a circle
	if( rel.x == 2. ){
		color += circle(st);
	} else if( rel.x == 0. && rel.y == 1. ){
		color += circle(st);
	} else if( rel.x == 1. && rel.y == 0. ){
		color += circle(st);
	} else {
		color += cross(st);
	}


    vec3 c = vec3(color);

	gl_FragColor = vec4(c, 1.);
}