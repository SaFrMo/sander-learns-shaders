#ifdef GL_ES
precision mediump float;
#endif

void main() {
    // Let's draw a circle that will always fit in the bounds of the image!

    // Find the center coordinates
    vec2 center = u_resolution * .5;

    // Figure out the radius -
    // It'll be a fraction of the width or height, whichever is smallest
    // (We use whichever is smallest so that the circle is guaranteed to fit)
    float radius = min(u_resolution.x, u_resolution.y) * 0.2;

    // Let's take our camera and shift it down and to the left by (center.x, center.y) px
    // (We're actually shifting the whole coordinate system, but I find it easier to think in terms of a camera moving on a surface)
	vec2 coords = gl_FragCoord.xy - center;

    // A couple things going on here:
    //  1.  We're calculating the length of our current coordinates - ie, their distance from (0, 0)
    //  2.  We're calculating the smoothstep from desiredRadius - 1 to desiredRadius
    //      This means that any value below desiredRadius - 1 will come out as 0,
    //      while any value above it will come out as 1.
    //      If the value falls between desiredRadius - 1 and desiredRadius, it'll get a nice,
    //      smoothed-out value between 0 and 1, softening the edge of our circle
	float color = smoothstep(radius - 1., radius, length(coords));

    // That's it! Resize away - the circle will always be contained in the center of the image.
	gl_FragColor = vec4(vec3(color), 1.);
}
