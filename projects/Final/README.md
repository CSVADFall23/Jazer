# A Series of Generative Works: Isometric Projection and  Depth Perception 
## Studies in Hexagonal Grids
Jazer Sibley-Schwartz
Final Project for MAT236
Fall 2023

## Motivation
This project is part of an ongoing interest with how we perceive visual depth and the use of mathematical projection to map from higher dimensional spaces to the 2D plane of vision.

## Isometric Projection
This is one of many projection mappings that give the illusion of 3D shapes on 2D surfaces. It is isometric because the scale of each axis is the same and this results in the angles between each axis being 120º. This project will focus on isometrically projecting cubes.
https://en.wikipedia.org/wiki/Isometric_projection#/media/File:Comparison_of_graphical_projections.svg

## Artistic Inspiration
I am drawing a lot from the artist @metricstereo on instagram
https://www.instagram.com/metricstereo/
Since starting this project I also found this plotter artist that I drew inspiration from:
https://www.instagram.com/machine.arm/

## Approaches
There are a few generative approaches to creating isometric cubes. Overlapping hexagons will form isometric cubes, but the grid of hexagons diminishes the illusion of depth. The isometric cubes are made of three identical parallelograms in different orientations. Using these as the generative building block gives the most control over which facet is being created. The three orientations are a left-leaning parallelogram, right-leaning parallelogram, and a vertically oriented parallelogram (diamond). The angles inside the parallelograms alternate between 60º and 120º. 
Trying to devise rules starting with a single tile proved to be algorithmically unfeasible. The best approach is to start with three adjacent planes of tiles in each orientation such that the appearance of a full cube is created. From that configuration only one modification preserves the appearance of an unbroken surface: rotate the three tiles in the center, the ones whose centers are the closest, by 180 degrees. This is the one rule for generating variations that retain the appearance of a continuous surface. The first rotation will preserve the center tiles’ distances to one another, as well as create three more groups of tiles that could be rotated, each containing one of the tiles from the center group.
This sort of approach requires each tile to look for the centers of every other tile and determine distance, a O(n^2^) scenario. The best solution I could come up with is to construct my original cube outward from the center of the screen and weighting a random sampling index to favor sampling tiles from the beginning of the Illustrator path items array. With this approach I was able to turn approximately 20 tiles per 1000 iterations of the algorithm. This was run repeatedly on the same document via scripting and each run of the script  took around two and a half minutes to complete. Also, the algorithm became a little more efficient as more tiles were turned, increasing the probability of finding an eligible group of three tiles. 


I thought I could get a little more performance by using a hash table that links grid points in the document with points that are nearby. I’m not sure this provided any benefit since the grid points remain while the tiles that are nearby change. It probably would have been better to pick random tiles from the beginning of the item path array since those tiles retain the data structure (well they would have if I change my algorithm a little. In the current code the group is rotated, each tile is duplicated, and the group is removed. I think I could have just ungrouped instead and the data structure would have remained). 


Ultimately, this avenue proved to be not as flexible as I had hoped. It did not provide fast enough results nor the flexibility I wanted for creating a series of works.
 
## Processing
To the rescue…..
Thinking in 3D made this a much easier problem to solve. Utilizing orthographic projection via the ortho() method and drawing cubes in 3D space was fairly straightforward. (I ended up actually only drawing the front and top quads of cubes and columns in the hopes of using svg output to make vector paths directly. I did achieve this but not exactly in the original cube template shape. Employing a simple two rule system where the bottom of the first cube in a stack has to be higher than both the top of the row below and the block previous resulted in very frond or feather-like configurations)


For the more block-like configurations I output images from processing. Using path tracing in Illustrator on an image from processing didn’t capture the sharp edges I wanted. Vectorizer.ai proved to work fairly well. It also had the added feature of grouping by color. That meant I could make clipping masks for each face direction. This wasn’t as straightforward as I would have liked because the clipping mask doesn’t truncate paths. So I would have to rasterize the masked lines and then Image trace them. In this case for whatever reason, Illustrator worked better than vectorizer.ai. I also ended up drawing the paths directly in Processing. This works, but still relied on Vectorizer.ai's ability to capture those lines, and it wasn't great at it. Also, I could only figure out how to draw the left and right faces and couldn't puzzle a way to draw the gradient on the tops.

I also was able to create continuous surfaces using processing. The simple rule when drawing columns in rows is that the height of each column must be as high or higher than the column in the row below and the tile drawn just before it.

## Plotting
Plotting itself went fairly smoothly. It was interesting how different the plotted piece was from the screen version. The pens add a lot of character depending on how much they bled into the paper. Each of the individual paths in these pieces start and end at the same point, so those spots tend to be a bit thicker than the rest of the line.  
The colors from the Sharpie set worked well together. When choosing colors for outlines and gradient lines it was important that the gradient lines were lighter than the outline color as the paths overlapped slightly. Going between pen sizes was a bit tricky. Between the two sizes of Sharpies required a small shim and a rubber band. Going between Sharpies and the triangular bodied Staedtler pens didn’t always go well. 
Time-lapse videos of plots:
https://youtube.com/shorts/VsZE3IpPriE
https://youtu.be/AZGeLrmxwOE

## Things I thought I might explore but didn’t
I didn’t use Illustrator’s built-in path effects/manipulations. I did a couple tests at the very beginning of my process and I felt the modified path shape distracted from the 3D-ness. I will probably try again with some of the more developed pieces, potentially just creating my own with additional vertex calls between the column vertices. 
I didn’t warp the grid to explore where the 3D effect breaks down.
I did not do any hexagonal truchet tiling. I really want to do this, so I guess that gives me an excuse to continue with this series.