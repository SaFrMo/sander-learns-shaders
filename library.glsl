#ifdef GL_ES
precision mediump float;
#endif

// Some useful GLSL snippets!

// Rotate a coordinate space by X degrees
// example: 	st = rotate2d(st, 40.);
//              (continue drawing here)
vec2 rotate2d(in vec2 uv, in float angle, in vec2 origin){
    uv -= origin;
    uv *= mat2( cos(angle), -sin(angle),
                sin(angle), cos(angle));
    uv += origin;
    return uv;
}

// Tile a grid to be gridSize x gridSize large
vec2 tile(in vec2 uv, in float gridSize){
    uv *= gridSize;
    return fract(uv);
}
