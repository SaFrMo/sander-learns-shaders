## Table of Contents
1. [Introduction](#introduction)
    1. [Organization](#organization)
2. [First Steps](#first-steps)

## Introduction
I've been wanting to write GLSL shaders since I first saw websites like [Shadertoy](https://www.shadertoy.com/) and [Codepen](https://codepen.io/), but I could never find an approachable guide until stumbling across [The Book of Shaders](https://thebookofshaders.com/).

This repo isn't going to be a guide like The Book of Shaders is, but rather a set of snapshots of me working through the tutorials on that site. I'm hoping to document my thought process and experience learning GLSL to help any other beginners along the way!

### Organization
I'll keep my starting point in the top level of the repo at `base.glsl`. Any interesting and unexpected I come across will be in the `happy-accidents`, and the rest of the directories will reference specific entries.

I'm writing this code in [Atom](https://atom.io/) using the `glsl-preview` and `language-glsl` packages for code highlighting and previewing results.

## First Steps
I've got the basics up and running and I've read the first few sections of The Book of Shaders, so I'm going to distill what I've learned so far here:

1. We'll be working with **fragment shaders** as opposed to **vertex shaders** in GLSL. Fragment shaders draw each pixel, or fragment, of a defined area, while vertex shaders actually define that area in 2D/3D space. We'll be working with a rectangle the full width and height of the screen, so we won't have to worry about any perspective effects or other distortion that comes with vertex shaders.

    (Quick note - I'm not 100% sure if GLSL can handle vertex shaders or if they're written in some other system at the moment, and a quick Google doesn't give me an answer I can fully understand yet. I'll come back to this question whenever I find out.)
1. We'll be using a coordinate system that goes from (0, 0) in the bottom left corner of the image to (1, 1) in the top right.

    ![Image showing coordinates of (0,0) in bottom left hand corner, (1,1) in top right, with a black-to-white gradient on the background](/SaFrMo/sander-learns-shaders/tree/master/images/coordinate-system.png)

(More coming soon!)
