#version 330 core
layout (location = 0) in vec3 a_pos;
layout (location = 1) in vec3 a_normal;
layout (location = 2) in vec2 a_tex_coords;
out vec2 v_tex_coords;
out float v_intensity;

uniform mat4 u_mvp;
uniform mat4 u_rot;

vec3 light_dir = vec3(0, -0.707, 0.707);

void main() {
    gl_Position = u_mvp * vec4(a_pos, 1);

    v_tex_coords = a_tex_coords;
    vec3 rot_normal = (u_rot * vec4(a_normal, 0)).xyz;
    v_intensity = clamp(dot(rot_normal, -light_dir), 0, 1);
}