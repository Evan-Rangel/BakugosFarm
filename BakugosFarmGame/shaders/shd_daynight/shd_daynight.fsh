//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float daynight_time;

void main()
{
    sampler2D gm_BaseTexture;

float4 main(float2 v_vTexcoord: TEXCOORD0, float4 v_vColour: COLOR0) : COLOR
{
    float daynight_time : register(c0);
    
    // Tu lógica de ciclo día-noche aquí
    // Puedes utilizar daynight_time para ajustar el aspecto según el tiempo del ciclo

    // Ejemplo básico: Ajustar la saturación en base al tiempo
    float saturation = 1.0 - abs(sin(daynight_time));
    float4 color = tex2D(gm_BaseTexture, v_vTexcoord) * v_vColour;

    // Convertir de RGB a HSV
    float3 hsv = rgb_to_hsv(color.rgb);

    // Ajustar la saturación
    hsv.y *= saturation;

    // Convertir de HSV a RGB
    color.rgb = hsv_to_rgb(hsv);

    return color;
}

// Función para convertir de RGB a HSV
float3 rgb_to_hsv(float3 c)
{
    float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    float4 p = lerp(float4(c.bg, K.wz), float4(c.gb, K.xy), step(c.b, c.g));
    float4 q = lerp(float4(p.xyw, c.r), float4(c.r, p.yzx), step(p.x, c.r));

    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;

    return float3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}

// Función para convertir de HSV a RGB
float3 hsv_to_rgb(float3 c)
{
    float4 K = float4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    float3 p = abs(frac(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * lerp(K.xxx, saturate(p - K.xxx), c.y);
}
}
