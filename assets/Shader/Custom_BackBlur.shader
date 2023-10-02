//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Custom/BackBlur" {
Properties {
_MainTex ("Sprite Texture", 2D) = "white" { }
_Color ("Main Color", Color) = (1,1,1,1)
_Size ("Size", Range(0, 20)) = 1
}
SubShader {
 Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 GrabPass {
}
 Pass {
  Name "BackBlurHor"
  Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "ALWAYS" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  GpuProgramID 44521
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
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
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
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
uniform 	vec4 _GrabTexture_TexelSize;
uniform 	float _Size;
uniform 	vec4 _Color;
uniform lowp sampler2D _GrabTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
lowp vec4 u_xlat10_4;
lowp vec4 u_xlat10_5;
vec3 u_xlat7;
bvec2 u_xlatb7;
vec2 u_xlat13;
float u_xlat19;
void main()
{
    u_xlat0.yw = vs_TEXCOORD0.yy;
    u_xlat1.x = _GrabTexture_TexelSize.x * _Size;
    u_xlat2 = u_xlat1.xxxx * vec4(-4.0, -3.0, -2.0, 3.0);
    u_xlatb7.xy = equal(vs_TEXCOORD0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb7.x = u_xlatb7.y && u_xlatb7.x;
    u_xlat2 = (u_xlatb7.x) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat2;
    u_xlat2 = u_xlat2.wxyz + vs_TEXCOORD0.xxxx;
    u_xlat0.xz = u_xlat2.yz;
    u_xlat0 = u_xlat0 / vs_TEXCOORD0.wwww;
    u_xlat10_3 = texture2D(_GrabTexture, u_xlat0.zw);
    u_xlat10_0 = texture2D(_GrabTexture, u_xlat0.xy);
    u_xlat3 = u_xlat10_3 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036);
    u_xlat16_0 = u_xlat10_0 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat3;
    u_xlat3.x = u_xlat2.w;
    u_xlat3.yw = vs_TEXCOORD0.yy;
    u_xlat13.xy = u_xlat3.xy / vs_TEXCOORD0.ww;
    u_xlat10_4 = texture2D(_GrabTexture, u_xlat13.xy);
    u_xlat16_0 = u_xlat10_4 * vec4(0.119999997, 0.119999997, 0.119999997, 0.119999997) + u_xlat16_0;
    u_xlat13.x = (u_xlatb7.x) ? 0.0 : (-u_xlat1.x);
    u_xlat3.z = u_xlat13.x + vs_TEXCOORD0.x;
    u_xlat13.xy = u_xlat3.zw / vs_TEXCOORD0.ww;
    u_xlat10_3 = texture2D(_GrabTexture, u_xlat13.xy);
    u_xlat16_0 = u_xlat10_3 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat16_0;
    u_xlat13.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat10_3 = texture2D(_GrabTexture, u_xlat13.xy);
    u_xlat16_0 = u_xlat10_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat16_0;
    u_xlat13.x = (u_xlatb7.x) ? 0.0 : 1.0;
    u_xlat19 = u_xlat13.x * _GrabTexture_TexelSize.x;
    u_xlat4.x = u_xlat19 * _Size + vs_TEXCOORD0.x;
    u_xlat4.yw = vs_TEXCOORD0.yy;
    u_xlat4.xy = u_xlat4.xy / vs_TEXCOORD0.ww;
    u_xlat10_5 = texture2D(_GrabTexture, u_xlat4.xy);
    u_xlat16_0 = u_xlat10_5 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat16_0;
    u_xlat19 = u_xlat1.x + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 4.0;
    u_xlat1.x = (u_xlatb7.x) ? 0.0 : u_xlat1.x;
    u_xlat7.x = (u_xlatb7.x) ? 0.0 : u_xlat19;
    u_xlat4.z = u_xlat7.x + vs_TEXCOORD0.x;
    u_xlat7.xz = u_xlat4.zw / vs_TEXCOORD0.ww;
    u_xlat10_4 = texture2D(_GrabTexture, u_xlat7.xz);
    u_xlat16_0 = u_xlat10_4 * vec4(0.119999997, 0.119999997, 0.119999997, 0.119999997) + u_xlat16_0;
    u_xlat2.z = u_xlat1.x + vs_TEXCOORD0.x;
    u_xlat2.yw = vs_TEXCOORD0.yy;
    u_xlat1.xy = u_xlat2.xy / vs_TEXCOORD0.ww;
    u_xlat2.xy = u_xlat2.zw / vs_TEXCOORD0.ww;
    u_xlat10_2 = texture2D(_GrabTexture, u_xlat2.xy);
    u_xlat10_4 = texture2D(_GrabTexture, u_xlat1.xy);
    u_xlat16_0 = u_xlat10_4 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036) + u_xlat16_0;
    u_xlat16_0 = u_xlat10_2 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat16_0;
    u_xlat0 = (-u_xlat10_3) + u_xlat16_0;
    u_xlat0 = u_xlat13.xxxx * u_xlat0 + u_xlat10_3;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * _Color;
    SV_Target0 = u_xlat0;
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
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
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
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
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
uniform 	vec4 _GrabTexture_TexelSize;
uniform 	float _Size;
uniform 	vec4 _Color;
uniform lowp sampler2D _GrabTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
lowp vec4 u_xlat10_4;
lowp vec4 u_xlat10_5;
vec3 u_xlat7;
bvec2 u_xlatb7;
vec2 u_xlat13;
float u_xlat19;
void main()
{
    u_xlat0.yw = vs_TEXCOORD0.yy;
    u_xlat1.x = _GrabTexture_TexelSize.x * _Size;
    u_xlat2 = u_xlat1.xxxx * vec4(-4.0, -3.0, -2.0, 3.0);
    u_xlatb7.xy = equal(vs_TEXCOORD0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb7.x = u_xlatb7.y && u_xlatb7.x;
    u_xlat2 = (u_xlatb7.x) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat2;
    u_xlat2 = u_xlat2.wxyz + vs_TEXCOORD0.xxxx;
    u_xlat0.xz = u_xlat2.yz;
    u_xlat0 = u_xlat0 / vs_TEXCOORD0.wwww;
    u_xlat10_3 = texture2D(_GrabTexture, u_xlat0.zw);
    u_xlat10_0 = texture2D(_GrabTexture, u_xlat0.xy);
    u_xlat3 = u_xlat10_3 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036);
    u_xlat16_0 = u_xlat10_0 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat3;
    u_xlat3.x = u_xlat2.w;
    u_xlat3.yw = vs_TEXCOORD0.yy;
    u_xlat13.xy = u_xlat3.xy / vs_TEXCOORD0.ww;
    u_xlat10_4 = texture2D(_GrabTexture, u_xlat13.xy);
    u_xlat16_0 = u_xlat10_4 * vec4(0.119999997, 0.119999997, 0.119999997, 0.119999997) + u_xlat16_0;
    u_xlat13.x = (u_xlatb7.x) ? 0.0 : (-u_xlat1.x);
    u_xlat3.z = u_xlat13.x + vs_TEXCOORD0.x;
    u_xlat13.xy = u_xlat3.zw / vs_TEXCOORD0.ww;
    u_xlat10_3 = texture2D(_GrabTexture, u_xlat13.xy);
    u_xlat16_0 = u_xlat10_3 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat16_0;
    u_xlat13.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat10_3 = texture2D(_GrabTexture, u_xlat13.xy);
    u_xlat16_0 = u_xlat10_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat16_0;
    u_xlat13.x = (u_xlatb7.x) ? 0.0 : 1.0;
    u_xlat19 = u_xlat13.x * _GrabTexture_TexelSize.x;
    u_xlat4.x = u_xlat19 * _Size + vs_TEXCOORD0.x;
    u_xlat4.yw = vs_TEXCOORD0.yy;
    u_xlat4.xy = u_xlat4.xy / vs_TEXCOORD0.ww;
    u_xlat10_5 = texture2D(_GrabTexture, u_xlat4.xy);
    u_xlat16_0 = u_xlat10_5 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat16_0;
    u_xlat19 = u_xlat1.x + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 4.0;
    u_xlat1.x = (u_xlatb7.x) ? 0.0 : u_xlat1.x;
    u_xlat7.x = (u_xlatb7.x) ? 0.0 : u_xlat19;
    u_xlat4.z = u_xlat7.x + vs_TEXCOORD0.x;
    u_xlat7.xz = u_xlat4.zw / vs_TEXCOORD0.ww;
    u_xlat10_4 = texture2D(_GrabTexture, u_xlat7.xz);
    u_xlat16_0 = u_xlat10_4 * vec4(0.119999997, 0.119999997, 0.119999997, 0.119999997) + u_xlat16_0;
    u_xlat2.z = u_xlat1.x + vs_TEXCOORD0.x;
    u_xlat2.yw = vs_TEXCOORD0.yy;
    u_xlat1.xy = u_xlat2.xy / vs_TEXCOORD0.ww;
    u_xlat2.xy = u_xlat2.zw / vs_TEXCOORD0.ww;
    u_xlat10_2 = texture2D(_GrabTexture, u_xlat2.xy);
    u_xlat10_4 = texture2D(_GrabTexture, u_xlat1.xy);
    u_xlat16_0 = u_xlat10_4 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036) + u_xlat16_0;
    u_xlat16_0 = u_xlat10_2 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat16_0;
    u_xlat0 = (-u_xlat10_3) + u_xlat16_0;
    u_xlat0 = u_xlat13.xxxx * u_xlat0 + u_xlat10_3;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * _Color;
    SV_Target0 = u_xlat0;
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
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
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
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
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
uniform 	vec4 _GrabTexture_TexelSize;
uniform 	float _Size;
uniform 	vec4 _Color;
uniform lowp sampler2D _GrabTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
lowp vec4 u_xlat10_4;
lowp vec4 u_xlat10_5;
vec3 u_xlat7;
bvec2 u_xlatb7;
vec2 u_xlat13;
float u_xlat19;
void main()
{
    u_xlat0.yw = vs_TEXCOORD0.yy;
    u_xlat1.x = _GrabTexture_TexelSize.x * _Size;
    u_xlat2 = u_xlat1.xxxx * vec4(-4.0, -3.0, -2.0, 3.0);
    u_xlatb7.xy = equal(vs_TEXCOORD0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb7.x = u_xlatb7.y && u_xlatb7.x;
    u_xlat2 = (u_xlatb7.x) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat2;
    u_xlat2 = u_xlat2.wxyz + vs_TEXCOORD0.xxxx;
    u_xlat0.xz = u_xlat2.yz;
    u_xlat0 = u_xlat0 / vs_TEXCOORD0.wwww;
    u_xlat10_3 = texture2D(_GrabTexture, u_xlat0.zw);
    u_xlat10_0 = texture2D(_GrabTexture, u_xlat0.xy);
    u_xlat3 = u_xlat10_3 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036);
    u_xlat16_0 = u_xlat10_0 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat3;
    u_xlat3.x = u_xlat2.w;
    u_xlat3.yw = vs_TEXCOORD0.yy;
    u_xlat13.xy = u_xlat3.xy / vs_TEXCOORD0.ww;
    u_xlat10_4 = texture2D(_GrabTexture, u_xlat13.xy);
    u_xlat16_0 = u_xlat10_4 * vec4(0.119999997, 0.119999997, 0.119999997, 0.119999997) + u_xlat16_0;
    u_xlat13.x = (u_xlatb7.x) ? 0.0 : (-u_xlat1.x);
    u_xlat3.z = u_xlat13.x + vs_TEXCOORD0.x;
    u_xlat13.xy = u_xlat3.zw / vs_TEXCOORD0.ww;
    u_xlat10_3 = texture2D(_GrabTexture, u_xlat13.xy);
    u_xlat16_0 = u_xlat10_3 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat16_0;
    u_xlat13.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat10_3 = texture2D(_GrabTexture, u_xlat13.xy);
    u_xlat16_0 = u_xlat10_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat16_0;
    u_xlat13.x = (u_xlatb7.x) ? 0.0 : 1.0;
    u_xlat19 = u_xlat13.x * _GrabTexture_TexelSize.x;
    u_xlat4.x = u_xlat19 * _Size + vs_TEXCOORD0.x;
    u_xlat4.yw = vs_TEXCOORD0.yy;
    u_xlat4.xy = u_xlat4.xy / vs_TEXCOORD0.ww;
    u_xlat10_5 = texture2D(_GrabTexture, u_xlat4.xy);
    u_xlat16_0 = u_xlat10_5 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat16_0;
    u_xlat19 = u_xlat1.x + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 4.0;
    u_xlat1.x = (u_xlatb7.x) ? 0.0 : u_xlat1.x;
    u_xlat7.x = (u_xlatb7.x) ? 0.0 : u_xlat19;
    u_xlat4.z = u_xlat7.x + vs_TEXCOORD0.x;
    u_xlat7.xz = u_xlat4.zw / vs_TEXCOORD0.ww;
    u_xlat10_4 = texture2D(_GrabTexture, u_xlat7.xz);
    u_xlat16_0 = u_xlat10_4 * vec4(0.119999997, 0.119999997, 0.119999997, 0.119999997) + u_xlat16_0;
    u_xlat2.z = u_xlat1.x + vs_TEXCOORD0.x;
    u_xlat2.yw = vs_TEXCOORD0.yy;
    u_xlat1.xy = u_xlat2.xy / vs_TEXCOORD0.ww;
    u_xlat2.xy = u_xlat2.zw / vs_TEXCOORD0.ww;
    u_xlat10_2 = texture2D(_GrabTexture, u_xlat2.xy);
    u_xlat10_4 = texture2D(_GrabTexture, u_xlat1.xy);
    u_xlat16_0 = u_xlat10_4 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036) + u_xlat16_0;
    u_xlat16_0 = u_xlat10_2 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat16_0;
    u_xlat0 = (-u_xlat10_3) + u_xlat16_0;
    u_xlat0 = u_xlat13.xxxx * u_xlat0 + u_xlat10_3;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * _Color;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
}
}
 GrabPass {
}
 Pass {
  Name "BackBlurVer"
  Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "ALWAYS" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  GpuProgramID 87945
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
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
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
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
uniform 	vec4 _GrabTexture_TexelSize;
uniform 	float _Size;
uniform 	vec4 _Color;
uniform lowp sampler2D _GrabTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
lowp vec4 u_xlat10_4;
lowp vec4 u_xlat10_5;
vec3 u_xlat7;
bvec2 u_xlatb7;
vec2 u_xlat13;
float u_xlat19;
void main()
{
    u_xlat0.xz = vs_TEXCOORD0.xx;
    u_xlat1.x = _GrabTexture_TexelSize.y * _Size;
    u_xlat2 = u_xlat1.xxxx * vec4(-4.0, -3.0, -2.0, 3.0);
    u_xlatb7.xy = equal(vs_TEXCOORD0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb7.x = u_xlatb7.y && u_xlatb7.x;
    u_xlat2 = (u_xlatb7.x) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat2;
    u_xlat2 = u_xlat2.xwyz + vs_TEXCOORD0.yyyy;
    u_xlat0.yw = u_xlat2.xz;
    u_xlat0 = u_xlat0 / vs_TEXCOORD0.wwww;
    u_xlat10_3 = texture2D(_GrabTexture, u_xlat0.zw);
    u_xlat10_0 = texture2D(_GrabTexture, u_xlat0.xy);
    u_xlat3 = u_xlat10_3 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036);
    u_xlat16_0 = u_xlat10_0 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat3;
    u_xlat3.xz = vs_TEXCOORD0.xx;
    u_xlat3.y = u_xlat2.w;
    u_xlat13.xy = u_xlat3.xy / vs_TEXCOORD0.ww;
    u_xlat10_4 = texture2D(_GrabTexture, u_xlat13.xy);
    u_xlat16_0 = u_xlat10_4 * vec4(0.119999997, 0.119999997, 0.119999997, 0.119999997) + u_xlat16_0;
    u_xlat13.x = (u_xlatb7.x) ? 0.0 : (-u_xlat1.x);
    u_xlat3.w = u_xlat13.x + vs_TEXCOORD0.y;
    u_xlat13.xy = u_xlat3.zw / vs_TEXCOORD0.ww;
    u_xlat10_3 = texture2D(_GrabTexture, u_xlat13.xy);
    u_xlat16_0 = u_xlat10_3 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat16_0;
    u_xlat13.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat10_3 = texture2D(_GrabTexture, u_xlat13.xy);
    u_xlat16_0 = u_xlat10_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat16_0;
    u_xlat13.x = (u_xlatb7.x) ? 0.0 : 1.0;
    u_xlat19 = u_xlat13.x * _GrabTexture_TexelSize.y;
    u_xlat4.y = u_xlat19 * _Size + vs_TEXCOORD0.y;
    u_xlat4.xz = vs_TEXCOORD0.xx;
    u_xlat4.xy = u_xlat4.xy / vs_TEXCOORD0.ww;
    u_xlat10_5 = texture2D(_GrabTexture, u_xlat4.xy);
    u_xlat16_0 = u_xlat10_5 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat16_0;
    u_xlat19 = u_xlat1.x + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 4.0;
    u_xlat1.x = (u_xlatb7.x) ? 0.0 : u_xlat1.x;
    u_xlat7.x = (u_xlatb7.x) ? 0.0 : u_xlat19;
    u_xlat4.w = u_xlat7.x + vs_TEXCOORD0.y;
    u_xlat7.xz = u_xlat4.zw / vs_TEXCOORD0.ww;
    u_xlat10_4 = texture2D(_GrabTexture, u_xlat7.xz);
    u_xlat16_0 = u_xlat10_4 * vec4(0.119999997, 0.119999997, 0.119999997, 0.119999997) + u_xlat16_0;
    u_xlat2.w = u_xlat1.x + vs_TEXCOORD0.y;
    u_xlat2.xz = vs_TEXCOORD0.xx;
    u_xlat1.xy = u_xlat2.xy / vs_TEXCOORD0.ww;
    u_xlat2.xy = u_xlat2.zw / vs_TEXCOORD0.ww;
    u_xlat10_2 = texture2D(_GrabTexture, u_xlat2.xy);
    u_xlat10_4 = texture2D(_GrabTexture, u_xlat1.xy);
    u_xlat16_0 = u_xlat10_4 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036) + u_xlat16_0;
    u_xlat16_0 = u_xlat10_2 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat16_0;
    u_xlat0 = (-u_xlat10_3) + u_xlat16_0;
    u_xlat0 = u_xlat13.xxxx * u_xlat0 + u_xlat10_3;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * _Color;
    SV_Target0 = u_xlat0;
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
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
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
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
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
uniform 	vec4 _GrabTexture_TexelSize;
uniform 	float _Size;
uniform 	vec4 _Color;
uniform lowp sampler2D _GrabTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
lowp vec4 u_xlat10_4;
lowp vec4 u_xlat10_5;
vec3 u_xlat7;
bvec2 u_xlatb7;
vec2 u_xlat13;
float u_xlat19;
void main()
{
    u_xlat0.xz = vs_TEXCOORD0.xx;
    u_xlat1.x = _GrabTexture_TexelSize.y * _Size;
    u_xlat2 = u_xlat1.xxxx * vec4(-4.0, -3.0, -2.0, 3.0);
    u_xlatb7.xy = equal(vs_TEXCOORD0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb7.x = u_xlatb7.y && u_xlatb7.x;
    u_xlat2 = (u_xlatb7.x) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat2;
    u_xlat2 = u_xlat2.xwyz + vs_TEXCOORD0.yyyy;
    u_xlat0.yw = u_xlat2.xz;
    u_xlat0 = u_xlat0 / vs_TEXCOORD0.wwww;
    u_xlat10_3 = texture2D(_GrabTexture, u_xlat0.zw);
    u_xlat10_0 = texture2D(_GrabTexture, u_xlat0.xy);
    u_xlat3 = u_xlat10_3 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036);
    u_xlat16_0 = u_xlat10_0 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat3;
    u_xlat3.xz = vs_TEXCOORD0.xx;
    u_xlat3.y = u_xlat2.w;
    u_xlat13.xy = u_xlat3.xy / vs_TEXCOORD0.ww;
    u_xlat10_4 = texture2D(_GrabTexture, u_xlat13.xy);
    u_xlat16_0 = u_xlat10_4 * vec4(0.119999997, 0.119999997, 0.119999997, 0.119999997) + u_xlat16_0;
    u_xlat13.x = (u_xlatb7.x) ? 0.0 : (-u_xlat1.x);
    u_xlat3.w = u_xlat13.x + vs_TEXCOORD0.y;
    u_xlat13.xy = u_xlat3.zw / vs_TEXCOORD0.ww;
    u_xlat10_3 = texture2D(_GrabTexture, u_xlat13.xy);
    u_xlat16_0 = u_xlat10_3 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat16_0;
    u_xlat13.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat10_3 = texture2D(_GrabTexture, u_xlat13.xy);
    u_xlat16_0 = u_xlat10_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat16_0;
    u_xlat13.x = (u_xlatb7.x) ? 0.0 : 1.0;
    u_xlat19 = u_xlat13.x * _GrabTexture_TexelSize.y;
    u_xlat4.y = u_xlat19 * _Size + vs_TEXCOORD0.y;
    u_xlat4.xz = vs_TEXCOORD0.xx;
    u_xlat4.xy = u_xlat4.xy / vs_TEXCOORD0.ww;
    u_xlat10_5 = texture2D(_GrabTexture, u_xlat4.xy);
    u_xlat16_0 = u_xlat10_5 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat16_0;
    u_xlat19 = u_xlat1.x + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 4.0;
    u_xlat1.x = (u_xlatb7.x) ? 0.0 : u_xlat1.x;
    u_xlat7.x = (u_xlatb7.x) ? 0.0 : u_xlat19;
    u_xlat4.w = u_xlat7.x + vs_TEXCOORD0.y;
    u_xlat7.xz = u_xlat4.zw / vs_TEXCOORD0.ww;
    u_xlat10_4 = texture2D(_GrabTexture, u_xlat7.xz);
    u_xlat16_0 = u_xlat10_4 * vec4(0.119999997, 0.119999997, 0.119999997, 0.119999997) + u_xlat16_0;
    u_xlat2.w = u_xlat1.x + vs_TEXCOORD0.y;
    u_xlat2.xz = vs_TEXCOORD0.xx;
    u_xlat1.xy = u_xlat2.xy / vs_TEXCOORD0.ww;
    u_xlat2.xy = u_xlat2.zw / vs_TEXCOORD0.ww;
    u_xlat10_2 = texture2D(_GrabTexture, u_xlat2.xy);
    u_xlat10_4 = texture2D(_GrabTexture, u_xlat1.xy);
    u_xlat16_0 = u_xlat10_4 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036) + u_xlat16_0;
    u_xlat16_0 = u_xlat10_2 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat16_0;
    u_xlat0 = (-u_xlat10_3) + u_xlat16_0;
    u_xlat0 = u_xlat13.xxxx * u_xlat0 + u_xlat10_3;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * _Color;
    SV_Target0 = u_xlat0;
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
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
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
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
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
uniform 	vec4 _GrabTexture_TexelSize;
uniform 	float _Size;
uniform 	vec4 _Color;
uniform lowp sampler2D _GrabTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
lowp vec4 u_xlat10_4;
lowp vec4 u_xlat10_5;
vec3 u_xlat7;
bvec2 u_xlatb7;
vec2 u_xlat13;
float u_xlat19;
void main()
{
    u_xlat0.xz = vs_TEXCOORD0.xx;
    u_xlat1.x = _GrabTexture_TexelSize.y * _Size;
    u_xlat2 = u_xlat1.xxxx * vec4(-4.0, -3.0, -2.0, 3.0);
    u_xlatb7.xy = equal(vs_TEXCOORD0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb7.x = u_xlatb7.y && u_xlatb7.x;
    u_xlat2 = (u_xlatb7.x) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat2;
    u_xlat2 = u_xlat2.xwyz + vs_TEXCOORD0.yyyy;
    u_xlat0.yw = u_xlat2.xz;
    u_xlat0 = u_xlat0 / vs_TEXCOORD0.wwww;
    u_xlat10_3 = texture2D(_GrabTexture, u_xlat0.zw);
    u_xlat10_0 = texture2D(_GrabTexture, u_xlat0.xy);
    u_xlat3 = u_xlat10_3 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036);
    u_xlat16_0 = u_xlat10_0 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat3;
    u_xlat3.xz = vs_TEXCOORD0.xx;
    u_xlat3.y = u_xlat2.w;
    u_xlat13.xy = u_xlat3.xy / vs_TEXCOORD0.ww;
    u_xlat10_4 = texture2D(_GrabTexture, u_xlat13.xy);
    u_xlat16_0 = u_xlat10_4 * vec4(0.119999997, 0.119999997, 0.119999997, 0.119999997) + u_xlat16_0;
    u_xlat13.x = (u_xlatb7.x) ? 0.0 : (-u_xlat1.x);
    u_xlat3.w = u_xlat13.x + vs_TEXCOORD0.y;
    u_xlat13.xy = u_xlat3.zw / vs_TEXCOORD0.ww;
    u_xlat10_3 = texture2D(_GrabTexture, u_xlat13.xy);
    u_xlat16_0 = u_xlat10_3 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat16_0;
    u_xlat13.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat10_3 = texture2D(_GrabTexture, u_xlat13.xy);
    u_xlat16_0 = u_xlat10_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat16_0;
    u_xlat13.x = (u_xlatb7.x) ? 0.0 : 1.0;
    u_xlat19 = u_xlat13.x * _GrabTexture_TexelSize.y;
    u_xlat4.y = u_xlat19 * _Size + vs_TEXCOORD0.y;
    u_xlat4.xz = vs_TEXCOORD0.xx;
    u_xlat4.xy = u_xlat4.xy / vs_TEXCOORD0.ww;
    u_xlat10_5 = texture2D(_GrabTexture, u_xlat4.xy);
    u_xlat16_0 = u_xlat10_5 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat16_0;
    u_xlat19 = u_xlat1.x + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 4.0;
    u_xlat1.x = (u_xlatb7.x) ? 0.0 : u_xlat1.x;
    u_xlat7.x = (u_xlatb7.x) ? 0.0 : u_xlat19;
    u_xlat4.w = u_xlat7.x + vs_TEXCOORD0.y;
    u_xlat7.xz = u_xlat4.zw / vs_TEXCOORD0.ww;
    u_xlat10_4 = texture2D(_GrabTexture, u_xlat7.xz);
    u_xlat16_0 = u_xlat10_4 * vec4(0.119999997, 0.119999997, 0.119999997, 0.119999997) + u_xlat16_0;
    u_xlat2.w = u_xlat1.x + vs_TEXCOORD0.y;
    u_xlat2.xz = vs_TEXCOORD0.xx;
    u_xlat1.xy = u_xlat2.xy / vs_TEXCOORD0.ww;
    u_xlat2.xy = u_xlat2.zw / vs_TEXCOORD0.ww;
    u_xlat10_2 = texture2D(_GrabTexture, u_xlat2.xy);
    u_xlat10_4 = texture2D(_GrabTexture, u_xlat1.xy);
    u_xlat16_0 = u_xlat10_4 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036) + u_xlat16_0;
    u_xlat16_0 = u_xlat10_2 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat16_0;
    u_xlat0 = (-u_xlat10_3) + u_xlat16_0;
    u_xlat0 = u_xlat13.xxxx * u_xlat0 + u_xlat10_3;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * _Color;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
}
}
}
}