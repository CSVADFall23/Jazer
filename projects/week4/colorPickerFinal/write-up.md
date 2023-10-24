I made this color picker as a fun way to interact with color and proportion. I started with the swatch (originally vertical, but later changed to horizontal) and mapped the hue to the long dimension. The short dimension has saturation increasing in one direction and the square of the brightness in the other. This doesn’t quite get all of the colors (eg. no grey and no bright and saturated colors) but covers a lot of them. One strength of this layout is moving the mouse horizontally picks colors of the same saturation, making them match fairly well. 

The next thing I did was figure how to create the voronoi pattern. Found the easiest way to create the effect is to write vertices in the shape of 3D cones with really wide bases and then view them in orthographic projection. This approach worked well with the other idea for the picker, which involved animating circles using vertlet integration.

Using circles of only one size didn’t satisfy the goal of exploring proportions so I added the ability to create different size circles and mapped that to the number keys. Since the physics simulation keeps running in the voronoi view the proportion of the larger circles’ color stay intact between views. 

The method for drawing the voronoi pattern added the possibility to change the look by drawing more or less of the vertices that make up the base of the cone. These were also mapped to the number keys. 

Since the vertices were being draw individually, I could change the fill color for each vertex and the renderer interpolates when shading. This allows for some fake lighting options. 

Adding the different modes and all of the options required a lot of words to explain. The presentation of these instructions are my least favorite part of the design. A popup window or a designated text spot where no other animation is happening would be better.
