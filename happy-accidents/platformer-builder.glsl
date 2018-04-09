#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

vec3 rectangle(vec2 st, vec2 center, vec2 side){
    float x = step(center.x - side.x / 2., st.x) - step(center.x + side.x / 2., st.x);

    float y = step(center.y - side.y / 2., st.y) - step(center.y + side.y / 2., st.y);

    return vec3(x - y);
}

void main() {
	vec2 st = gl_FragCoord.xy/u_resolution;

    vec3 color = vec3(0.);

    color += rectangle(st, vec2(0.5), vec2(0.2));

    color += rectangle(st, u_mouse, vec2(0.1));

    if( step(0.49, st.x) - step(0.51, st.x) == 1. ){
        //color = vec3(0., 1., 0.);
    }

	gl_FragColor = vec4(color,1.0);
}
