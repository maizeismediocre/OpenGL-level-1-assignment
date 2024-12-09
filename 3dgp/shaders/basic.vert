// VERTEX SHADER

#version 330


// Matrices

uniform mat4 matrixProjection;

uniform mat4 matrixView;

uniform mat4 matrixModelView;


// Materials

uniform vec3 materialAmbient;

uniform vec3 materialDiffuse;

uniform vec3 materialSpecular;

uniform float shininess;


in vec3 aVertex;

in vec3 aNormal;


out vec4 color;

vec4 position;

vec3 normal;

// Light declarations

struct AMBIENT

{

vec3 color;

};

uniform AMBIENT lightAmbient;

vec4 AmbientLight(AMBIENT light)

{

// Calculate Ambient Light

return vec4(materialAmbient * light.color, 1);

}
void main(void)

{

// calculate position

position = matrixModelView * vec4(aVertex, 1.0);
gl_Position = matrixProjection * position;

normal = normalize(mat3(matrixModelView) * aNormal);

// calculate light

color = vec4(0, 0, 0, 1);
color += AmbientLight(lightAmbient);
}
