//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Custom/GaussianBlur" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_BlurAmount ("Blur Amount", Range(0, 10)) = 2
_BlurIterations ("Blur Iterations", Range(1, 10)) = 3
}
SubShader {
 LOD 100
 Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Name "FORWARD"
  LOD 100
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" "SHADOWSUPPORT" = "true" }
  GpuProgramID 57796
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
vec2 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
float u_xlat15;
bool u_xlatb15;
vec2 u_xlat18;
int u_xlati21;
bool u_xlatb22;
mediump float u_xlat16_23;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati21 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb15 = u_xlati21>=_BlurIterations;
        if(u_xlatb15){break;}
        u_xlati21 = u_xlati21 + 1;
        u_xlat15 = float(u_xlati21);
        u_xlat15 = u_xlat15 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb22 = 2.5<u_xlat4.x;
            if(u_xlatb22){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb22 = 2.5<u_xlat4.y;
                if(u_xlatb22){break;}
                u_xlat18.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat18.xy = u_xlat18.xy * vec2(u_xlat15) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat18.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat16_23 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_23 = max(u_xlat16_23, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * _LightColor0.xyz;
    SV_Target0.xyz = vec3(u_xlat16_23) * u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
vec2 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
float u_xlat15;
bool u_xlatb15;
vec2 u_xlat18;
int u_xlati21;
bool u_xlatb22;
mediump float u_xlat16_23;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati21 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb15 = u_xlati21>=_BlurIterations;
        if(u_xlatb15){break;}
        u_xlati21 = u_xlati21 + 1;
        u_xlat15 = float(u_xlati21);
        u_xlat15 = u_xlat15 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb22 = 2.5<u_xlat4.x;
            if(u_xlatb22){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb22 = 2.5<u_xlat4.y;
                if(u_xlatb22){break;}
                u_xlat18.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat18.xy = u_xlat18.xy * vec2(u_xlat15) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat18.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat16_23 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_23 = max(u_xlat16_23, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * _LightColor0.xyz;
    SV_Target0.xyz = vec3(u_xlat16_23) * u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
vec2 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
float u_xlat15;
bool u_xlatb15;
vec2 u_xlat18;
int u_xlati21;
bool u_xlatb22;
mediump float u_xlat16_23;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati21 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb15 = u_xlati21>=_BlurIterations;
        if(u_xlatb15){break;}
        u_xlati21 = u_xlati21 + 1;
        u_xlat15 = float(u_xlati21);
        u_xlat15 = u_xlat15 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb22 = 2.5<u_xlat4.x;
            if(u_xlatb22){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb22 = 2.5<u_xlat4.y;
                if(u_xlatb22){break;}
                u_xlat18.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat18.xy = u_xlat18.xy * vec2(u_xlat15) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat18.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat16_23 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_23 = max(u_xlat16_23, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * _LightColor0.xyz;
    SV_Target0.xyz = vec3(u_xlat16_23) * u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat16_2 = u_xlat0.y * u_xlat0.y;
    u_xlat16_2 = u_xlat0.x * u_xlat0.x + (-u_xlat16_2);
    u_xlat16_0 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD3.xyz = unity_SHC.xyz * vec3(u_xlat16_2) + u_xlat16_3.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 _LightColor0;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec2 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
float u_xlat17;
bool u_xlatb17;
vec2 u_xlat20;
int u_xlati24;
bool u_xlatb25;
mediump float u_xlat16_26;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati24 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb17 = u_xlati24>=_BlurIterations;
        if(u_xlatb17){break;}
        u_xlati24 = u_xlati24 + 1;
        u_xlat17 = float(u_xlati24);
        u_xlat17 = u_xlat17 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb25 = 2.5<u_xlat4.x;
            if(u_xlatb25){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb25 = 2.5<u_xlat4.y;
                if(u_xlatb25){break;}
                u_xlat20.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat20.xy = u_xlat20.xy * vec2(u_xlat17) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat20.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat0.xyz = vs_TEXCOORD1.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_7.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_7.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_7.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_7.xyz = u_xlat16_7.xyz + vs_TEXCOORD3.xyz;
    u_xlat16_7.xyz = max(u_xlat16_7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_7.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_26 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_26 = max(u_xlat16_26, 0.0);
    u_xlat16_7.xyz = u_xlat16_2.xyz * _LightColor0.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz * vec3(u_xlat16_26) + u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat16_2 = u_xlat0.y * u_xlat0.y;
    u_xlat16_2 = u_xlat0.x * u_xlat0.x + (-u_xlat16_2);
    u_xlat16_0 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD3.xyz = unity_SHC.xyz * vec3(u_xlat16_2) + u_xlat16_3.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 _LightColor0;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec2 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
float u_xlat17;
bool u_xlatb17;
vec2 u_xlat20;
int u_xlati24;
bool u_xlatb25;
mediump float u_xlat16_26;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati24 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb17 = u_xlati24>=_BlurIterations;
        if(u_xlatb17){break;}
        u_xlati24 = u_xlati24 + 1;
        u_xlat17 = float(u_xlati24);
        u_xlat17 = u_xlat17 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb25 = 2.5<u_xlat4.x;
            if(u_xlatb25){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb25 = 2.5<u_xlat4.y;
                if(u_xlatb25){break;}
                u_xlat20.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat20.xy = u_xlat20.xy * vec2(u_xlat17) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat20.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat0.xyz = vs_TEXCOORD1.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_7.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_7.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_7.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_7.xyz = u_xlat16_7.xyz + vs_TEXCOORD3.xyz;
    u_xlat16_7.xyz = max(u_xlat16_7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_7.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_26 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_26 = max(u_xlat16_26, 0.0);
    u_xlat16_7.xyz = u_xlat16_2.xyz * _LightColor0.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz * vec3(u_xlat16_26) + u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat16_2 = u_xlat0.y * u_xlat0.y;
    u_xlat16_2 = u_xlat0.x * u_xlat0.x + (-u_xlat16_2);
    u_xlat16_0 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD3.xyz = unity_SHC.xyz * vec3(u_xlat16_2) + u_xlat16_3.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 _LightColor0;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec2 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
float u_xlat17;
bool u_xlatb17;
vec2 u_xlat20;
int u_xlati24;
bool u_xlatb25;
mediump float u_xlat16_26;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati24 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb17 = u_xlati24>=_BlurIterations;
        if(u_xlatb17){break;}
        u_xlati24 = u_xlati24 + 1;
        u_xlat17 = float(u_xlati24);
        u_xlat17 = u_xlat17 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb25 = 2.5<u_xlat4.x;
            if(u_xlatb25){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb25 = 2.5<u_xlat4.y;
                if(u_xlatb25){break;}
                u_xlat20.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat20.xy = u_xlat20.xy * vec2(u_xlat17) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat20.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat0.xyz = vs_TEXCOORD1.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_7.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_7.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_7.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_7.xyz = u_xlat16_7.xyz + vs_TEXCOORD3.xyz;
    u_xlat16_7.xyz = max(u_xlat16_7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_7.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_26 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_26 = max(u_xlat16_26, 0.0);
    u_xlat16_7.xyz = u_xlat16_2.xyz * _LightColor0.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz * vec3(u_xlat16_26) + u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
float u_xlat17;
bool u_xlatb17;
vec2 u_xlat20;
int u_xlati24;
bool u_xlatb25;
mediump float u_xlat16_26;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati24 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb17 = u_xlati24>=_BlurIterations;
        if(u_xlatb17){break;}
        u_xlati24 = u_xlati24 + 1;
        u_xlat17 = float(u_xlati24);
        u_xlat17 = u_xlat17 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb25 = 2.5<u_xlat4.x;
            if(u_xlatb25){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb25 = 2.5<u_xlat4.y;
                if(u_xlatb25){break;}
                u_xlat20.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat20.xy = u_xlat20.xy * vec2(u_xlat17) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat20.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat8.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat8.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat8.x = (-u_xlat0.x) + u_xlat8.x;
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat8.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = texture2D(_ShadowMapTexture, vs_TEXCOORD5.xy).x;
    u_xlatb8 = vs_TEXCOORD5.z<u_xlat8.x;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat8.x = max(u_xlat8.x, _LightShadowData.x);
    u_xlat16_26 = (-u_xlat8.x) + 1.0;
    u_xlat16_26 = u_xlat0.x * u_xlat16_26 + u_xlat8.x;
    u_xlat16_7.xyz = vec3(u_xlat16_26) * _LightColor0.xyz;
    u_xlat16_26 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_26 = max(u_xlat16_26, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    SV_Target0.xyz = vec3(u_xlat16_26) * u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
float u_xlat17;
bool u_xlatb17;
vec2 u_xlat20;
int u_xlati24;
bool u_xlatb25;
mediump float u_xlat16_26;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati24 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb17 = u_xlati24>=_BlurIterations;
        if(u_xlatb17){break;}
        u_xlati24 = u_xlati24 + 1;
        u_xlat17 = float(u_xlati24);
        u_xlat17 = u_xlat17 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb25 = 2.5<u_xlat4.x;
            if(u_xlatb25){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb25 = 2.5<u_xlat4.y;
                if(u_xlatb25){break;}
                u_xlat20.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat20.xy = u_xlat20.xy * vec2(u_xlat17) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat20.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat8.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat8.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat8.x = (-u_xlat0.x) + u_xlat8.x;
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat8.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = texture2D(_ShadowMapTexture, vs_TEXCOORD5.xy).x;
    u_xlatb8 = vs_TEXCOORD5.z<u_xlat8.x;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat8.x = max(u_xlat8.x, _LightShadowData.x);
    u_xlat16_26 = (-u_xlat8.x) + 1.0;
    u_xlat16_26 = u_xlat0.x * u_xlat16_26 + u_xlat8.x;
    u_xlat16_7.xyz = vec3(u_xlat16_26) * _LightColor0.xyz;
    u_xlat16_26 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_26 = max(u_xlat16_26, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    SV_Target0.xyz = vec3(u_xlat16_26) * u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
float u_xlat17;
bool u_xlatb17;
vec2 u_xlat20;
int u_xlati24;
bool u_xlatb25;
mediump float u_xlat16_26;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati24 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb17 = u_xlati24>=_BlurIterations;
        if(u_xlatb17){break;}
        u_xlati24 = u_xlati24 + 1;
        u_xlat17 = float(u_xlati24);
        u_xlat17 = u_xlat17 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb25 = 2.5<u_xlat4.x;
            if(u_xlatb25){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb25 = 2.5<u_xlat4.y;
                if(u_xlatb25){break;}
                u_xlat20.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat20.xy = u_xlat20.xy * vec2(u_xlat17) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat20.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat8.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat8.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat8.x = (-u_xlat0.x) + u_xlat8.x;
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat8.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = texture2D(_ShadowMapTexture, vs_TEXCOORD5.xy).x;
    u_xlatb8 = vs_TEXCOORD5.z<u_xlat8.x;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat8.x = max(u_xlat8.x, _LightShadowData.x);
    u_xlat16_26 = (-u_xlat8.x) + 1.0;
    u_xlat16_26 = u_xlat0.x * u_xlat16_26 + u_xlat8.x;
    u_xlat16_7.xyz = vec3(u_xlat16_26) * _LightColor0.xyz;
    u_xlat16_26 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_26 = max(u_xlat16_26, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    SV_Target0.xyz = vec3(u_xlat16_26) * u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump float u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat16;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat16_3 = u_xlat1.y * u_xlat1.y;
    u_xlat16_3 = u_xlat1.x * u_xlat1.x + (-u_xlat16_3);
    u_xlat16_1 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_1);
    vs_TEXCOORD3.xyz = unity_SHC.xyz * vec3(u_xlat16_3) + u_xlat16_4.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
bool u_xlatb9;
float u_xlat19;
bool u_xlatb19;
vec2 u_xlat22;
int u_xlati27;
bool u_xlatb28;
mediump float u_xlat16_29;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati27 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb19 = u_xlati27>=_BlurIterations;
        if(u_xlatb19){break;}
        u_xlati27 = u_xlati27 + 1;
        u_xlat19 = float(u_xlati27);
        u_xlat19 = u_xlat19 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb28 = 2.5<u_xlat4.x;
            if(u_xlatb28){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb28 = 2.5<u_xlat4.y;
                if(u_xlatb28){break;}
                u_xlat22.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat22.xy = u_xlat22.xy * vec2(u_xlat19) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat22.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat9.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat9.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat9.x = (-u_xlat0.x) + u_xlat9.x;
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat9.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat9.x = texture2D(_ShadowMapTexture, vs_TEXCOORD5.xy).x;
    u_xlatb9 = vs_TEXCOORD5.z<u_xlat9.x;
    u_xlat9.x = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat9.x = max(u_xlat9.x, _LightShadowData.x);
    u_xlat16_29 = (-u_xlat9.x) + 1.0;
    u_xlat16_29 = u_xlat0.x * u_xlat16_29 + u_xlat9.x;
    u_xlat16_7.xyz = vec3(u_xlat16_29) * _LightColor0.xyz;
    u_xlat0.xyz = vs_TEXCOORD1.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_8.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_8.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_8.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_8.xyz = u_xlat16_8.xyz + vs_TEXCOORD3.xyz;
    u_xlat16_8.xyz = max(u_xlat16_8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_8.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_29 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_29 = max(u_xlat16_29, 0.0);
    u_xlat16_7.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz * vec3(u_xlat16_29) + u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump float u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat16;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat16_3 = u_xlat1.y * u_xlat1.y;
    u_xlat16_3 = u_xlat1.x * u_xlat1.x + (-u_xlat16_3);
    u_xlat16_1 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_1);
    vs_TEXCOORD3.xyz = unity_SHC.xyz * vec3(u_xlat16_3) + u_xlat16_4.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
bool u_xlatb9;
float u_xlat19;
bool u_xlatb19;
vec2 u_xlat22;
int u_xlati27;
bool u_xlatb28;
mediump float u_xlat16_29;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati27 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb19 = u_xlati27>=_BlurIterations;
        if(u_xlatb19){break;}
        u_xlati27 = u_xlati27 + 1;
        u_xlat19 = float(u_xlati27);
        u_xlat19 = u_xlat19 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb28 = 2.5<u_xlat4.x;
            if(u_xlatb28){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb28 = 2.5<u_xlat4.y;
                if(u_xlatb28){break;}
                u_xlat22.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat22.xy = u_xlat22.xy * vec2(u_xlat19) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat22.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat9.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat9.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat9.x = (-u_xlat0.x) + u_xlat9.x;
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat9.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat9.x = texture2D(_ShadowMapTexture, vs_TEXCOORD5.xy).x;
    u_xlatb9 = vs_TEXCOORD5.z<u_xlat9.x;
    u_xlat9.x = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat9.x = max(u_xlat9.x, _LightShadowData.x);
    u_xlat16_29 = (-u_xlat9.x) + 1.0;
    u_xlat16_29 = u_xlat0.x * u_xlat16_29 + u_xlat9.x;
    u_xlat16_7.xyz = vec3(u_xlat16_29) * _LightColor0.xyz;
    u_xlat0.xyz = vs_TEXCOORD1.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_8.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_8.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_8.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_8.xyz = u_xlat16_8.xyz + vs_TEXCOORD3.xyz;
    u_xlat16_8.xyz = max(u_xlat16_8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_8.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_29 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_29 = max(u_xlat16_29, 0.0);
    u_xlat16_7.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz * vec3(u_xlat16_29) + u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump float u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat16;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat16_3 = u_xlat1.y * u_xlat1.y;
    u_xlat16_3 = u_xlat1.x * u_xlat1.x + (-u_xlat16_3);
    u_xlat16_1 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_1);
    vs_TEXCOORD3.xyz = unity_SHC.xyz * vec3(u_xlat16_3) + u_xlat16_4.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
bool u_xlatb9;
float u_xlat19;
bool u_xlatb19;
vec2 u_xlat22;
int u_xlati27;
bool u_xlatb28;
mediump float u_xlat16_29;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati27 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb19 = u_xlati27>=_BlurIterations;
        if(u_xlatb19){break;}
        u_xlati27 = u_xlati27 + 1;
        u_xlat19 = float(u_xlati27);
        u_xlat19 = u_xlat19 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb28 = 2.5<u_xlat4.x;
            if(u_xlatb28){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb28 = 2.5<u_xlat4.y;
                if(u_xlatb28){break;}
                u_xlat22.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat22.xy = u_xlat22.xy * vec2(u_xlat19) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat22.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat9.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat9.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat9.x = (-u_xlat0.x) + u_xlat9.x;
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat9.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat9.x = texture2D(_ShadowMapTexture, vs_TEXCOORD5.xy).x;
    u_xlatb9 = vs_TEXCOORD5.z<u_xlat9.x;
    u_xlat9.x = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat9.x = max(u_xlat9.x, _LightShadowData.x);
    u_xlat16_29 = (-u_xlat9.x) + 1.0;
    u_xlat16_29 = u_xlat0.x * u_xlat16_29 + u_xlat9.x;
    u_xlat16_7.xyz = vec3(u_xlat16_29) * _LightColor0.xyz;
    u_xlat0.xyz = vs_TEXCOORD1.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_8.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_8.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_8.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_8.xyz = u_xlat16_8.xyz + vs_TEXCOORD3.xyz;
    u_xlat16_8.xyz = max(u_xlat16_8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_8.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_29 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_29 = max(u_xlat16_29, 0.0);
    u_xlat16_7.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz * vec3(u_xlat16_29) + u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
vec2 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
float u_xlat15;
bool u_xlatb15;
vec2 u_xlat18;
int u_xlati21;
bool u_xlatb22;
mediump float u_xlat16_23;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati21 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb15 = u_xlati21>=_BlurIterations;
        if(u_xlatb15){break;}
        u_xlati21 = u_xlati21 + 1;
        u_xlat15 = float(u_xlati21);
        u_xlat15 = u_xlat15 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb22 = 2.5<u_xlat4.x;
            if(u_xlatb22){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb22 = 2.5<u_xlat4.y;
                if(u_xlatb22){break;}
                u_xlat18.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat18.xy = u_xlat18.xy * vec2(u_xlat15) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat18.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat16_23 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_23 = max(u_xlat16_23, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * _LightColor0.xyz;
    SV_Target0.xyz = vec3(u_xlat16_23) * u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
vec2 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
float u_xlat15;
bool u_xlatb15;
vec2 u_xlat18;
int u_xlati21;
bool u_xlatb22;
mediump float u_xlat16_23;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati21 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb15 = u_xlati21>=_BlurIterations;
        if(u_xlatb15){break;}
        u_xlati21 = u_xlati21 + 1;
        u_xlat15 = float(u_xlati21);
        u_xlat15 = u_xlat15 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb22 = 2.5<u_xlat4.x;
            if(u_xlatb22){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb22 = 2.5<u_xlat4.y;
                if(u_xlatb22){break;}
                u_xlat18.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat18.xy = u_xlat18.xy * vec2(u_xlat15) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat18.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat16_23 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_23 = max(u_xlat16_23, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * _LightColor0.xyz;
    SV_Target0.xyz = vec3(u_xlat16_23) * u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
vec2 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
float u_xlat15;
bool u_xlatb15;
vec2 u_xlat18;
int u_xlati21;
bool u_xlatb22;
mediump float u_xlat16_23;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati21 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb15 = u_xlati21>=_BlurIterations;
        if(u_xlatb15){break;}
        u_xlati21 = u_xlati21 + 1;
        u_xlat15 = float(u_xlati21);
        u_xlat15 = u_xlat15 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb22 = 2.5<u_xlat4.x;
            if(u_xlatb22){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb22 = 2.5<u_xlat4.y;
                if(u_xlatb22){break;}
                u_xlat18.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat18.xy = u_xlat18.xy * vec2(u_xlat15) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat18.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat16_23 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_23 = max(u_xlat16_23, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * _LightColor0.xyz;
    SV_Target0.xyz = vec3(u_xlat16_23) * u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat21;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat1.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat3 = u_xlat2 * u_xlat2 + u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat4;
    u_xlat2 = u_xlat0 * u_xlat1.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_5.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_5.x);
    u_xlat16_1 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz * u_xlat2.xyz + u_xlat16_5.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 _LightColor0;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec2 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
float u_xlat17;
bool u_xlatb17;
vec2 u_xlat20;
int u_xlati24;
bool u_xlatb25;
mediump float u_xlat16_26;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati24 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb17 = u_xlati24>=_BlurIterations;
        if(u_xlatb17){break;}
        u_xlati24 = u_xlati24 + 1;
        u_xlat17 = float(u_xlati24);
        u_xlat17 = u_xlat17 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb25 = 2.5<u_xlat4.x;
            if(u_xlatb25){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb25 = 2.5<u_xlat4.y;
                if(u_xlatb25){break;}
                u_xlat20.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat20.xy = u_xlat20.xy * vec2(u_xlat17) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat20.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat0.xyz = vs_TEXCOORD1.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_7.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_7.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_7.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_7.xyz = u_xlat16_7.xyz + vs_TEXCOORD3.xyz;
    u_xlat16_7.xyz = max(u_xlat16_7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_7.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_26 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_26 = max(u_xlat16_26, 0.0);
    u_xlat16_7.xyz = u_xlat16_2.xyz * _LightColor0.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz * vec3(u_xlat16_26) + u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat21;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat1.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat3 = u_xlat2 * u_xlat2 + u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat4;
    u_xlat2 = u_xlat0 * u_xlat1.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_5.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_5.x);
    u_xlat16_1 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz * u_xlat2.xyz + u_xlat16_5.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 _LightColor0;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec2 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
float u_xlat17;
bool u_xlatb17;
vec2 u_xlat20;
int u_xlati24;
bool u_xlatb25;
mediump float u_xlat16_26;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati24 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb17 = u_xlati24>=_BlurIterations;
        if(u_xlatb17){break;}
        u_xlati24 = u_xlati24 + 1;
        u_xlat17 = float(u_xlati24);
        u_xlat17 = u_xlat17 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb25 = 2.5<u_xlat4.x;
            if(u_xlatb25){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb25 = 2.5<u_xlat4.y;
                if(u_xlatb25){break;}
                u_xlat20.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat20.xy = u_xlat20.xy * vec2(u_xlat17) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat20.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat0.xyz = vs_TEXCOORD1.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_7.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_7.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_7.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_7.xyz = u_xlat16_7.xyz + vs_TEXCOORD3.xyz;
    u_xlat16_7.xyz = max(u_xlat16_7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_7.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_26 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_26 = max(u_xlat16_26, 0.0);
    u_xlat16_7.xyz = u_xlat16_2.xyz * _LightColor0.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz * vec3(u_xlat16_26) + u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat21;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat1.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat3 = u_xlat2 * u_xlat2 + u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat4;
    u_xlat2 = u_xlat0 * u_xlat1.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_5.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_5.x);
    u_xlat16_1 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz * u_xlat2.xyz + u_xlat16_5.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 _LightColor0;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec2 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
float u_xlat17;
bool u_xlatb17;
vec2 u_xlat20;
int u_xlati24;
bool u_xlatb25;
mediump float u_xlat16_26;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati24 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb17 = u_xlati24>=_BlurIterations;
        if(u_xlatb17){break;}
        u_xlati24 = u_xlati24 + 1;
        u_xlat17 = float(u_xlati24);
        u_xlat17 = u_xlat17 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb25 = 2.5<u_xlat4.x;
            if(u_xlatb25){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb25 = 2.5<u_xlat4.y;
                if(u_xlatb25){break;}
                u_xlat20.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat20.xy = u_xlat20.xy * vec2(u_xlat17) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat20.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat0.xyz = vs_TEXCOORD1.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_7.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_7.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_7.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_7.xyz = u_xlat16_7.xyz + vs_TEXCOORD3.xyz;
    u_xlat16_7.xyz = max(u_xlat16_7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_7.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_26 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_26 = max(u_xlat16_26, 0.0);
    u_xlat16_7.xyz = u_xlat16_2.xyz * _LightColor0.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz * vec3(u_xlat16_26) + u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
float u_xlat17;
bool u_xlatb17;
vec2 u_xlat20;
int u_xlati24;
bool u_xlatb25;
mediump float u_xlat16_26;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati24 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb17 = u_xlati24>=_BlurIterations;
        if(u_xlatb17){break;}
        u_xlati24 = u_xlati24 + 1;
        u_xlat17 = float(u_xlati24);
        u_xlat17 = u_xlat17 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb25 = 2.5<u_xlat4.x;
            if(u_xlatb25){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb25 = 2.5<u_xlat4.y;
                if(u_xlatb25){break;}
                u_xlat20.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat20.xy = u_xlat20.xy * vec2(u_xlat17) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat20.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat8.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat8.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat8.x = (-u_xlat0.x) + u_xlat8.x;
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat8.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = texture2D(_ShadowMapTexture, vs_TEXCOORD5.xy).x;
    u_xlatb8 = vs_TEXCOORD5.z<u_xlat8.x;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat8.x = max(u_xlat8.x, _LightShadowData.x);
    u_xlat16_26 = (-u_xlat8.x) + 1.0;
    u_xlat16_26 = u_xlat0.x * u_xlat16_26 + u_xlat8.x;
    u_xlat16_7.xyz = vec3(u_xlat16_26) * _LightColor0.xyz;
    u_xlat16_26 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_26 = max(u_xlat16_26, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    SV_Target0.xyz = vec3(u_xlat16_26) * u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
float u_xlat17;
bool u_xlatb17;
vec2 u_xlat20;
int u_xlati24;
bool u_xlatb25;
mediump float u_xlat16_26;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati24 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb17 = u_xlati24>=_BlurIterations;
        if(u_xlatb17){break;}
        u_xlati24 = u_xlati24 + 1;
        u_xlat17 = float(u_xlati24);
        u_xlat17 = u_xlat17 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb25 = 2.5<u_xlat4.x;
            if(u_xlatb25){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb25 = 2.5<u_xlat4.y;
                if(u_xlatb25){break;}
                u_xlat20.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat20.xy = u_xlat20.xy * vec2(u_xlat17) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat20.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat8.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat8.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat8.x = (-u_xlat0.x) + u_xlat8.x;
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat8.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = texture2D(_ShadowMapTexture, vs_TEXCOORD5.xy).x;
    u_xlatb8 = vs_TEXCOORD5.z<u_xlat8.x;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat8.x = max(u_xlat8.x, _LightShadowData.x);
    u_xlat16_26 = (-u_xlat8.x) + 1.0;
    u_xlat16_26 = u_xlat0.x * u_xlat16_26 + u_xlat8.x;
    u_xlat16_7.xyz = vec3(u_xlat16_26) * _LightColor0.xyz;
    u_xlat16_26 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_26 = max(u_xlat16_26, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    SV_Target0.xyz = vec3(u_xlat16_26) * u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
float u_xlat17;
bool u_xlatb17;
vec2 u_xlat20;
int u_xlati24;
bool u_xlatb25;
mediump float u_xlat16_26;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati24 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb17 = u_xlati24>=_BlurIterations;
        if(u_xlatb17){break;}
        u_xlati24 = u_xlati24 + 1;
        u_xlat17 = float(u_xlati24);
        u_xlat17 = u_xlat17 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb25 = 2.5<u_xlat4.x;
            if(u_xlatb25){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb25 = 2.5<u_xlat4.y;
                if(u_xlatb25){break;}
                u_xlat20.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat20.xy = u_xlat20.xy * vec2(u_xlat17) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat20.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat8.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat8.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat8.x = (-u_xlat0.x) + u_xlat8.x;
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat8.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = texture2D(_ShadowMapTexture, vs_TEXCOORD5.xy).x;
    u_xlatb8 = vs_TEXCOORD5.z<u_xlat8.x;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat8.x = max(u_xlat8.x, _LightShadowData.x);
    u_xlat16_26 = (-u_xlat8.x) + 1.0;
    u_xlat16_26 = u_xlat0.x * u_xlat16_26 + u_xlat8.x;
    u_xlat16_7.xyz = vec3(u_xlat16_26) * _LightColor0.xyz;
    u_xlat16_26 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_26 = max(u_xlat16_26, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    SV_Target0.xyz = vec3(u_xlat16_26) * u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat25;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat25 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat1.xyz = vec3(u_xlat25) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    u_xlat3 = (-u_xlat2.xxxx) + unity_4LightPosX0;
    u_xlat4 = (-u_xlat2.yyyy) + unity_4LightPosY0;
    u_xlat2 = (-u_xlat2.zzzz) + unity_4LightPosZ0;
    u_xlat5 = u_xlat1.yyyy * u_xlat4;
    u_xlat4 = u_xlat4 * u_xlat4;
    u_xlat4 = u_xlat3 * u_xlat3 + u_xlat4;
    u_xlat3 = u_xlat3 * u_xlat1.xxxx + u_xlat5;
    u_xlat3 = u_xlat2 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat2 + u_xlat4;
    u_xlat2 = max(u_xlat2, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat4 = inversesqrt(u_xlat2);
    u_xlat2 = u_xlat2 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat2 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat2;
    u_xlat3 = u_xlat3 * u_xlat4;
    u_xlat3 = max(u_xlat3, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat3.xyz = u_xlat2.yyy * unity_LightColor[1].xyz;
    u_xlat3.xyz = unity_LightColor[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyz = unity_LightColor[2].xyz * u_xlat2.zzz + u_xlat3.xyz;
    u_xlat2.xyz = unity_LightColor[3].xyz * u_xlat2.www + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_6.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_6.x);
    u_xlat16_1 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_7.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_7.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_7.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_6.xyz = unity_SHC.xyz * u_xlat16_6.xxx + u_xlat16_7.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz * u_xlat3.xyz + u_xlat16_6.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
bool u_xlatb9;
float u_xlat19;
bool u_xlatb19;
vec2 u_xlat22;
int u_xlati27;
bool u_xlatb28;
mediump float u_xlat16_29;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati27 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb19 = u_xlati27>=_BlurIterations;
        if(u_xlatb19){break;}
        u_xlati27 = u_xlati27 + 1;
        u_xlat19 = float(u_xlati27);
        u_xlat19 = u_xlat19 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb28 = 2.5<u_xlat4.x;
            if(u_xlatb28){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb28 = 2.5<u_xlat4.y;
                if(u_xlatb28){break;}
                u_xlat22.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat22.xy = u_xlat22.xy * vec2(u_xlat19) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat22.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat9.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat9.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat9.x = (-u_xlat0.x) + u_xlat9.x;
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat9.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat9.x = texture2D(_ShadowMapTexture, vs_TEXCOORD5.xy).x;
    u_xlatb9 = vs_TEXCOORD5.z<u_xlat9.x;
    u_xlat9.x = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat9.x = max(u_xlat9.x, _LightShadowData.x);
    u_xlat16_29 = (-u_xlat9.x) + 1.0;
    u_xlat16_29 = u_xlat0.x * u_xlat16_29 + u_xlat9.x;
    u_xlat16_7.xyz = vec3(u_xlat16_29) * _LightColor0.xyz;
    u_xlat0.xyz = vs_TEXCOORD1.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_8.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_8.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_8.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_8.xyz = u_xlat16_8.xyz + vs_TEXCOORD3.xyz;
    u_xlat16_8.xyz = max(u_xlat16_8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_8.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_29 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_29 = max(u_xlat16_29, 0.0);
    u_xlat16_7.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz * vec3(u_xlat16_29) + u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat25;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat25 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat1.xyz = vec3(u_xlat25) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    u_xlat3 = (-u_xlat2.xxxx) + unity_4LightPosX0;
    u_xlat4 = (-u_xlat2.yyyy) + unity_4LightPosY0;
    u_xlat2 = (-u_xlat2.zzzz) + unity_4LightPosZ0;
    u_xlat5 = u_xlat1.yyyy * u_xlat4;
    u_xlat4 = u_xlat4 * u_xlat4;
    u_xlat4 = u_xlat3 * u_xlat3 + u_xlat4;
    u_xlat3 = u_xlat3 * u_xlat1.xxxx + u_xlat5;
    u_xlat3 = u_xlat2 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat2 + u_xlat4;
    u_xlat2 = max(u_xlat2, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat4 = inversesqrt(u_xlat2);
    u_xlat2 = u_xlat2 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat2 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat2;
    u_xlat3 = u_xlat3 * u_xlat4;
    u_xlat3 = max(u_xlat3, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat3.xyz = u_xlat2.yyy * unity_LightColor[1].xyz;
    u_xlat3.xyz = unity_LightColor[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyz = unity_LightColor[2].xyz * u_xlat2.zzz + u_xlat3.xyz;
    u_xlat2.xyz = unity_LightColor[3].xyz * u_xlat2.www + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_6.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_6.x);
    u_xlat16_1 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_7.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_7.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_7.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_6.xyz = unity_SHC.xyz * u_xlat16_6.xxx + u_xlat16_7.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz * u_xlat3.xyz + u_xlat16_6.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
bool u_xlatb9;
float u_xlat19;
bool u_xlatb19;
vec2 u_xlat22;
int u_xlati27;
bool u_xlatb28;
mediump float u_xlat16_29;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati27 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb19 = u_xlati27>=_BlurIterations;
        if(u_xlatb19){break;}
        u_xlati27 = u_xlati27 + 1;
        u_xlat19 = float(u_xlati27);
        u_xlat19 = u_xlat19 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb28 = 2.5<u_xlat4.x;
            if(u_xlatb28){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb28 = 2.5<u_xlat4.y;
                if(u_xlatb28){break;}
                u_xlat22.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat22.xy = u_xlat22.xy * vec2(u_xlat19) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat22.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat9.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat9.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat9.x = (-u_xlat0.x) + u_xlat9.x;
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat9.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat9.x = texture2D(_ShadowMapTexture, vs_TEXCOORD5.xy).x;
    u_xlatb9 = vs_TEXCOORD5.z<u_xlat9.x;
    u_xlat9.x = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat9.x = max(u_xlat9.x, _LightShadowData.x);
    u_xlat16_29 = (-u_xlat9.x) + 1.0;
    u_xlat16_29 = u_xlat0.x * u_xlat16_29 + u_xlat9.x;
    u_xlat16_7.xyz = vec3(u_xlat16_29) * _LightColor0.xyz;
    u_xlat0.xyz = vs_TEXCOORD1.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_8.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_8.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_8.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_8.xyz = u_xlat16_8.xyz + vs_TEXCOORD3.xyz;
    u_xlat16_8.xyz = max(u_xlat16_8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_8.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_29 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_29 = max(u_xlat16_29, 0.0);
    u_xlat16_7.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz * vec3(u_xlat16_29) + u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat25;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat25 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat1.xyz = vec3(u_xlat25) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    u_xlat3 = (-u_xlat2.xxxx) + unity_4LightPosX0;
    u_xlat4 = (-u_xlat2.yyyy) + unity_4LightPosY0;
    u_xlat2 = (-u_xlat2.zzzz) + unity_4LightPosZ0;
    u_xlat5 = u_xlat1.yyyy * u_xlat4;
    u_xlat4 = u_xlat4 * u_xlat4;
    u_xlat4 = u_xlat3 * u_xlat3 + u_xlat4;
    u_xlat3 = u_xlat3 * u_xlat1.xxxx + u_xlat5;
    u_xlat3 = u_xlat2 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat2 + u_xlat4;
    u_xlat2 = max(u_xlat2, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat4 = inversesqrt(u_xlat2);
    u_xlat2 = u_xlat2 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat2 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat2;
    u_xlat3 = u_xlat3 * u_xlat4;
    u_xlat3 = max(u_xlat3, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat3.xyz = u_xlat2.yyy * unity_LightColor[1].xyz;
    u_xlat3.xyz = unity_LightColor[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyz = unity_LightColor[2].xyz * u_xlat2.zzz + u_xlat3.xyz;
    u_xlat2.xyz = unity_LightColor[3].xyz * u_xlat2.www + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_6.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_6.x);
    u_xlat16_1 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_7.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_7.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_7.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_6.xyz = unity_SHC.xyz * u_xlat16_6.xxx + u_xlat16_7.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz * u_xlat3.xyz + u_xlat16_6.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
bool u_xlatb9;
float u_xlat19;
bool u_xlatb19;
vec2 u_xlat22;
int u_xlati27;
bool u_xlatb28;
mediump float u_xlat16_29;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati27 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb19 = u_xlati27>=_BlurIterations;
        if(u_xlatb19){break;}
        u_xlati27 = u_xlati27 + 1;
        u_xlat19 = float(u_xlati27);
        u_xlat19 = u_xlat19 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb28 = 2.5<u_xlat4.x;
            if(u_xlatb28){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb28 = 2.5<u_xlat4.y;
                if(u_xlatb28){break;}
                u_xlat22.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat22.xy = u_xlat22.xy * vec2(u_xlat19) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat22.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat9.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat9.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat9.x = (-u_xlat0.x) + u_xlat9.x;
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat9.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat9.x = texture2D(_ShadowMapTexture, vs_TEXCOORD5.xy).x;
    u_xlatb9 = vs_TEXCOORD5.z<u_xlat9.x;
    u_xlat9.x = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat9.x = max(u_xlat9.x, _LightShadowData.x);
    u_xlat16_29 = (-u_xlat9.x) + 1.0;
    u_xlat16_29 = u_xlat0.x * u_xlat16_29 + u_xlat9.x;
    u_xlat16_7.xyz = vec3(u_xlat16_29) * _LightColor0.xyz;
    u_xlat0.xyz = vs_TEXCOORD1.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_8.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_8.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_8.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_8.xyz = u_xlat16_8.xyz + vs_TEXCOORD3.xyz;
    u_xlat16_8.xyz = max(u_xlat16_8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_8.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_29 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_29 = max(u_xlat16_29, 0.0);
    u_xlat16_7.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz * vec3(u_xlat16_29) + u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
}
 Pass {
  Name "FORWARD"
  LOD 100
  Tags { "LIGHTMODE" = "FORWARDADD" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend One One, One One
  ZWrite Off
  GpuProgramID 118981
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform highp sampler2D _LightTexture0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec2 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec2 u_xlat5;
vec3 u_xlat6;
lowp vec3 u_xlat10_7;
mediump vec3 u_xlat16_8;
vec2 u_xlat20;
bool u_xlatb20;
float u_xlat27;
int u_xlati27;
float u_xlat28;
bool u_xlatb28;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat2.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_3.xyz = u_xlat10_1.xyz;
    u_xlati27 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb28 = u_xlati27>=_BlurIterations;
        if(u_xlatb28){break;}
        u_xlati27 = u_xlati27 + 1;
        u_xlat28 = float(u_xlati27);
        u_xlat28 = u_xlat28 * _BlurAmount;
        u_xlat4.xyz = u_xlat10_1.xyz;
        u_xlat5.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb20 = 2.5<u_xlat5.x;
            if(u_xlatb20){break;}
            u_xlat6.xyz = u_xlat4.xyz;
            u_xlat5.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb20 = 2.5<u_xlat5.y;
                if(u_xlatb20){break;}
                u_xlat20.xy = u_xlat2.xy * u_xlat5.xy;
                u_xlat20.xy = u_xlat20.xy * vec2(u_xlat28) + vs_TEXCOORD0.xy;
                u_xlat10_7.xyz = texture2D(_MainTex, u_xlat20.xy).xyz;
                u_xlat6.xyz = u_xlat6.xyz + u_xlat10_7.xyz;
                u_xlat5.y = u_xlat5.y + 1.0;
            }
            u_xlat4.xyz = u_xlat6.xyz;
            u_xlat5.x = u_xlat5.x + 1.0;
        }
        u_xlat3.xyz = u_xlat4.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_3.xyz = u_xlat3.xyz;
    }
    u_xlat1.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = texture2D(_LightTexture0, vec2(u_xlat27)).x;
    u_xlat16_8.xyz = vec3(u_xlat27) * _LightColor0.xyz;
    u_xlat16_30 = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
    u_xlat16_30 = max(u_xlat16_30, 0.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_8.xyz;
    SV_Target0.xyz = vec3(u_xlat16_30) * u_xlat16_3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform highp sampler2D _LightTexture0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec2 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec2 u_xlat5;
vec3 u_xlat6;
lowp vec3 u_xlat10_7;
mediump vec3 u_xlat16_8;
vec2 u_xlat20;
bool u_xlatb20;
float u_xlat27;
int u_xlati27;
float u_xlat28;
bool u_xlatb28;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat2.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_3.xyz = u_xlat10_1.xyz;
    u_xlati27 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb28 = u_xlati27>=_BlurIterations;
        if(u_xlatb28){break;}
        u_xlati27 = u_xlati27 + 1;
        u_xlat28 = float(u_xlati27);
        u_xlat28 = u_xlat28 * _BlurAmount;
        u_xlat4.xyz = u_xlat10_1.xyz;
        u_xlat5.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb20 = 2.5<u_xlat5.x;
            if(u_xlatb20){break;}
            u_xlat6.xyz = u_xlat4.xyz;
            u_xlat5.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb20 = 2.5<u_xlat5.y;
                if(u_xlatb20){break;}
                u_xlat20.xy = u_xlat2.xy * u_xlat5.xy;
                u_xlat20.xy = u_xlat20.xy * vec2(u_xlat28) + vs_TEXCOORD0.xy;
                u_xlat10_7.xyz = texture2D(_MainTex, u_xlat20.xy).xyz;
                u_xlat6.xyz = u_xlat6.xyz + u_xlat10_7.xyz;
                u_xlat5.y = u_xlat5.y + 1.0;
            }
            u_xlat4.xyz = u_xlat6.xyz;
            u_xlat5.x = u_xlat5.x + 1.0;
        }
        u_xlat3.xyz = u_xlat4.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_3.xyz = u_xlat3.xyz;
    }
    u_xlat1.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = texture2D(_LightTexture0, vec2(u_xlat27)).x;
    u_xlat16_8.xyz = vec3(u_xlat27) * _LightColor0.xyz;
    u_xlat16_30 = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
    u_xlat16_30 = max(u_xlat16_30, 0.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_8.xyz;
    SV_Target0.xyz = vec3(u_xlat16_30) * u_xlat16_3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform highp sampler2D _LightTexture0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec2 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec2 u_xlat5;
vec3 u_xlat6;
lowp vec3 u_xlat10_7;
mediump vec3 u_xlat16_8;
vec2 u_xlat20;
bool u_xlatb20;
float u_xlat27;
int u_xlati27;
float u_xlat28;
bool u_xlatb28;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat2.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_3.xyz = u_xlat10_1.xyz;
    u_xlati27 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb28 = u_xlati27>=_BlurIterations;
        if(u_xlatb28){break;}
        u_xlati27 = u_xlati27 + 1;
        u_xlat28 = float(u_xlati27);
        u_xlat28 = u_xlat28 * _BlurAmount;
        u_xlat4.xyz = u_xlat10_1.xyz;
        u_xlat5.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb20 = 2.5<u_xlat5.x;
            if(u_xlatb20){break;}
            u_xlat6.xyz = u_xlat4.xyz;
            u_xlat5.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb20 = 2.5<u_xlat5.y;
                if(u_xlatb20){break;}
                u_xlat20.xy = u_xlat2.xy * u_xlat5.xy;
                u_xlat20.xy = u_xlat20.xy * vec2(u_xlat28) + vs_TEXCOORD0.xy;
                u_xlat10_7.xyz = texture2D(_MainTex, u_xlat20.xy).xyz;
                u_xlat6.xyz = u_xlat6.xyz + u_xlat10_7.xyz;
                u_xlat5.y = u_xlat5.y + 1.0;
            }
            u_xlat4.xyz = u_xlat6.xyz;
            u_xlat5.x = u_xlat5.x + 1.0;
        }
        u_xlat3.xyz = u_xlat4.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_3.xyz = u_xlat3.xyz;
    }
    u_xlat1.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = texture2D(_LightTexture0, vec2(u_xlat27)).x;
    u_xlat16_8.xyz = vec3(u_xlat27) * _LightColor0.xyz;
    u_xlat16_30 = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
    u_xlat16_30 = max(u_xlat16_30, 0.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_8.xyz;
    SV_Target0.xyz = vec3(u_xlat16_30) * u_xlat16_3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
vec2 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
float u_xlat15;
bool u_xlatb15;
vec2 u_xlat18;
int u_xlati21;
bool u_xlatb22;
mediump float u_xlat16_23;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati21 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb15 = u_xlati21>=_BlurIterations;
        if(u_xlatb15){break;}
        u_xlati21 = u_xlati21 + 1;
        u_xlat15 = float(u_xlati21);
        u_xlat15 = u_xlat15 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb22 = 2.5<u_xlat4.x;
            if(u_xlatb22){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb22 = 2.5<u_xlat4.y;
                if(u_xlatb22){break;}
                u_xlat18.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat18.xy = u_xlat18.xy * vec2(u_xlat15) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat18.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat16_23 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_23 = max(u_xlat16_23, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * _LightColor0.xyz;
    SV_Target0.xyz = vec3(u_xlat16_23) * u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
vec2 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
float u_xlat15;
bool u_xlatb15;
vec2 u_xlat18;
int u_xlati21;
bool u_xlatb22;
mediump float u_xlat16_23;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati21 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb15 = u_xlati21>=_BlurIterations;
        if(u_xlatb15){break;}
        u_xlati21 = u_xlati21 + 1;
        u_xlat15 = float(u_xlati21);
        u_xlat15 = u_xlat15 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb22 = 2.5<u_xlat4.x;
            if(u_xlatb22){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb22 = 2.5<u_xlat4.y;
                if(u_xlatb22){break;}
                u_xlat18.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat18.xy = u_xlat18.xy * vec2(u_xlat15) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat18.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat16_23 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_23 = max(u_xlat16_23, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * _LightColor0.xyz;
    SV_Target0.xyz = vec3(u_xlat16_23) * u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
vec2 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
float u_xlat15;
bool u_xlatb15;
vec2 u_xlat18;
int u_xlati21;
bool u_xlatb22;
mediump float u_xlat16_23;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati21 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb15 = u_xlati21>=_BlurIterations;
        if(u_xlatb15){break;}
        u_xlati21 = u_xlati21 + 1;
        u_xlat15 = float(u_xlati21);
        u_xlat15 = u_xlat15 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb22 = 2.5<u_xlat4.x;
            if(u_xlatb22){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb22 = 2.5<u_xlat4.y;
                if(u_xlatb22){break;}
                u_xlat18.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat18.xy = u_xlat18.xy * vec2(u_xlat15) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat18.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat16_23 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_23 = max(u_xlat16_23, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * _LightColor0.xyz;
    SV_Target0.xyz = vec3(u_xlat16_23) * u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3 = hlslcc_mtx4x4unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform highp sampler2D _LightTexture0;
uniform highp sampler2D _LightTextureB0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec2 u_xlat1;
lowp vec3 u_xlat10_1;
vec2 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec2 u_xlat5;
vec3 u_xlat6;
lowp vec3 u_xlat10_7;
mediump vec3 u_xlat16_8;
vec2 u_xlat20;
bool u_xlatb20;
float u_xlat27;
int u_xlati27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat2.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_3.xyz = u_xlat10_1.xyz;
    u_xlati27 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb28 = u_xlati27>=_BlurIterations;
        if(u_xlatb28){break;}
        u_xlati27 = u_xlati27 + 1;
        u_xlat28 = float(u_xlati27);
        u_xlat28 = u_xlat28 * _BlurAmount;
        u_xlat4.xyz = u_xlat10_1.xyz;
        u_xlat5.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb20 = 2.5<u_xlat5.x;
            if(u_xlatb20){break;}
            u_xlat6.xyz = u_xlat4.xyz;
            u_xlat5.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb20 = 2.5<u_xlat5.y;
                if(u_xlatb20){break;}
                u_xlat20.xy = u_xlat2.xy * u_xlat5.xy;
                u_xlat20.xy = u_xlat20.xy * vec2(u_xlat28) + vs_TEXCOORD0.xy;
                u_xlat10_7.xyz = texture2D(_MainTex, u_xlat20.xy).xyz;
                u_xlat6.xyz = u_xlat6.xyz + u_xlat10_7.xyz;
                u_xlat5.y = u_xlat5.y + 1.0;
            }
            u_xlat4.xyz = u_xlat6.xyz;
            u_xlat5.x = u_xlat5.x + 1.0;
        }
        u_xlat3.xyz = u_xlat4.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_3.xyz = u_xlat3.xyz;
    }
    u_xlatb27 = 0.0<vs_TEXCOORD3.z;
    u_xlat16_30 = (u_xlatb27) ? 1.0 : 0.0;
    u_xlat1.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat27 = texture2D(_LightTexture0, u_xlat1.xy).w;
    u_xlat16_30 = u_xlat27 * u_xlat16_30;
    u_xlat27 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat27 = texture2D(_LightTextureB0, vec2(u_xlat27)).x;
    u_xlat16_30 = u_xlat27 * u_xlat16_30;
    u_xlat16_8.xyz = vec3(u_xlat16_30) * _LightColor0.xyz;
    u_xlat16_30 = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
    u_xlat16_30 = max(u_xlat16_30, 0.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_8.xyz;
    SV_Target0.xyz = vec3(u_xlat16_30) * u_xlat16_3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3 = hlslcc_mtx4x4unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform highp sampler2D _LightTexture0;
uniform highp sampler2D _LightTextureB0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec2 u_xlat1;
lowp vec3 u_xlat10_1;
vec2 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec2 u_xlat5;
vec3 u_xlat6;
lowp vec3 u_xlat10_7;
mediump vec3 u_xlat16_8;
vec2 u_xlat20;
bool u_xlatb20;
float u_xlat27;
int u_xlati27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat2.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_3.xyz = u_xlat10_1.xyz;
    u_xlati27 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb28 = u_xlati27>=_BlurIterations;
        if(u_xlatb28){break;}
        u_xlati27 = u_xlati27 + 1;
        u_xlat28 = float(u_xlati27);
        u_xlat28 = u_xlat28 * _BlurAmount;
        u_xlat4.xyz = u_xlat10_1.xyz;
        u_xlat5.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb20 = 2.5<u_xlat5.x;
            if(u_xlatb20){break;}
            u_xlat6.xyz = u_xlat4.xyz;
            u_xlat5.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb20 = 2.5<u_xlat5.y;
                if(u_xlatb20){break;}
                u_xlat20.xy = u_xlat2.xy * u_xlat5.xy;
                u_xlat20.xy = u_xlat20.xy * vec2(u_xlat28) + vs_TEXCOORD0.xy;
                u_xlat10_7.xyz = texture2D(_MainTex, u_xlat20.xy).xyz;
                u_xlat6.xyz = u_xlat6.xyz + u_xlat10_7.xyz;
                u_xlat5.y = u_xlat5.y + 1.0;
            }
            u_xlat4.xyz = u_xlat6.xyz;
            u_xlat5.x = u_xlat5.x + 1.0;
        }
        u_xlat3.xyz = u_xlat4.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_3.xyz = u_xlat3.xyz;
    }
    u_xlatb27 = 0.0<vs_TEXCOORD3.z;
    u_xlat16_30 = (u_xlatb27) ? 1.0 : 0.0;
    u_xlat1.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat27 = texture2D(_LightTexture0, u_xlat1.xy).w;
    u_xlat16_30 = u_xlat27 * u_xlat16_30;
    u_xlat27 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat27 = texture2D(_LightTextureB0, vec2(u_xlat27)).x;
    u_xlat16_30 = u_xlat27 * u_xlat16_30;
    u_xlat16_8.xyz = vec3(u_xlat16_30) * _LightColor0.xyz;
    u_xlat16_30 = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
    u_xlat16_30 = max(u_xlat16_30, 0.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_8.xyz;
    SV_Target0.xyz = vec3(u_xlat16_30) * u_xlat16_3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3 = hlslcc_mtx4x4unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform highp sampler2D _LightTexture0;
uniform highp sampler2D _LightTextureB0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec2 u_xlat1;
lowp vec3 u_xlat10_1;
vec2 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec2 u_xlat5;
vec3 u_xlat6;
lowp vec3 u_xlat10_7;
mediump vec3 u_xlat16_8;
vec2 u_xlat20;
bool u_xlatb20;
float u_xlat27;
int u_xlati27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat2.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_3.xyz = u_xlat10_1.xyz;
    u_xlati27 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb28 = u_xlati27>=_BlurIterations;
        if(u_xlatb28){break;}
        u_xlati27 = u_xlati27 + 1;
        u_xlat28 = float(u_xlati27);
        u_xlat28 = u_xlat28 * _BlurAmount;
        u_xlat4.xyz = u_xlat10_1.xyz;
        u_xlat5.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb20 = 2.5<u_xlat5.x;
            if(u_xlatb20){break;}
            u_xlat6.xyz = u_xlat4.xyz;
            u_xlat5.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb20 = 2.5<u_xlat5.y;
                if(u_xlatb20){break;}
                u_xlat20.xy = u_xlat2.xy * u_xlat5.xy;
                u_xlat20.xy = u_xlat20.xy * vec2(u_xlat28) + vs_TEXCOORD0.xy;
                u_xlat10_7.xyz = texture2D(_MainTex, u_xlat20.xy).xyz;
                u_xlat6.xyz = u_xlat6.xyz + u_xlat10_7.xyz;
                u_xlat5.y = u_xlat5.y + 1.0;
            }
            u_xlat4.xyz = u_xlat6.xyz;
            u_xlat5.x = u_xlat5.x + 1.0;
        }
        u_xlat3.xyz = u_xlat4.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_3.xyz = u_xlat3.xyz;
    }
    u_xlatb27 = 0.0<vs_TEXCOORD3.z;
    u_xlat16_30 = (u_xlatb27) ? 1.0 : 0.0;
    u_xlat1.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat27 = texture2D(_LightTexture0, u_xlat1.xy).w;
    u_xlat16_30 = u_xlat27 * u_xlat16_30;
    u_xlat27 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat27 = texture2D(_LightTextureB0, vec2(u_xlat27)).x;
    u_xlat16_30 = u_xlat27 * u_xlat16_30;
    u_xlat16_8.xyz = vec3(u_xlat16_30) * _LightColor0.xyz;
    u_xlat16_30 = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
    u_xlat16_30 = max(u_xlat16_30, 0.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_8.xyz;
    SV_Target0.xyz = vec3(u_xlat16_30) * u_xlat16_3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT_COOKIE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform highp sampler2D _LightTextureB0;
uniform highp samplerCube _LightTexture0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
float u_xlat1;
lowp vec3 u_xlat10_1;
vec2 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec2 u_xlat5;
vec3 u_xlat6;
lowp vec3 u_xlat10_7;
mediump vec3 u_xlat16_8;
vec2 u_xlat20;
bool u_xlatb20;
float u_xlat27;
int u_xlati27;
float u_xlat28;
bool u_xlatb28;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat2.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_3.xyz = u_xlat10_1.xyz;
    u_xlati27 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb28 = u_xlati27>=_BlurIterations;
        if(u_xlatb28){break;}
        u_xlati27 = u_xlati27 + 1;
        u_xlat28 = float(u_xlati27);
        u_xlat28 = u_xlat28 * _BlurAmount;
        u_xlat4.xyz = u_xlat10_1.xyz;
        u_xlat5.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb20 = 2.5<u_xlat5.x;
            if(u_xlatb20){break;}
            u_xlat6.xyz = u_xlat4.xyz;
            u_xlat5.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb20 = 2.5<u_xlat5.y;
                if(u_xlatb20){break;}
                u_xlat20.xy = u_xlat2.xy * u_xlat5.xy;
                u_xlat20.xy = u_xlat20.xy * vec2(u_xlat28) + vs_TEXCOORD0.xy;
                u_xlat10_7.xyz = texture2D(_MainTex, u_xlat20.xy).xyz;
                u_xlat6.xyz = u_xlat6.xyz + u_xlat10_7.xyz;
                u_xlat5.y = u_xlat5.y + 1.0;
            }
            u_xlat4.xyz = u_xlat6.xyz;
            u_xlat5.x = u_xlat5.x + 1.0;
        }
        u_xlat3.xyz = u_xlat4.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_3.xyz = u_xlat3.xyz;
    }
    u_xlat27 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat27 = texture2D(_LightTextureB0, vec2(u_xlat27)).x;
    u_xlat1 = textureCube(_LightTexture0, vs_TEXCOORD3.xyz).w;
    u_xlat27 = u_xlat27 * u_xlat1;
    u_xlat16_8.xyz = vec3(u_xlat27) * _LightColor0.xyz;
    u_xlat16_30 = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
    u_xlat16_30 = max(u_xlat16_30, 0.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_8.xyz;
    SV_Target0.xyz = vec3(u_xlat16_30) * u_xlat16_3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT_COOKIE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform highp sampler2D _LightTextureB0;
uniform highp samplerCube _LightTexture0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
float u_xlat1;
lowp vec3 u_xlat10_1;
vec2 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec2 u_xlat5;
vec3 u_xlat6;
lowp vec3 u_xlat10_7;
mediump vec3 u_xlat16_8;
vec2 u_xlat20;
bool u_xlatb20;
float u_xlat27;
int u_xlati27;
float u_xlat28;
bool u_xlatb28;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat2.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_3.xyz = u_xlat10_1.xyz;
    u_xlati27 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb28 = u_xlati27>=_BlurIterations;
        if(u_xlatb28){break;}
        u_xlati27 = u_xlati27 + 1;
        u_xlat28 = float(u_xlati27);
        u_xlat28 = u_xlat28 * _BlurAmount;
        u_xlat4.xyz = u_xlat10_1.xyz;
        u_xlat5.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb20 = 2.5<u_xlat5.x;
            if(u_xlatb20){break;}
            u_xlat6.xyz = u_xlat4.xyz;
            u_xlat5.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb20 = 2.5<u_xlat5.y;
                if(u_xlatb20){break;}
                u_xlat20.xy = u_xlat2.xy * u_xlat5.xy;
                u_xlat20.xy = u_xlat20.xy * vec2(u_xlat28) + vs_TEXCOORD0.xy;
                u_xlat10_7.xyz = texture2D(_MainTex, u_xlat20.xy).xyz;
                u_xlat6.xyz = u_xlat6.xyz + u_xlat10_7.xyz;
                u_xlat5.y = u_xlat5.y + 1.0;
            }
            u_xlat4.xyz = u_xlat6.xyz;
            u_xlat5.x = u_xlat5.x + 1.0;
        }
        u_xlat3.xyz = u_xlat4.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_3.xyz = u_xlat3.xyz;
    }
    u_xlat27 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat27 = texture2D(_LightTextureB0, vec2(u_xlat27)).x;
    u_xlat1 = textureCube(_LightTexture0, vs_TEXCOORD3.xyz).w;
    u_xlat27 = u_xlat27 * u_xlat1;
    u_xlat16_8.xyz = vec3(u_xlat27) * _LightColor0.xyz;
    u_xlat16_30 = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
    u_xlat16_30 = max(u_xlat16_30, 0.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_8.xyz;
    SV_Target0.xyz = vec3(u_xlat16_30) * u_xlat16_3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT_COOKIE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform highp sampler2D _LightTextureB0;
uniform highp samplerCube _LightTexture0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
float u_xlat1;
lowp vec3 u_xlat10_1;
vec2 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec2 u_xlat5;
vec3 u_xlat6;
lowp vec3 u_xlat10_7;
mediump vec3 u_xlat16_8;
vec2 u_xlat20;
bool u_xlatb20;
float u_xlat27;
int u_xlati27;
float u_xlat28;
bool u_xlatb28;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat2.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_3.xyz = u_xlat10_1.xyz;
    u_xlati27 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb28 = u_xlati27>=_BlurIterations;
        if(u_xlatb28){break;}
        u_xlati27 = u_xlati27 + 1;
        u_xlat28 = float(u_xlati27);
        u_xlat28 = u_xlat28 * _BlurAmount;
        u_xlat4.xyz = u_xlat10_1.xyz;
        u_xlat5.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb20 = 2.5<u_xlat5.x;
            if(u_xlatb20){break;}
            u_xlat6.xyz = u_xlat4.xyz;
            u_xlat5.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb20 = 2.5<u_xlat5.y;
                if(u_xlatb20){break;}
                u_xlat20.xy = u_xlat2.xy * u_xlat5.xy;
                u_xlat20.xy = u_xlat20.xy * vec2(u_xlat28) + vs_TEXCOORD0.xy;
                u_xlat10_7.xyz = texture2D(_MainTex, u_xlat20.xy).xyz;
                u_xlat6.xyz = u_xlat6.xyz + u_xlat10_7.xyz;
                u_xlat5.y = u_xlat5.y + 1.0;
            }
            u_xlat4.xyz = u_xlat6.xyz;
            u_xlat5.x = u_xlat5.x + 1.0;
        }
        u_xlat3.xyz = u_xlat4.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_3.xyz = u_xlat3.xyz;
    }
    u_xlat27 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat27 = texture2D(_LightTextureB0, vec2(u_xlat27)).x;
    u_xlat1 = textureCube(_LightTexture0, vs_TEXCOORD3.xyz).w;
    u_xlat27 = u_xlat27 * u_xlat1;
    u_xlat16_8.xyz = vec3(u_xlat27) * _LightColor0.xyz;
    u_xlat16_30 = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
    u_xlat16_30 = max(u_xlat16_30, 0.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_8.xyz;
    SV_Target0.xyz = vec3(u_xlat16_30) * u_xlat16_3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL_COOKIE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xy = u_xlat1.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat1.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat1.zz + u_xlat0.xy;
    vs_TEXCOORD3.xy = hlslcc_mtx4x4unity_WorldToLight[3].xy * u_xlat1.ww + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD1.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform highp sampler2D _LightTexture0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
lowp vec3 u_xlat10_0;
vec2 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
float u_xlat17;
bool u_xlatb17;
vec2 u_xlat20;
int u_xlati24;
bool u_xlatb25;
mediump float u_xlat16_26;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati24 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb17 = u_xlati24>=_BlurIterations;
        if(u_xlatb17){break;}
        u_xlati24 = u_xlati24 + 1;
        u_xlat17 = float(u_xlati24);
        u_xlat17 = u_xlat17 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb25 = 2.5<u_xlat4.x;
            if(u_xlatb25){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb25 = 2.5<u_xlat4.y;
                if(u_xlatb25){break;}
                u_xlat20.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat20.xy = u_xlat20.xy * vec2(u_xlat17) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat20.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat0 = texture2D(_LightTexture0, vs_TEXCOORD3.xy).w;
    u_xlat16_7.xyz = vec3(u_xlat0) * _LightColor0.xyz;
    u_xlat16_26 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_26 = max(u_xlat16_26, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    SV_Target0.xyz = vec3(u_xlat16_26) * u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xy = u_xlat1.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat1.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat1.zz + u_xlat0.xy;
    vs_TEXCOORD3.xy = hlslcc_mtx4x4unity_WorldToLight[3].xy * u_xlat1.ww + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD1.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform highp sampler2D _LightTexture0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
lowp vec3 u_xlat10_0;
vec2 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
float u_xlat17;
bool u_xlatb17;
vec2 u_xlat20;
int u_xlati24;
bool u_xlatb25;
mediump float u_xlat16_26;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati24 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb17 = u_xlati24>=_BlurIterations;
        if(u_xlatb17){break;}
        u_xlati24 = u_xlati24 + 1;
        u_xlat17 = float(u_xlati24);
        u_xlat17 = u_xlat17 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb25 = 2.5<u_xlat4.x;
            if(u_xlatb25){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb25 = 2.5<u_xlat4.y;
                if(u_xlatb25){break;}
                u_xlat20.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat20.xy = u_xlat20.xy * vec2(u_xlat17) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat20.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat0 = texture2D(_LightTexture0, vs_TEXCOORD3.xy).w;
    u_xlat16_7.xyz = vec3(u_xlat0) * _LightColor0.xyz;
    u_xlat16_26 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_26 = max(u_xlat16_26, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    SV_Target0.xyz = vec3(u_xlat16_26) * u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xy = u_xlat1.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat1.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat1.zz + u_xlat0.xy;
    vs_TEXCOORD3.xy = hlslcc_mtx4x4unity_WorldToLight[3].xy * u_xlat1.ww + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD1.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform highp sampler2D _LightTexture0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
lowp vec3 u_xlat10_0;
vec2 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
float u_xlat17;
bool u_xlatb17;
vec2 u_xlat20;
int u_xlati24;
bool u_xlatb25;
mediump float u_xlat16_26;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati24 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb17 = u_xlati24>=_BlurIterations;
        if(u_xlatb17){break;}
        u_xlati24 = u_xlati24 + 1;
        u_xlat17 = float(u_xlati24);
        u_xlat17 = u_xlat17 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb25 = 2.5<u_xlat4.x;
            if(u_xlatb25){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb25 = 2.5<u_xlat4.y;
                if(u_xlatb25){break;}
                u_xlat20.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat20.xy = u_xlat20.xy * vec2(u_xlat17) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat20.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat0 = texture2D(_LightTexture0, vs_TEXCOORD3.xy).w;
    u_xlat16_7.xyz = vec3(u_xlat0) * _LightColor0.xyz;
    u_xlat16_26 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_26 = max(u_xlat16_26, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    SV_Target0.xyz = vec3(u_xlat16_26) * u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
}
 Pass {
  Name "PREPASS"
  LOD 100
  Tags { "LIGHTMODE" = "PREPASSBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  GpuProgramID 192173
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
varying highp vec3 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0.xyz = vs_TEXCOORD0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
varying highp vec3 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0.xyz = vs_TEXCOORD0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
varying highp vec3 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0.xyz = vs_TEXCOORD0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
}
}
 Pass {
  Name "PREPASS"
  LOD 100
  Tags { "LIGHTMODE" = "PREPASSFINAL" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  GpuProgramID 227262
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LightBuffer;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec2 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
float u_xlat17;
bool u_xlatb17;
vec2 u_xlat20;
int u_xlati24;
bool u_xlatb25;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati24 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb17 = u_xlati24>=_BlurIterations;
        if(u_xlatb17){break;}
        u_xlati24 = u_xlati24 + 1;
        u_xlat17 = float(u_xlati24);
        u_xlat17 = u_xlat17 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb25 = 2.5<u_xlat4.x;
            if(u_xlatb25){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb25 = 2.5<u_xlat4.y;
                if(u_xlatb25){break;}
                u_xlat20.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat20.xy = u_xlat20.xy * vec2(u_xlat17) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat20.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat10_0.xyz = texture2D(_LightBuffer, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = max(u_xlat10_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat16_7.xyz = log2(u_xlat16_7.xyz);
    u_xlat0.xyz = (-u_xlat16_7.xyz) + vs_TEXCOORD4.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LightBuffer;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec2 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
float u_xlat17;
bool u_xlatb17;
vec2 u_xlat20;
int u_xlati24;
bool u_xlatb25;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati24 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb17 = u_xlati24>=_BlurIterations;
        if(u_xlatb17){break;}
        u_xlati24 = u_xlati24 + 1;
        u_xlat17 = float(u_xlati24);
        u_xlat17 = u_xlat17 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb25 = 2.5<u_xlat4.x;
            if(u_xlatb25){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb25 = 2.5<u_xlat4.y;
                if(u_xlatb25){break;}
                u_xlat20.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat20.xy = u_xlat20.xy * vec2(u_xlat17) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat20.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat10_0.xyz = texture2D(_LightBuffer, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = max(u_xlat10_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat16_7.xyz = log2(u_xlat16_7.xyz);
    u_xlat0.xyz = (-u_xlat16_7.xyz) + vs_TEXCOORD4.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LightBuffer;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec2 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
float u_xlat17;
bool u_xlatb17;
vec2 u_xlat20;
int u_xlati24;
bool u_xlatb25;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati24 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb17 = u_xlati24>=_BlurIterations;
        if(u_xlatb17){break;}
        u_xlati24 = u_xlati24 + 1;
        u_xlat17 = float(u_xlati24);
        u_xlat17 = u_xlat17 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb25 = 2.5<u_xlat4.x;
            if(u_xlatb25){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb25 = 2.5<u_xlat4.y;
                if(u_xlatb25){break;}
                u_xlat20.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat20.xy = u_xlat20.xy * vec2(u_xlat17) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat20.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat10_0.xyz = texture2D(_LightBuffer, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = max(u_xlat10_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat16_7.xyz = log2(u_xlat16_7.xyz);
    u_xlat0.xyz = (-u_xlat16_7.xyz) + vs_TEXCOORD4.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LightBuffer;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec2 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
float u_xlat17;
bool u_xlatb17;
vec2 u_xlat20;
int u_xlati24;
bool u_xlatb25;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati24 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb17 = u_xlati24>=_BlurIterations;
        if(u_xlatb17){break;}
        u_xlati24 = u_xlati24 + 1;
        u_xlat17 = float(u_xlati24);
        u_xlat17 = u_xlat17 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb25 = 2.5<u_xlat4.x;
            if(u_xlatb25){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb25 = 2.5<u_xlat4.y;
                if(u_xlatb25){break;}
                u_xlat20.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat20.xy = u_xlat20.xy * vec2(u_xlat17) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat20.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat10_0.xyz = texture2D(_LightBuffer, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = max(u_xlat10_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat16_7.xyz = log2(u_xlat16_7.xyz);
    u_xlat0.xyz = (-u_xlat16_7.xyz) + vs_TEXCOORD4.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LightBuffer;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec2 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
float u_xlat17;
bool u_xlatb17;
vec2 u_xlat20;
int u_xlati24;
bool u_xlatb25;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati24 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb17 = u_xlati24>=_BlurIterations;
        if(u_xlatb17){break;}
        u_xlati24 = u_xlati24 + 1;
        u_xlat17 = float(u_xlati24);
        u_xlat17 = u_xlat17 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb25 = 2.5<u_xlat4.x;
            if(u_xlatb25){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb25 = 2.5<u_xlat4.y;
                if(u_xlatb25){break;}
                u_xlat20.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat20.xy = u_xlat20.xy * vec2(u_xlat17) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat20.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat10_0.xyz = texture2D(_LightBuffer, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = max(u_xlat10_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat16_7.xyz = log2(u_xlat16_7.xyz);
    u_xlat0.xyz = (-u_xlat16_7.xyz) + vs_TEXCOORD4.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LightBuffer;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec2 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
float u_xlat17;
bool u_xlatb17;
vec2 u_xlat20;
int u_xlati24;
bool u_xlatb25;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati24 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb17 = u_xlati24>=_BlurIterations;
        if(u_xlatb17){break;}
        u_xlati24 = u_xlati24 + 1;
        u_xlat17 = float(u_xlati24);
        u_xlat17 = u_xlat17 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb25 = 2.5<u_xlat4.x;
            if(u_xlatb25){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb25 = 2.5<u_xlat4.y;
                if(u_xlatb25){break;}
                u_xlat20.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat20.xy = u_xlat20.xy * vec2(u_xlat17) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat20.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat10_0.xyz = texture2D(_LightBuffer, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = max(u_xlat10_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat16_7.xyz = log2(u_xlat16_7.xyz);
    u_xlat0.xyz = (-u_xlat16_7.xyz) + vs_TEXCOORD4.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LightBuffer;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec2 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
float u_xlat17;
bool u_xlatb17;
vec2 u_xlat20;
int u_xlati24;
bool u_xlatb25;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati24 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb17 = u_xlati24>=_BlurIterations;
        if(u_xlatb17){break;}
        u_xlati24 = u_xlati24 + 1;
        u_xlat17 = float(u_xlati24);
        u_xlat17 = u_xlat17 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb25 = 2.5<u_xlat4.x;
            if(u_xlatb25){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb25 = 2.5<u_xlat4.y;
                if(u_xlatb25){break;}
                u_xlat20.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat20.xy = u_xlat20.xy * vec2(u_xlat17) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat20.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat10_0.xyz = texture2D(_LightBuffer, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = max(u_xlat10_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat0.xyz = u_xlat16_7.xyz + vs_TEXCOORD4.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LightBuffer;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec2 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
float u_xlat17;
bool u_xlatb17;
vec2 u_xlat20;
int u_xlati24;
bool u_xlatb25;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati24 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb17 = u_xlati24>=_BlurIterations;
        if(u_xlatb17){break;}
        u_xlati24 = u_xlati24 + 1;
        u_xlat17 = float(u_xlati24);
        u_xlat17 = u_xlat17 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb25 = 2.5<u_xlat4.x;
            if(u_xlatb25){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb25 = 2.5<u_xlat4.y;
                if(u_xlatb25){break;}
                u_xlat20.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat20.xy = u_xlat20.xy * vec2(u_xlat17) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat20.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat10_0.xyz = texture2D(_LightBuffer, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = max(u_xlat10_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat0.xyz = u_xlat16_7.xyz + vs_TEXCOORD4.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LightBuffer;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec2 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
float u_xlat17;
bool u_xlatb17;
vec2 u_xlat20;
int u_xlati24;
bool u_xlatb25;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati24 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb17 = u_xlati24>=_BlurIterations;
        if(u_xlatb17){break;}
        u_xlati24 = u_xlati24 + 1;
        u_xlat17 = float(u_xlati24);
        u_xlat17 = u_xlat17 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb25 = 2.5<u_xlat4.x;
            if(u_xlatb25){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb25 = 2.5<u_xlat4.y;
                if(u_xlatb25){break;}
                u_xlat20.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat20.xy = u_xlat20.xy * vec2(u_xlat17) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat20.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat10_0.xyz = texture2D(_LightBuffer, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = max(u_xlat10_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat0.xyz = u_xlat16_7.xyz + vs_TEXCOORD4.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LightBuffer;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec2 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
float u_xlat17;
bool u_xlatb17;
vec2 u_xlat20;
int u_xlati24;
bool u_xlatb25;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati24 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb17 = u_xlati24>=_BlurIterations;
        if(u_xlatb17){break;}
        u_xlati24 = u_xlati24 + 1;
        u_xlat17 = float(u_xlati24);
        u_xlat17 = u_xlat17 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb25 = 2.5<u_xlat4.x;
            if(u_xlatb25){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb25 = 2.5<u_xlat4.y;
                if(u_xlatb25){break;}
                u_xlat20.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat20.xy = u_xlat20.xy * vec2(u_xlat17) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat20.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat10_0.xyz = texture2D(_LightBuffer, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = max(u_xlat10_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat0.xyz = u_xlat16_7.xyz + vs_TEXCOORD4.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LightBuffer;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec2 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
float u_xlat17;
bool u_xlatb17;
vec2 u_xlat20;
int u_xlati24;
bool u_xlatb25;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati24 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb17 = u_xlati24>=_BlurIterations;
        if(u_xlatb17){break;}
        u_xlati24 = u_xlati24 + 1;
        u_xlat17 = float(u_xlati24);
        u_xlat17 = u_xlat17 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb25 = 2.5<u_xlat4.x;
            if(u_xlatb25){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb25 = 2.5<u_xlat4.y;
                if(u_xlatb25){break;}
                u_xlat20.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat20.xy = u_xlat20.xy * vec2(u_xlat17) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat20.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat10_0.xyz = texture2D(_LightBuffer, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = max(u_xlat10_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat0.xyz = u_xlat16_7.xyz + vs_TEXCOORD4.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _BlurAmount;
uniform 	int _BlurIterations;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LightBuffer;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec2 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
float u_xlat17;
bool u_xlatb17;
vec2 u_xlat20;
int u_xlati24;
bool u_xlatb25;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vec2(1.0, 1.0) / _MainTex_TexelSize.zw;
    u_xlat16_2.xyz = u_xlat10_0.xyz;
    u_xlati24 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb17 = u_xlati24>=_BlurIterations;
        if(u_xlatb17){break;}
        u_xlati24 = u_xlati24 + 1;
        u_xlat17 = float(u_xlati24);
        u_xlat17 = u_xlat17 * _BlurAmount;
        u_xlat3.xyz = u_xlat10_0.xyz;
        u_xlat4.x = -2.5;
        for(int u_xlati_while_true_1 = 0 ; u_xlati_while_true_1 < 0x7FFF ; u_xlati_while_true_1++){
            u_xlatb25 = 2.5<u_xlat4.x;
            if(u_xlatb25){break;}
            u_xlat5.xyz = u_xlat3.xyz;
            u_xlat4.y = -2.5;
            for(int u_xlati_while_true_2 = 0 ; u_xlati_while_true_2 < 0x7FFF ; u_xlati_while_true_2++){
                u_xlatb25 = 2.5<u_xlat4.y;
                if(u_xlatb25){break;}
                u_xlat20.xy = u_xlat1.xy * u_xlat4.xy;
                u_xlat20.xy = u_xlat20.xy * vec2(u_xlat17) + vs_TEXCOORD0.xy;
                u_xlat10_6.xyz = texture2D(_MainTex, u_xlat20.xy).xyz;
                u_xlat5.xyz = u_xlat5.xyz + u_xlat10_6.xyz;
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat3.xyz = u_xlat5.xyz;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat2.xyz = u_xlat3.xyz * vec3(0.027777778, 0.027777778, 0.027777778);
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat10_0.xyz = texture2D(_LightBuffer, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = max(u_xlat10_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat0.xyz = u_xlat16_7.xyz + vs_TEXCOORD4.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
}
}
Fallback "Diffuse"
}