#version 150

in vec4 position;
in vec4 vertColor; // Vertex color as input
in vec2 vertTexCoord; // Vertex texture coordinates as input

out vec4 fragPosition;
out vec4 fragVertColor; // Pass vertex color to the fragment shader
out vec2 fragVertTexCoord; // Pass vertex texture coordinates to the fragment shader

void main() {
    gl_Position = position;
    fragPosition = position;

    // Pass vertex color and texture coordinates to the fragment shader
    fragVertColor = vertColor;
    fragVertTexCoord = vertTexCoord;
}