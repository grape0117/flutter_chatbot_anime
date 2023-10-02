//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "UI/Sprite Blur" {
Properties {
_MainTex ("Main Texture", 2D) = "white" { }
_Size ("Size", Range(0, 10)) = 5
_StencilComp ("Stencil Comparison", Float) = 8
_Stencil ("Stencil ID", Float) = 0
_StencilOp ("Stencil Operation", Float) = 0
_StencilWriteMask ("Stencil Write Mask", Float) = 255
_StencilReadMask ("Stencil Read Mask", Float) = 255
_ColorMask ("Color Mask", Float) = 15
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Opaque" }
 GrabPass {
  "_SpriteBlurTextureV"
}
 Pass {
  Name "VERTICAL"
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "ALWAYS" "QUEUE" = "Transparent" "RenderType" = "Opaque" }
  Cull Off
  Stencil {
   ReadMask 0
   WriteMask 0
   Comp Disabled
   Pass Keep
   Fail Keep
   ZFail Keep
  }
  GpuProgramID 1718
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute mediump vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat16_2.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat16_2.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _SpriteBlurTextureV_TexelSize;
uniform 	mediump float _Size;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SpriteBlurTextureV;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
lowp vec4 u_xlat10_4;
lowp vec4 u_xlat10_5;
mediump float u_xlat16_7;
mediump vec2 u_xlat16_13;
void main()
{
    u_xlat16_0.xz = vs_TEXCOORD0.xx;
    u_xlat16_1.x = _SpriteBlurTextureV_TexelSize.y * _Size;
    u_xlat16_7 = u_xlat16_1.x * vs_COLOR0.w;
    u_xlat16_2 = vec4(u_xlat16_7) * vec4(-4.0, 3.0, -3.0, -2.0) + vs_TEXCOORD0.yyyy;
    u_xlat16_0.yw = u_xlat16_2.xz;
    u_xlat16_0 = u_xlat16_0 / vs_TEXCOORD0.wwww;
    u_xlat10_3 = texture2D(_SpriteBlurTextureV, u_xlat16_0.zw);
    u_xlat10_0 = texture2D(_SpriteBlurTextureV, u_xlat16_0.xy);
    u_xlat3 = u_xlat10_3 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036);
    u_xlat0 = u_xlat10_0 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat3;
    u_xlat16_3.xz = vs_TEXCOORD0.xx;
    u_xlat16_3.y = u_xlat16_2.w;
    u_xlat16_13.xy = u_xlat16_3.xy / vs_TEXCOORD0.ww;
    u_xlat10_4 = texture2D(_SpriteBlurTextureV, u_xlat16_13.xy);
    u_xlat0 = u_xlat10_4 * vec4(0.119999997, 0.119999997, 0.119999997, 0.119999997) + u_xlat0;
    u_xlat16_3.w = (-u_xlat16_1.x) * vs_COLOR0.w + vs_TEXCOORD0.y;
    u_xlat16_4.y = u_xlat16_1.x * vs_COLOR0.w + vs_TEXCOORD0.y;
    u_xlat16_1.xz = u_xlat16_3.zw / vs_TEXCOORD0.ww;
    u_xlat10_3 = texture2D(_SpriteBlurTextureV, u_xlat16_1.xz);
    u_xlat0 = u_xlat10_3 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat0;
    u_xlat16_1.xz = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat10_3 = texture2D(_SpriteBlurTextureV, u_xlat16_1.xz);
    u_xlat0 = u_xlat10_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat0;
    u_xlat16_4.xz = vs_TEXCOORD0.xx;
    u_xlat16_1.xz = u_xlat16_4.xy / vs_TEXCOORD0.ww;
    u_xlat10_5 = texture2D(_SpriteBlurTextureV, u_xlat16_1.xz);
    u_xlat0 = u_xlat10_5 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat0;
    u_xlat16_4.w = u_xlat16_7 * 2.0 + vs_TEXCOORD0.y;
    u_xlat16_2.w = u_xlat16_7 * 4.0 + vs_TEXCOORD0.y;
    u_xlat16_1.xy = u_xlat16_4.zw / vs_TEXCOORD0.ww;
    u_xlat10_1 = texture2D(_SpriteBlurTextureV, u_xlat16_1.xy);
    u_xlat0 = u_xlat10_1 * vec4(0.119999997, 0.119999997, 0.119999997, 0.119999997) + u_xlat0;
    u_xlat16_2.xz = vs_TEXCOORD0.xx;
    u_xlat16_2 = u_xlat16_2 / vs_TEXCOORD0.wwww;
    u_xlat10_1 = texture2D(_SpriteBlurTextureV, u_xlat16_2.zw);
    u_xlat10_2 = texture2D(_SpriteBlurTextureV, u_xlat16_2.xy);
    u_xlat0 = u_xlat10_2 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036) + u_xlat0;
    u_xlat0 = u_xlat10_1 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat0;
    u_xlat16_1.xyz = u_xlat0.xyz * vs_COLOR0.xxx + (-u_xlat10_3.xyz);
    u_xlat16_1.w = (-u_xlat10_3.w) + u_xlat0.w;
    u_xlat10_5.x = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
    SV_Target0 = u_xlat10_5.xxxx * u_xlat16_1 + u_xlat10_3;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute mediump vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat16_2.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat16_2.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _SpriteBlurTextureV_TexelSize;
uniform 	mediump float _Size;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SpriteBlurTextureV;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
lowp vec4 u_xlat10_4;
lowp vec4 u_xlat10_5;
mediump float u_xlat16_7;
mediump vec2 u_xlat16_13;
void main()
{
    u_xlat16_0.xz = vs_TEXCOORD0.xx;
    u_xlat16_1.x = _SpriteBlurTextureV_TexelSize.y * _Size;
    u_xlat16_7 = u_xlat16_1.x * vs_COLOR0.w;
    u_xlat16_2 = vec4(u_xlat16_7) * vec4(-4.0, 3.0, -3.0, -2.0) + vs_TEXCOORD0.yyyy;
    u_xlat16_0.yw = u_xlat16_2.xz;
    u_xlat16_0 = u_xlat16_0 / vs_TEXCOORD0.wwww;
    u_xlat10_3 = texture2D(_SpriteBlurTextureV, u_xlat16_0.zw);
    u_xlat10_0 = texture2D(_SpriteBlurTextureV, u_xlat16_0.xy);
    u_xlat3 = u_xlat10_3 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036);
    u_xlat0 = u_xlat10_0 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat3;
    u_xlat16_3.xz = vs_TEXCOORD0.xx;
    u_xlat16_3.y = u_xlat16_2.w;
    u_xlat16_13.xy = u_xlat16_3.xy / vs_TEXCOORD0.ww;
    u_xlat10_4 = texture2D(_SpriteBlurTextureV, u_xlat16_13.xy);
    u_xlat0 = u_xlat10_4 * vec4(0.119999997, 0.119999997, 0.119999997, 0.119999997) + u_xlat0;
    u_xlat16_3.w = (-u_xlat16_1.x) * vs_COLOR0.w + vs_TEXCOORD0.y;
    u_xlat16_4.y = u_xlat16_1.x * vs_COLOR0.w + vs_TEXCOORD0.y;
    u_xlat16_1.xz = u_xlat16_3.zw / vs_TEXCOORD0.ww;
    u_xlat10_3 = texture2D(_SpriteBlurTextureV, u_xlat16_1.xz);
    u_xlat0 = u_xlat10_3 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat0;
    u_xlat16_1.xz = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat10_3 = texture2D(_SpriteBlurTextureV, u_xlat16_1.xz);
    u_xlat0 = u_xlat10_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat0;
    u_xlat16_4.xz = vs_TEXCOORD0.xx;
    u_xlat16_1.xz = u_xlat16_4.xy / vs_TEXCOORD0.ww;
    u_xlat10_5 = texture2D(_SpriteBlurTextureV, u_xlat16_1.xz);
    u_xlat0 = u_xlat10_5 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat0;
    u_xlat16_4.w = u_xlat16_7 * 2.0 + vs_TEXCOORD0.y;
    u_xlat16_2.w = u_xlat16_7 * 4.0 + vs_TEXCOORD0.y;
    u_xlat16_1.xy = u_xlat16_4.zw / vs_TEXCOORD0.ww;
    u_xlat10_1 = texture2D(_SpriteBlurTextureV, u_xlat16_1.xy);
    u_xlat0 = u_xlat10_1 * vec4(0.119999997, 0.119999997, 0.119999997, 0.119999997) + u_xlat0;
    u_xlat16_2.xz = vs_TEXCOORD0.xx;
    u_xlat16_2 = u_xlat16_2 / vs_TEXCOORD0.wwww;
    u_xlat10_1 = texture2D(_SpriteBlurTextureV, u_xlat16_2.zw);
    u_xlat10_2 = texture2D(_SpriteBlurTextureV, u_xlat16_2.xy);
    u_xlat0 = u_xlat10_2 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036) + u_xlat0;
    u_xlat0 = u_xlat10_1 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat0;
    u_xlat16_1.xyz = u_xlat0.xyz * vs_COLOR0.xxx + (-u_xlat10_3.xyz);
    u_xlat16_1.w = (-u_xlat10_3.w) + u_xlat0.w;
    u_xlat10_5.x = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
    SV_Target0 = u_xlat10_5.xxxx * u_xlat16_1 + u_xlat10_3;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute mediump vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat16_2.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat16_2.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _SpriteBlurTextureV_TexelSize;
uniform 	mediump float _Size;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SpriteBlurTextureV;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
lowp vec4 u_xlat10_4;
lowp vec4 u_xlat10_5;
mediump float u_xlat16_7;
mediump vec2 u_xlat16_13;
void main()
{
    u_xlat16_0.xz = vs_TEXCOORD0.xx;
    u_xlat16_1.x = _SpriteBlurTextureV_TexelSize.y * _Size;
    u_xlat16_7 = u_xlat16_1.x * vs_COLOR0.w;
    u_xlat16_2 = vec4(u_xlat16_7) * vec4(-4.0, 3.0, -3.0, -2.0) + vs_TEXCOORD0.yyyy;
    u_xlat16_0.yw = u_xlat16_2.xz;
    u_xlat16_0 = u_xlat16_0 / vs_TEXCOORD0.wwww;
    u_xlat10_3 = texture2D(_SpriteBlurTextureV, u_xlat16_0.zw);
    u_xlat10_0 = texture2D(_SpriteBlurTextureV, u_xlat16_0.xy);
    u_xlat3 = u_xlat10_3 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036);
    u_xlat0 = u_xlat10_0 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat3;
    u_xlat16_3.xz = vs_TEXCOORD0.xx;
    u_xlat16_3.y = u_xlat16_2.w;
    u_xlat16_13.xy = u_xlat16_3.xy / vs_TEXCOORD0.ww;
    u_xlat10_4 = texture2D(_SpriteBlurTextureV, u_xlat16_13.xy);
    u_xlat0 = u_xlat10_4 * vec4(0.119999997, 0.119999997, 0.119999997, 0.119999997) + u_xlat0;
    u_xlat16_3.w = (-u_xlat16_1.x) * vs_COLOR0.w + vs_TEXCOORD0.y;
    u_xlat16_4.y = u_xlat16_1.x * vs_COLOR0.w + vs_TEXCOORD0.y;
    u_xlat16_1.xz = u_xlat16_3.zw / vs_TEXCOORD0.ww;
    u_xlat10_3 = texture2D(_SpriteBlurTextureV, u_xlat16_1.xz);
    u_xlat0 = u_xlat10_3 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat0;
    u_xlat16_1.xz = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat10_3 = texture2D(_SpriteBlurTextureV, u_xlat16_1.xz);
    u_xlat0 = u_xlat10_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat0;
    u_xlat16_4.xz = vs_TEXCOORD0.xx;
    u_xlat16_1.xz = u_xlat16_4.xy / vs_TEXCOORD0.ww;
    u_xlat10_5 = texture2D(_SpriteBlurTextureV, u_xlat16_1.xz);
    u_xlat0 = u_xlat10_5 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat0;
    u_xlat16_4.w = u_xlat16_7 * 2.0 + vs_TEXCOORD0.y;
    u_xlat16_2.w = u_xlat16_7 * 4.0 + vs_TEXCOORD0.y;
    u_xlat16_1.xy = u_xlat16_4.zw / vs_TEXCOORD0.ww;
    u_xlat10_1 = texture2D(_SpriteBlurTextureV, u_xlat16_1.xy);
    u_xlat0 = u_xlat10_1 * vec4(0.119999997, 0.119999997, 0.119999997, 0.119999997) + u_xlat0;
    u_xlat16_2.xz = vs_TEXCOORD0.xx;
    u_xlat16_2 = u_xlat16_2 / vs_TEXCOORD0.wwww;
    u_xlat10_1 = texture2D(_SpriteBlurTextureV, u_xlat16_2.zw);
    u_xlat10_2 = texture2D(_SpriteBlurTextureV, u_xlat16_2.xy);
    u_xlat0 = u_xlat10_2 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036) + u_xlat0;
    u_xlat0 = u_xlat10_1 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat0;
    u_xlat16_1.xyz = u_xlat0.xyz * vs_COLOR0.xxx + (-u_xlat10_3.xyz);
    u_xlat16_1.w = (-u_xlat10_3.w) + u_xlat0.w;
    u_xlat10_5.x = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
    SV_Target0 = u_xlat10_5.xxxx * u_xlat16_1 + u_xlat10_3;
    return;
}

#endif
"
}
}
}
 GrabPass {
  "_SpriteBlurTextureH"
}
 Pass {
  Name "HORIZONTAL"
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "ALWAYS" "QUEUE" = "Transparent" "RenderType" = "Opaque" }
  Cull Off
  Stencil {
   ReadMask 0
   WriteMask 0
   Comp Disabled
   Pass Keep
   Fail Keep
   ZFail Keep
  }
  GpuProgramID 115228
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute mediump vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat16_2.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat16_2.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _SpriteBlurTextureH_TexelSize;
uniform 	mediump float _Size;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SpriteBlurTextureH;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
lowp vec4 u_xlat10_4;
lowp vec4 u_xlat10_5;
mediump float u_xlat16_7;
mediump vec2 u_xlat16_13;
void main()
{
    u_xlat16_0.yw = vs_TEXCOORD0.yy;
    u_xlat16_1.x = _SpriteBlurTextureH_TexelSize.x * _Size;
    u_xlat16_7 = u_xlat16_1.x * vs_COLOR0.w;
    u_xlat16_2 = vec4(u_xlat16_7) * vec4(3.0, -4.0, -3.0, -2.0) + vs_TEXCOORD0.xxxx;
    u_xlat16_0.xz = u_xlat16_2.yz;
    u_xlat16_0 = u_xlat16_0 / vs_TEXCOORD0.wwww;
    u_xlat10_3 = texture2D(_SpriteBlurTextureH, u_xlat16_0.zw);
    u_xlat10_0 = texture2D(_SpriteBlurTextureH, u_xlat16_0.xy);
    u_xlat3 = u_xlat10_3 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036);
    u_xlat0 = u_xlat10_0 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat3;
    u_xlat16_3.x = u_xlat16_2.w;
    u_xlat16_3.yw = vs_TEXCOORD0.yy;
    u_xlat16_13.xy = u_xlat16_3.xy / vs_TEXCOORD0.ww;
    u_xlat10_4 = texture2D(_SpriteBlurTextureH, u_xlat16_13.xy);
    u_xlat0 = u_xlat10_4 * vec4(0.119999997, 0.119999997, 0.119999997, 0.119999997) + u_xlat0;
    u_xlat16_3.z = (-u_xlat16_1.x) * vs_COLOR0.w + vs_TEXCOORD0.x;
    u_xlat16_4.x = u_xlat16_1.x * vs_COLOR0.w + vs_TEXCOORD0.x;
    u_xlat16_1.xz = u_xlat16_3.zw / vs_TEXCOORD0.ww;
    u_xlat10_3 = texture2D(_SpriteBlurTextureH, u_xlat16_1.xz);
    u_xlat0 = u_xlat10_3 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat0;
    u_xlat16_1.xz = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat10_3 = texture2D(_SpriteBlurTextureH, u_xlat16_1.xz);
    u_xlat0 = u_xlat10_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat0;
    u_xlat16_4.yw = vs_TEXCOORD0.yy;
    u_xlat16_1.xz = u_xlat16_4.xy / vs_TEXCOORD0.ww;
    u_xlat10_5 = texture2D(_SpriteBlurTextureH, u_xlat16_1.xz);
    u_xlat0 = u_xlat10_5 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat0;
    u_xlat16_4.z = u_xlat16_7 * 2.0 + vs_TEXCOORD0.x;
    u_xlat16_2.z = u_xlat16_7 * 4.0 + vs_TEXCOORD0.x;
    u_xlat16_1.xy = u_xlat16_4.zw / vs_TEXCOORD0.ww;
    u_xlat10_1 = texture2D(_SpriteBlurTextureH, u_xlat16_1.xy);
    u_xlat0 = u_xlat10_1 * vec4(0.119999997, 0.119999997, 0.119999997, 0.119999997) + u_xlat0;
    u_xlat16_2.yw = vs_TEXCOORD0.yy;
    u_xlat16_2 = u_xlat16_2 / vs_TEXCOORD0.wwww;
    u_xlat10_1 = texture2D(_SpriteBlurTextureH, u_xlat16_2.zw);
    u_xlat10_2 = texture2D(_SpriteBlurTextureH, u_xlat16_2.xy);
    u_xlat0 = u_xlat10_2 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036) + u_xlat0;
    u_xlat0 = u_xlat10_1 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat0;
    u_xlat16_1.xyz = u_xlat0.xyz * vs_COLOR0.xxx + (-u_xlat10_3.xyz);
    u_xlat16_1.w = (-u_xlat10_3.w) + u_xlat0.w;
    u_xlat10_5.x = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
    SV_Target0 = u_xlat10_5.xxxx * u_xlat16_1 + u_xlat10_3;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute mediump vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat16_2.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat16_2.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _SpriteBlurTextureH_TexelSize;
uniform 	mediump float _Size;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SpriteBlurTextureH;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
lowp vec4 u_xlat10_4;
lowp vec4 u_xlat10_5;
mediump float u_xlat16_7;
mediump vec2 u_xlat16_13;
void main()
{
    u_xlat16_0.yw = vs_TEXCOORD0.yy;
    u_xlat16_1.x = _SpriteBlurTextureH_TexelSize.x * _Size;
    u_xlat16_7 = u_xlat16_1.x * vs_COLOR0.w;
    u_xlat16_2 = vec4(u_xlat16_7) * vec4(3.0, -4.0, -3.0, -2.0) + vs_TEXCOORD0.xxxx;
    u_xlat16_0.xz = u_xlat16_2.yz;
    u_xlat16_0 = u_xlat16_0 / vs_TEXCOORD0.wwww;
    u_xlat10_3 = texture2D(_SpriteBlurTextureH, u_xlat16_0.zw);
    u_xlat10_0 = texture2D(_SpriteBlurTextureH, u_xlat16_0.xy);
    u_xlat3 = u_xlat10_3 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036);
    u_xlat0 = u_xlat10_0 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat3;
    u_xlat16_3.x = u_xlat16_2.w;
    u_xlat16_3.yw = vs_TEXCOORD0.yy;
    u_xlat16_13.xy = u_xlat16_3.xy / vs_TEXCOORD0.ww;
    u_xlat10_4 = texture2D(_SpriteBlurTextureH, u_xlat16_13.xy);
    u_xlat0 = u_xlat10_4 * vec4(0.119999997, 0.119999997, 0.119999997, 0.119999997) + u_xlat0;
    u_xlat16_3.z = (-u_xlat16_1.x) * vs_COLOR0.w + vs_TEXCOORD0.x;
    u_xlat16_4.x = u_xlat16_1.x * vs_COLOR0.w + vs_TEXCOORD0.x;
    u_xlat16_1.xz = u_xlat16_3.zw / vs_TEXCOORD0.ww;
    u_xlat10_3 = texture2D(_SpriteBlurTextureH, u_xlat16_1.xz);
    u_xlat0 = u_xlat10_3 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat0;
    u_xlat16_1.xz = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat10_3 = texture2D(_SpriteBlurTextureH, u_xlat16_1.xz);
    u_xlat0 = u_xlat10_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat0;
    u_xlat16_4.yw = vs_TEXCOORD0.yy;
    u_xlat16_1.xz = u_xlat16_4.xy / vs_TEXCOORD0.ww;
    u_xlat10_5 = texture2D(_SpriteBlurTextureH, u_xlat16_1.xz);
    u_xlat0 = u_xlat10_5 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat0;
    u_xlat16_4.z = u_xlat16_7 * 2.0 + vs_TEXCOORD0.x;
    u_xlat16_2.z = u_xlat16_7 * 4.0 + vs_TEXCOORD0.x;
    u_xlat16_1.xy = u_xlat16_4.zw / vs_TEXCOORD0.ww;
    u_xlat10_1 = texture2D(_SpriteBlurTextureH, u_xlat16_1.xy);
    u_xlat0 = u_xlat10_1 * vec4(0.119999997, 0.119999997, 0.119999997, 0.119999997) + u_xlat0;
    u_xlat16_2.yw = vs_TEXCOORD0.yy;
    u_xlat16_2 = u_xlat16_2 / vs_TEXCOORD0.wwww;
    u_xlat10_1 = texture2D(_SpriteBlurTextureH, u_xlat16_2.zw);
    u_xlat10_2 = texture2D(_SpriteBlurTextureH, u_xlat16_2.xy);
    u_xlat0 = u_xlat10_2 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036) + u_xlat0;
    u_xlat0 = u_xlat10_1 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat0;
    u_xlat16_1.xyz = u_xlat0.xyz * vs_COLOR0.xxx + (-u_xlat10_3.xyz);
    u_xlat16_1.w = (-u_xlat10_3.w) + u_xlat0.w;
    u_xlat10_5.x = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
    SV_Target0 = u_xlat10_5.xxxx * u_xlat16_1 + u_xlat10_3;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute mediump vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat16_2.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat16_2.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _SpriteBlurTextureH_TexelSize;
uniform 	mediump float _Size;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SpriteBlurTextureH;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
lowp vec4 u_xlat10_4;
lowp vec4 u_xlat10_5;
mediump float u_xlat16_7;
mediump vec2 u_xlat16_13;
void main()
{
    u_xlat16_0.yw = vs_TEXCOORD0.yy;
    u_xlat16_1.x = _SpriteBlurTextureH_TexelSize.x * _Size;
    u_xlat16_7 = u_xlat16_1.x * vs_COLOR0.w;
    u_xlat16_2 = vec4(u_xlat16_7) * vec4(3.0, -4.0, -3.0, -2.0) + vs_TEXCOORD0.xxxx;
    u_xlat16_0.xz = u_xlat16_2.yz;
    u_xlat16_0 = u_xlat16_0 / vs_TEXCOORD0.wwww;
    u_xlat10_3 = texture2D(_SpriteBlurTextureH, u_xlat16_0.zw);
    u_xlat10_0 = texture2D(_SpriteBlurTextureH, u_xlat16_0.xy);
    u_xlat3 = u_xlat10_3 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036);
    u_xlat0 = u_xlat10_0 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat3;
    u_xlat16_3.x = u_xlat16_2.w;
    u_xlat16_3.yw = vs_TEXCOORD0.yy;
    u_xlat16_13.xy = u_xlat16_3.xy / vs_TEXCOORD0.ww;
    u_xlat10_4 = texture2D(_SpriteBlurTextureH, u_xlat16_13.xy);
    u_xlat0 = u_xlat10_4 * vec4(0.119999997, 0.119999997, 0.119999997, 0.119999997) + u_xlat0;
    u_xlat16_3.z = (-u_xlat16_1.x) * vs_COLOR0.w + vs_TEXCOORD0.x;
    u_xlat16_4.x = u_xlat16_1.x * vs_COLOR0.w + vs_TEXCOORD0.x;
    u_xlat16_1.xz = u_xlat16_3.zw / vs_TEXCOORD0.ww;
    u_xlat10_3 = texture2D(_SpriteBlurTextureH, u_xlat16_1.xz);
    u_xlat0 = u_xlat10_3 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat0;
    u_xlat16_1.xz = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat10_3 = texture2D(_SpriteBlurTextureH, u_xlat16_1.xz);
    u_xlat0 = u_xlat10_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat0;
    u_xlat16_4.yw = vs_TEXCOORD0.yy;
    u_xlat16_1.xz = u_xlat16_4.xy / vs_TEXCOORD0.ww;
    u_xlat10_5 = texture2D(_SpriteBlurTextureH, u_xlat16_1.xz);
    u_xlat0 = u_xlat10_5 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat0;
    u_xlat16_4.z = u_xlat16_7 * 2.0 + vs_TEXCOORD0.x;
    u_xlat16_2.z = u_xlat16_7 * 4.0 + vs_TEXCOORD0.x;
    u_xlat16_1.xy = u_xlat16_4.zw / vs_TEXCOORD0.ww;
    u_xlat10_1 = texture2D(_SpriteBlurTextureH, u_xlat16_1.xy);
    u_xlat0 = u_xlat10_1 * vec4(0.119999997, 0.119999997, 0.119999997, 0.119999997) + u_xlat0;
    u_xlat16_2.yw = vs_TEXCOORD0.yy;
    u_xlat16_2 = u_xlat16_2 / vs_TEXCOORD0.wwww;
    u_xlat10_1 = texture2D(_SpriteBlurTextureH, u_xlat16_2.zw);
    u_xlat10_2 = texture2D(_SpriteBlurTextureH, u_xlat16_2.xy);
    u_xlat0 = u_xlat10_2 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036) + u_xlat0;
    u_xlat0 = u_xlat10_1 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat0;
    u_xlat16_1.xyz = u_xlat0.xyz * vs_COLOR0.xxx + (-u_xlat10_3.xyz);
    u_xlat16_1.w = (-u_xlat10_3.w) + u_xlat0.w;
    u_xlat10_5.x = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
    SV_Target0 = u_xlat10_5.xxxx * u_xlat16_1 + u_xlat10_3;
    return;
}

#endif
"
}
}
}
}
}