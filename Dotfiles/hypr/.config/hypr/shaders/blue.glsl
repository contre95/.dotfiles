precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

void main() {

    vec4 pixColor = texture2D(tex, v_texcoord);

    // green
    pixColor[1] *= 0.1;

    // red
    pixColor[0] *= 0.1;

    gl_FragColor = pixColor;
}
