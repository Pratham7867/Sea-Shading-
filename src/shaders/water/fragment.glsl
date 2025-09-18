uniform vec3 uDepthColor;
uniform vec3 uSurfaceColor;
uniform float uColorOffset;
uniform float uColorMultiplier;

varying float vElevation;

void main()
{
    // base color 

    float mixStrength = (vElevation + uColorOffset) * uColorMultiplier;
    mixStrength = smoothstep( 0.0, 1.0,mixStrength);
    vec3 color = mix(uDepthColor, uSurfaceColor, mixStrength);
    
    // final color 
    gl_FragColor = vec4(color, 1.0);
    #include <tonemapping_fragment> 
    #include <colorspace_fragment>
}