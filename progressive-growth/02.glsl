#ifdef GL_ES
precision mediump float;
#endif

void main() {
    // Let's take the circle from the last shader and move it in a figure-8 pattern!

    // First, we'll save a few values that haven't changed since last time
    vec2 center = u_resolution * .5;
    float radiusPercentage = 0.2;
    float radius = min(u_resolution.x, u_resolution.y) * radiusPercentage;

    // We'll be adding an offset to the camera, so let's get it ready
    vec2 offset = (vec2(0.));

    // A figure-8 pattern is basically just two sine waves of different frequencies.
    // Let's make our x-offset take twice as long to complete a single cycle as our y-offset.
    // sin(x) will give us a value between -1 and 1, and u_time measures seconds since load.

    // We want the circle to take twice as long to move backwards and forwards along the X axis
    // as it does on the Y, so let's divide u_time by 2 to slow down time on the X axis.
    // We'll then multiply that value by half of the width (center.x), so that it moves from the center
    // to the edges of the image.
    offset.x += sin(u_time / 2.) * center.x;
    offset.y += sin(u_time) * center.y;

    // Apply the offset to the camera!
    vec2 camera = center + offset;

    // These are all the same as the last shader
	vec2 coords = gl_FragCoord.xy - camera;
	float color = smoothstep(radius - 1., radius, length(coords));
	gl_FragColor = vec4(vec3(color), 1.);
}
