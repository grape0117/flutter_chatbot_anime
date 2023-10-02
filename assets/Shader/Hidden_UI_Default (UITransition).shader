//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/UI/Default (UITransition)" {
Properties {
_MainTex ("Main Texture", 2D) = "white" { }
_Color ("Tint", Color) = (1,1,1,1)
_StencilComp ("Stencil Comparison", Float) = 8
_Stencil ("Stencil ID", Float) = 0
_StencilOp ("Stencil Operation", Float) = 0
_StencilWriteMask ("Stencil Write Mask", Float) = 255
_StencilReadMask ("Stencil Read Mask", Float) = 255
_ColorMask ("Color Mask", Float) = 15
[Toggle(UNITY_UI_ALPHACLIP)] _UseUIAlphaClip ("Use Alpha Clip", Float) = 0
[Header(Transition)] _TransitionTex ("Transition Texture (A)", 2D) = "white" { }
_ParamTex ("Parameter Texture", 2D) = "white" { }
}
SubShader {
 Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Name "Default"
  Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ColorMask 0 0
  ZTest Off
  ZWrite Off
  Cull Off
  Stencil {
   ReadMask 0
   WriteMask 0
   Comp Disabled
   Pass Keep
   Fail Keep
   ZFail Keep
  }
  GpuProgramID 63159
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb3;
float u_xlat4;
vec2 u_xlat8;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_TEXCOORD0.xxyy * vec4(4096.0, 0.000244140625, 256.0, 0.00390625);
    u_xlatb1 = greaterThanEqual(u_xlat0.xxzz, (-u_xlat0.xxzz));
    u_xlat0.xy = floor(u_xlat0.yw);
    u_xlat1.x = (u_xlatb1.x) ? float(4096.0) : float(-4096.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat1.z = (u_xlatb1.z) ? float(256.0) : float(-256.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat8.xy = u_xlat1.yw * in_TEXCOORD0.xy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy * u_xlat1.xz;
    u_xlat1.xz = u_xlat8.yx * vec2(0.00392156886, 0.000244200259);
    u_xlat2.xyz = u_xlat0.xyy * vec3(4096.0, 256.0, 0.00390625);
    u_xlatb3 = greaterThanEqual(u_xlat2.xxyy, (-u_xlat2.xxyy));
    u_xlat8.x = floor(u_xlat2.z);
    u_xlat2.x = (u_xlatb3.x) ? float(4096.0) : float(-4096.0);
    u_xlat2.y = (u_xlatb3.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat2.z = (u_xlatb3.z) ? float(256.0) : float(-256.0);
    u_xlat2.w = (u_xlatb3.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.yw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.xz;
    u_xlat1.yw = u_xlat0.yx * vec2(0.00392156886, 0.000244200259);
    vs_TEXCOORD0.xy = u_xlat1.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.x = u_xlat8.x * 256.0;
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.xy = (bool(u_xlatb0)) ? vec2(256.0, 0.00390625) : vec2(-256.0, -0.00390625);
    u_xlat4 = u_xlat0.y * u_xlat8.x;
    u_xlat4 = fract(u_xlat4);
    u_xlat0.x = u_xlat4 * u_xlat0.x;
    u_xlat1.z = u_xlat0.x * 0.00392156886;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.zw * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_1 + _TextureSampleAdd;
    u_xlat1.w = u_xlat0.x * u_xlat1.w;
    SV_Target0 = u_xlat1 * vs_COLOR0;
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
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb3;
float u_xlat4;
vec2 u_xlat8;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_TEXCOORD0.xxyy * vec4(4096.0, 0.000244140625, 256.0, 0.00390625);
    u_xlatb1 = greaterThanEqual(u_xlat0.xxzz, (-u_xlat0.xxzz));
    u_xlat0.xy = floor(u_xlat0.yw);
    u_xlat1.x = (u_xlatb1.x) ? float(4096.0) : float(-4096.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat1.z = (u_xlatb1.z) ? float(256.0) : float(-256.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat8.xy = u_xlat1.yw * in_TEXCOORD0.xy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy * u_xlat1.xz;
    u_xlat1.xz = u_xlat8.yx * vec2(0.00392156886, 0.000244200259);
    u_xlat2.xyz = u_xlat0.xyy * vec3(4096.0, 256.0, 0.00390625);
    u_xlatb3 = greaterThanEqual(u_xlat2.xxyy, (-u_xlat2.xxyy));
    u_xlat8.x = floor(u_xlat2.z);
    u_xlat2.x = (u_xlatb3.x) ? float(4096.0) : float(-4096.0);
    u_xlat2.y = (u_xlatb3.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat2.z = (u_xlatb3.z) ? float(256.0) : float(-256.0);
    u_xlat2.w = (u_xlatb3.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.yw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.xz;
    u_xlat1.yw = u_xlat0.yx * vec2(0.00392156886, 0.000244200259);
    vs_TEXCOORD0.xy = u_xlat1.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.x = u_xlat8.x * 256.0;
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.xy = (bool(u_xlatb0)) ? vec2(256.0, 0.00390625) : vec2(-256.0, -0.00390625);
    u_xlat4 = u_xlat0.y * u_xlat8.x;
    u_xlat4 = fract(u_xlat4);
    u_xlat0.x = u_xlat4 * u_xlat0.x;
    u_xlat1.z = u_xlat0.x * 0.00392156886;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.zw * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_1 + _TextureSampleAdd;
    u_xlat1.w = u_xlat0.x * u_xlat1.w;
    SV_Target0 = u_xlat1 * vs_COLOR0;
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
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb3;
float u_xlat4;
vec2 u_xlat8;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_TEXCOORD0.xxyy * vec4(4096.0, 0.000244140625, 256.0, 0.00390625);
    u_xlatb1 = greaterThanEqual(u_xlat0.xxzz, (-u_xlat0.xxzz));
    u_xlat0.xy = floor(u_xlat0.yw);
    u_xlat1.x = (u_xlatb1.x) ? float(4096.0) : float(-4096.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat1.z = (u_xlatb1.z) ? float(256.0) : float(-256.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat8.xy = u_xlat1.yw * in_TEXCOORD0.xy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy * u_xlat1.xz;
    u_xlat1.xz = u_xlat8.yx * vec2(0.00392156886, 0.000244200259);
    u_xlat2.xyz = u_xlat0.xyy * vec3(4096.0, 256.0, 0.00390625);
    u_xlatb3 = greaterThanEqual(u_xlat2.xxyy, (-u_xlat2.xxyy));
    u_xlat8.x = floor(u_xlat2.z);
    u_xlat2.x = (u_xlatb3.x) ? float(4096.0) : float(-4096.0);
    u_xlat2.y = (u_xlatb3.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat2.z = (u_xlatb3.z) ? float(256.0) : float(-256.0);
    u_xlat2.w = (u_xlatb3.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.yw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.xz;
    u_xlat1.yw = u_xlat0.yx * vec2(0.00392156886, 0.000244200259);
    vs_TEXCOORD0.xy = u_xlat1.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.x = u_xlat8.x * 256.0;
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.xy = (bool(u_xlatb0)) ? vec2(256.0, 0.00390625) : vec2(-256.0, -0.00390625);
    u_xlat4 = u_xlat0.y * u_xlat8.x;
    u_xlat4 = fract(u_xlat4);
    u_xlat0.x = u_xlat4 * u_xlat0.x;
    u_xlat1.z = u_xlat0.x * 0.00392156886;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.zw * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_1 + _TextureSampleAdd;
    u_xlat1.w = u_xlat0.x * u_xlat1.w;
    SV_Target0 = u_xlat1 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FADE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb3;
float u_xlat4;
vec2 u_xlat8;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_TEXCOORD0.xxyy * vec4(4096.0, 0.000244140625, 256.0, 0.00390625);
    u_xlatb1 = greaterThanEqual(u_xlat0.xxzz, (-u_xlat0.xxzz));
    u_xlat0.xy = floor(u_xlat0.yw);
    u_xlat1.x = (u_xlatb1.x) ? float(4096.0) : float(-4096.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat1.z = (u_xlatb1.z) ? float(256.0) : float(-256.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat8.xy = u_xlat1.yw * in_TEXCOORD0.xy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy * u_xlat1.xz;
    u_xlat1.xz = u_xlat8.yx * vec2(0.00392156886, 0.000244200259);
    u_xlat2.xyz = u_xlat0.xyy * vec3(4096.0, 256.0, 0.00390625);
    u_xlatb3 = greaterThanEqual(u_xlat2.xxyy, (-u_xlat2.xxyy));
    u_xlat8.x = floor(u_xlat2.z);
    u_xlat2.x = (u_xlatb3.x) ? float(4096.0) : float(-4096.0);
    u_xlat2.y = (u_xlatb3.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat2.z = (u_xlatb3.z) ? float(256.0) : float(-256.0);
    u_xlat2.w = (u_xlatb3.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.yw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.xz;
    u_xlat1.yw = u_xlat0.yx * vec2(0.00392156886, 0.000244200259);
    vs_TEXCOORD0.xy = u_xlat1.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.x = u_xlat8.x * 256.0;
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.xy = (bool(u_xlatb0)) ? vec2(256.0, 0.00390625) : vec2(-256.0, -0.00390625);
    u_xlat4 = u_xlat0.y * u_xlat8.x;
    u_xlat4 = fract(u_xlat4);
    u_xlat0.x = u_xlat4 * u_xlat0.x;
    u_xlat1.z = u_xlat0.x * 0.00392156886;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ParamTex;
uniform lowp sampler2D _TransitionTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
float u_xlat1;
lowp float u_xlat10_1;
vec2 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat4;
bvec2 u_xlatb4;
void main()
{
    u_xlat16_0.x = 0.25;
    u_xlat16_0.y = vs_TEXCOORD2.z;
    u_xlat10_1 = texture2D(_ParamTex, u_xlat16_0.xy).x;
    u_xlat16_0.x = (-u_xlat10_1) + 1.0;
    u_xlat16_0.x = (-u_xlat16_0.x) * 2.0 + 1.0;
    u_xlat10_1 = texture2D(_TransitionTex, vs_TEXCOORD2.xy).w;
    u_xlat1 = u_xlat16_0.x + u_xlat10_1;
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlatb4.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlat4.x = u_xlatb4.x ? float(1.0) : 0.0;
    u_xlat4.y = u_xlatb4.y ? float(1.0) : 0.0;
;
    u_xlatb2.xy = greaterThanEqual(_ClipRect.zwzz, vs_TEXCOORD1.xyxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(1.0) : 0.0;
;
    u_xlat4.xy = u_xlat4.xy * u_xlat2.xy;
    u_xlat4.x = u_xlat4.y * u_xlat4.x;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_0 + _TextureSampleAdd;
    u_xlat4.x = u_xlat4.x * u_xlat0.w;
    u_xlat0.w = u_xlat1 * u_xlat4.x;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FADE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb3;
float u_xlat4;
vec2 u_xlat8;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_TEXCOORD0.xxyy * vec4(4096.0, 0.000244140625, 256.0, 0.00390625);
    u_xlatb1 = greaterThanEqual(u_xlat0.xxzz, (-u_xlat0.xxzz));
    u_xlat0.xy = floor(u_xlat0.yw);
    u_xlat1.x = (u_xlatb1.x) ? float(4096.0) : float(-4096.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat1.z = (u_xlatb1.z) ? float(256.0) : float(-256.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat8.xy = u_xlat1.yw * in_TEXCOORD0.xy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy * u_xlat1.xz;
    u_xlat1.xz = u_xlat8.yx * vec2(0.00392156886, 0.000244200259);
    u_xlat2.xyz = u_xlat0.xyy * vec3(4096.0, 256.0, 0.00390625);
    u_xlatb3 = greaterThanEqual(u_xlat2.xxyy, (-u_xlat2.xxyy));
    u_xlat8.x = floor(u_xlat2.z);
    u_xlat2.x = (u_xlatb3.x) ? float(4096.0) : float(-4096.0);
    u_xlat2.y = (u_xlatb3.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat2.z = (u_xlatb3.z) ? float(256.0) : float(-256.0);
    u_xlat2.w = (u_xlatb3.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.yw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.xz;
    u_xlat1.yw = u_xlat0.yx * vec2(0.00392156886, 0.000244200259);
    vs_TEXCOORD0.xy = u_xlat1.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.x = u_xlat8.x * 256.0;
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.xy = (bool(u_xlatb0)) ? vec2(256.0, 0.00390625) : vec2(-256.0, -0.00390625);
    u_xlat4 = u_xlat0.y * u_xlat8.x;
    u_xlat4 = fract(u_xlat4);
    u_xlat0.x = u_xlat4 * u_xlat0.x;
    u_xlat1.z = u_xlat0.x * 0.00392156886;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ParamTex;
uniform lowp sampler2D _TransitionTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
float u_xlat1;
lowp float u_xlat10_1;
vec2 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat4;
bvec2 u_xlatb4;
void main()
{
    u_xlat16_0.x = 0.25;
    u_xlat16_0.y = vs_TEXCOORD2.z;
    u_xlat10_1 = texture2D(_ParamTex, u_xlat16_0.xy).x;
    u_xlat16_0.x = (-u_xlat10_1) + 1.0;
    u_xlat16_0.x = (-u_xlat16_0.x) * 2.0 + 1.0;
    u_xlat10_1 = texture2D(_TransitionTex, vs_TEXCOORD2.xy).w;
    u_xlat1 = u_xlat16_0.x + u_xlat10_1;
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlatb4.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlat4.x = u_xlatb4.x ? float(1.0) : 0.0;
    u_xlat4.y = u_xlatb4.y ? float(1.0) : 0.0;
;
    u_xlatb2.xy = greaterThanEqual(_ClipRect.zwzz, vs_TEXCOORD1.xyxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(1.0) : 0.0;
;
    u_xlat4.xy = u_xlat4.xy * u_xlat2.xy;
    u_xlat4.x = u_xlat4.y * u_xlat4.x;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_0 + _TextureSampleAdd;
    u_xlat4.x = u_xlat4.x * u_xlat0.w;
    u_xlat0.w = u_xlat1 * u_xlat4.x;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FADE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb3;
float u_xlat4;
vec2 u_xlat8;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_TEXCOORD0.xxyy * vec4(4096.0, 0.000244140625, 256.0, 0.00390625);
    u_xlatb1 = greaterThanEqual(u_xlat0.xxzz, (-u_xlat0.xxzz));
    u_xlat0.xy = floor(u_xlat0.yw);
    u_xlat1.x = (u_xlatb1.x) ? float(4096.0) : float(-4096.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat1.z = (u_xlatb1.z) ? float(256.0) : float(-256.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat8.xy = u_xlat1.yw * in_TEXCOORD0.xy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy * u_xlat1.xz;
    u_xlat1.xz = u_xlat8.yx * vec2(0.00392156886, 0.000244200259);
    u_xlat2.xyz = u_xlat0.xyy * vec3(4096.0, 256.0, 0.00390625);
    u_xlatb3 = greaterThanEqual(u_xlat2.xxyy, (-u_xlat2.xxyy));
    u_xlat8.x = floor(u_xlat2.z);
    u_xlat2.x = (u_xlatb3.x) ? float(4096.0) : float(-4096.0);
    u_xlat2.y = (u_xlatb3.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat2.z = (u_xlatb3.z) ? float(256.0) : float(-256.0);
    u_xlat2.w = (u_xlatb3.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.yw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.xz;
    u_xlat1.yw = u_xlat0.yx * vec2(0.00392156886, 0.000244200259);
    vs_TEXCOORD0.xy = u_xlat1.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.x = u_xlat8.x * 256.0;
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.xy = (bool(u_xlatb0)) ? vec2(256.0, 0.00390625) : vec2(-256.0, -0.00390625);
    u_xlat4 = u_xlat0.y * u_xlat8.x;
    u_xlat4 = fract(u_xlat4);
    u_xlat0.x = u_xlat4 * u_xlat0.x;
    u_xlat1.z = u_xlat0.x * 0.00392156886;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ParamTex;
uniform lowp sampler2D _TransitionTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
float u_xlat1;
lowp float u_xlat10_1;
vec2 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat4;
bvec2 u_xlatb4;
void main()
{
    u_xlat16_0.x = 0.25;
    u_xlat16_0.y = vs_TEXCOORD2.z;
    u_xlat10_1 = texture2D(_ParamTex, u_xlat16_0.xy).x;
    u_xlat16_0.x = (-u_xlat10_1) + 1.0;
    u_xlat16_0.x = (-u_xlat16_0.x) * 2.0 + 1.0;
    u_xlat10_1 = texture2D(_TransitionTex, vs_TEXCOORD2.xy).w;
    u_xlat1 = u_xlat16_0.x + u_xlat10_1;
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlatb4.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlat4.x = u_xlatb4.x ? float(1.0) : 0.0;
    u_xlat4.y = u_xlatb4.y ? float(1.0) : 0.0;
;
    u_xlatb2.xy = greaterThanEqual(_ClipRect.zwzz, vs_TEXCOORD1.xyxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(1.0) : 0.0;
;
    u_xlat4.xy = u_xlat4.xy * u_xlat2.xy;
    u_xlat4.x = u_xlat4.y * u_xlat4.x;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_0 + _TextureSampleAdd;
    u_xlat4.x = u_xlat4.x * u_xlat0.w;
    u_xlat0.w = u_xlat1 * u_xlat4.x;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "CUTOFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb3;
float u_xlat4;
vec2 u_xlat8;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_TEXCOORD0.xxyy * vec4(4096.0, 0.000244140625, 256.0, 0.00390625);
    u_xlatb1 = greaterThanEqual(u_xlat0.xxzz, (-u_xlat0.xxzz));
    u_xlat0.xy = floor(u_xlat0.yw);
    u_xlat1.x = (u_xlatb1.x) ? float(4096.0) : float(-4096.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat1.z = (u_xlatb1.z) ? float(256.0) : float(-256.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat8.xy = u_xlat1.yw * in_TEXCOORD0.xy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy * u_xlat1.xz;
    u_xlat1.xz = u_xlat8.yx * vec2(0.00392156886, 0.000244200259);
    u_xlat2.xyz = u_xlat0.xyy * vec3(4096.0, 256.0, 0.00390625);
    u_xlatb3 = greaterThanEqual(u_xlat2.xxyy, (-u_xlat2.xxyy));
    u_xlat8.x = floor(u_xlat2.z);
    u_xlat2.x = (u_xlatb3.x) ? float(4096.0) : float(-4096.0);
    u_xlat2.y = (u_xlatb3.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat2.z = (u_xlatb3.z) ? float(256.0) : float(-256.0);
    u_xlat2.w = (u_xlatb3.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.yw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.xz;
    u_xlat1.yw = u_xlat0.yx * vec2(0.00392156886, 0.000244200259);
    vs_TEXCOORD0.xy = u_xlat1.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.x = u_xlat8.x * 256.0;
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.xy = (bool(u_xlatb0)) ? vec2(256.0, 0.00390625) : vec2(-256.0, -0.00390625);
    u_xlat4 = u_xlat0.y * u_xlat8.x;
    u_xlat4 = fract(u_xlat4);
    u_xlat0.x = u_xlat4 * u_xlat0.x;
    u_xlat1.z = u_xlat0.x * 0.00392156886;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ParamTex;
uniform lowp sampler2D _TransitionTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
vec4 u_xlat1;
lowp float u_xlat10_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
float u_xlat4;
lowp float u_xlat10_4;
bool u_xlatb4;
void main()
{
    u_xlat16_0.x = 0.25;
    u_xlat16_0.y = vs_TEXCOORD2.z;
    u_xlat10_1 = texture2D(_ParamTex, u_xlat16_0.xy).x;
    u_xlat16_0.x = (-u_xlat10_1) + 1.0;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb1.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb1.w ? float(1.0) : 0.0;
;
    u_xlat1.xy = u_xlat1.zw * u_xlat1.xy;
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2 = u_xlat10_2 + _TextureSampleAdd;
    u_xlat1.x = u_xlat1.x * u_xlat2.w;
    u_xlat10_4 = texture2D(_TransitionTex, vs_TEXCOORD2.xy).w;
    u_xlat4 = u_xlat1.x * u_xlat10_4 + (-u_xlat16_0.x);
    u_xlatb4 = u_xlat4>=0.00100000005;
    u_xlat4 = u_xlatb4 ? 1.0 : float(0.0);
    u_xlat2.w = u_xlat4 * u_xlat1.x;
    SV_Target0 = u_xlat2 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "CUTOFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb3;
float u_xlat4;
vec2 u_xlat8;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_TEXCOORD0.xxyy * vec4(4096.0, 0.000244140625, 256.0, 0.00390625);
    u_xlatb1 = greaterThanEqual(u_xlat0.xxzz, (-u_xlat0.xxzz));
    u_xlat0.xy = floor(u_xlat0.yw);
    u_xlat1.x = (u_xlatb1.x) ? float(4096.0) : float(-4096.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat1.z = (u_xlatb1.z) ? float(256.0) : float(-256.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat8.xy = u_xlat1.yw * in_TEXCOORD0.xy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy * u_xlat1.xz;
    u_xlat1.xz = u_xlat8.yx * vec2(0.00392156886, 0.000244200259);
    u_xlat2.xyz = u_xlat0.xyy * vec3(4096.0, 256.0, 0.00390625);
    u_xlatb3 = greaterThanEqual(u_xlat2.xxyy, (-u_xlat2.xxyy));
    u_xlat8.x = floor(u_xlat2.z);
    u_xlat2.x = (u_xlatb3.x) ? float(4096.0) : float(-4096.0);
    u_xlat2.y = (u_xlatb3.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat2.z = (u_xlatb3.z) ? float(256.0) : float(-256.0);
    u_xlat2.w = (u_xlatb3.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.yw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.xz;
    u_xlat1.yw = u_xlat0.yx * vec2(0.00392156886, 0.000244200259);
    vs_TEXCOORD0.xy = u_xlat1.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.x = u_xlat8.x * 256.0;
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.xy = (bool(u_xlatb0)) ? vec2(256.0, 0.00390625) : vec2(-256.0, -0.00390625);
    u_xlat4 = u_xlat0.y * u_xlat8.x;
    u_xlat4 = fract(u_xlat4);
    u_xlat0.x = u_xlat4 * u_xlat0.x;
    u_xlat1.z = u_xlat0.x * 0.00392156886;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ParamTex;
uniform lowp sampler2D _TransitionTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
vec4 u_xlat1;
lowp float u_xlat10_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
float u_xlat4;
lowp float u_xlat10_4;
bool u_xlatb4;
void main()
{
    u_xlat16_0.x = 0.25;
    u_xlat16_0.y = vs_TEXCOORD2.z;
    u_xlat10_1 = texture2D(_ParamTex, u_xlat16_0.xy).x;
    u_xlat16_0.x = (-u_xlat10_1) + 1.0;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb1.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb1.w ? float(1.0) : 0.0;
;
    u_xlat1.xy = u_xlat1.zw * u_xlat1.xy;
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2 = u_xlat10_2 + _TextureSampleAdd;
    u_xlat1.x = u_xlat1.x * u_xlat2.w;
    u_xlat10_4 = texture2D(_TransitionTex, vs_TEXCOORD2.xy).w;
    u_xlat4 = u_xlat1.x * u_xlat10_4 + (-u_xlat16_0.x);
    u_xlatb4 = u_xlat4>=0.00100000005;
    u_xlat4 = u_xlatb4 ? 1.0 : float(0.0);
    u_xlat2.w = u_xlat4 * u_xlat1.x;
    SV_Target0 = u_xlat2 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "CUTOFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb3;
float u_xlat4;
vec2 u_xlat8;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_TEXCOORD0.xxyy * vec4(4096.0, 0.000244140625, 256.0, 0.00390625);
    u_xlatb1 = greaterThanEqual(u_xlat0.xxzz, (-u_xlat0.xxzz));
    u_xlat0.xy = floor(u_xlat0.yw);
    u_xlat1.x = (u_xlatb1.x) ? float(4096.0) : float(-4096.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat1.z = (u_xlatb1.z) ? float(256.0) : float(-256.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat8.xy = u_xlat1.yw * in_TEXCOORD0.xy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy * u_xlat1.xz;
    u_xlat1.xz = u_xlat8.yx * vec2(0.00392156886, 0.000244200259);
    u_xlat2.xyz = u_xlat0.xyy * vec3(4096.0, 256.0, 0.00390625);
    u_xlatb3 = greaterThanEqual(u_xlat2.xxyy, (-u_xlat2.xxyy));
    u_xlat8.x = floor(u_xlat2.z);
    u_xlat2.x = (u_xlatb3.x) ? float(4096.0) : float(-4096.0);
    u_xlat2.y = (u_xlatb3.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat2.z = (u_xlatb3.z) ? float(256.0) : float(-256.0);
    u_xlat2.w = (u_xlatb3.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.yw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.xz;
    u_xlat1.yw = u_xlat0.yx * vec2(0.00392156886, 0.000244200259);
    vs_TEXCOORD0.xy = u_xlat1.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.x = u_xlat8.x * 256.0;
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.xy = (bool(u_xlatb0)) ? vec2(256.0, 0.00390625) : vec2(-256.0, -0.00390625);
    u_xlat4 = u_xlat0.y * u_xlat8.x;
    u_xlat4 = fract(u_xlat4);
    u_xlat0.x = u_xlat4 * u_xlat0.x;
    u_xlat1.z = u_xlat0.x * 0.00392156886;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ParamTex;
uniform lowp sampler2D _TransitionTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
vec4 u_xlat1;
lowp float u_xlat10_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
float u_xlat4;
lowp float u_xlat10_4;
bool u_xlatb4;
void main()
{
    u_xlat16_0.x = 0.25;
    u_xlat16_0.y = vs_TEXCOORD2.z;
    u_xlat10_1 = texture2D(_ParamTex, u_xlat16_0.xy).x;
    u_xlat16_0.x = (-u_xlat10_1) + 1.0;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb1.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb1.w ? float(1.0) : 0.0;
;
    u_xlat1.xy = u_xlat1.zw * u_xlat1.xy;
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2 = u_xlat10_2 + _TextureSampleAdd;
    u_xlat1.x = u_xlat1.x * u_xlat2.w;
    u_xlat10_4 = texture2D(_TransitionTex, vs_TEXCOORD2.xy).w;
    u_xlat4 = u_xlat1.x * u_xlat10_4 + (-u_xlat16_0.x);
    u_xlatb4 = u_xlat4>=0.00100000005;
    u_xlat4 = u_xlatb4 ? 1.0 : float(0.0);
    u_xlat2.w = u_xlat4 * u_xlat1.x;
    SV_Target0 = u_xlat2 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DISSOLVE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb3;
float u_xlat4;
vec2 u_xlat8;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_TEXCOORD0.xxyy * vec4(4096.0, 0.000244140625, 256.0, 0.00390625);
    u_xlatb1 = greaterThanEqual(u_xlat0.xxzz, (-u_xlat0.xxzz));
    u_xlat0.xy = floor(u_xlat0.yw);
    u_xlat1.x = (u_xlatb1.x) ? float(4096.0) : float(-4096.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat1.z = (u_xlatb1.z) ? float(256.0) : float(-256.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat8.xy = u_xlat1.yw * in_TEXCOORD0.xy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy * u_xlat1.xz;
    u_xlat1.xz = u_xlat8.yx * vec2(0.00392156886, 0.000244200259);
    u_xlat2.xyz = u_xlat0.xyy * vec3(4096.0, 256.0, 0.00390625);
    u_xlatb3 = greaterThanEqual(u_xlat2.xxyy, (-u_xlat2.xxyy));
    u_xlat8.x = floor(u_xlat2.z);
    u_xlat2.x = (u_xlatb3.x) ? float(4096.0) : float(-4096.0);
    u_xlat2.y = (u_xlatb3.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat2.z = (u_xlatb3.z) ? float(256.0) : float(-256.0);
    u_xlat2.w = (u_xlatb3.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.yw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.xz;
    u_xlat1.yw = u_xlat0.yx * vec2(0.00392156886, 0.000244200259);
    vs_TEXCOORD0.xy = u_xlat1.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.x = u_xlat8.x * 256.0;
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.xy = (bool(u_xlatb0)) ? vec2(256.0, 0.00390625) : vec2(-256.0, -0.00390625);
    u_xlat4 = u_xlat0.y * u_xlat8.x;
    u_xlat4 = fract(u_xlat4);
    u_xlat0.x = u_xlat4 * u_xlat0.x;
    u_xlat1.z = u_xlat0.x * 0.00392156886;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ParamTex;
uniform lowp sampler2D _TransitionTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
float u_xlat5;
lowp float u_xlat10_5;
mediump float u_xlat16_7;
float u_xlat10;
bool u_xlatb10;
float u_xlat15;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.zw * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_1 + _TextureSampleAdd;
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
    u_xlat10_5 = texture2D(_TransitionTex, vs_TEXCOORD2.xy).w;
    u_xlat16_2.x = float(0.25);
    u_xlat16_2.z = float(0.75);
    u_xlat16_2.yw = vs_TEXCOORD2.zz;
    u_xlat10_3.xyz = texture2D(_ParamTex, u_xlat16_2.xy).xyz;
    u_xlat10_4.xyz = texture2D(_ParamTex, u_xlat16_2.zw).xyz;
    u_xlat16_2.x = (-u_xlat10_3.x) + 1.0;
    u_xlat16_7 = u_xlat10_3.y * 0.25 + 1.0;
    u_xlat5 = (-u_xlat16_2.x) * u_xlat16_7 + u_xlat10_5;
    u_xlat5 = u_xlat10_3.y * 0.25 + u_xlat5;
    u_xlatb10 = u_xlat0.x>=u_xlat5;
    u_xlat10 = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat15 = u_xlat10_3.y * 0.25 + (-u_xlat5);
    u_xlat5 = u_xlat5 * 32.0;
    u_xlat5 = u_xlat5 / u_xlat10_3.z;
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
    u_xlat0.x = u_xlat5 * u_xlat0.x;
    SV_Target0.w = u_xlat0.x * vs_COLOR0.w;
    u_xlat0.x = u_xlat15 * 16.0;
    u_xlat0.x = u_xlat0.x / u_xlat10_3.z;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x * u_xlat10;
    u_xlat16_2.xyz = u_xlat10_4.xyz * u_xlat0.xxx + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DISSOLVE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb3;
float u_xlat4;
vec2 u_xlat8;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_TEXCOORD0.xxyy * vec4(4096.0, 0.000244140625, 256.0, 0.00390625);
    u_xlatb1 = greaterThanEqual(u_xlat0.xxzz, (-u_xlat0.xxzz));
    u_xlat0.xy = floor(u_xlat0.yw);
    u_xlat1.x = (u_xlatb1.x) ? float(4096.0) : float(-4096.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat1.z = (u_xlatb1.z) ? float(256.0) : float(-256.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat8.xy = u_xlat1.yw * in_TEXCOORD0.xy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy * u_xlat1.xz;
    u_xlat1.xz = u_xlat8.yx * vec2(0.00392156886, 0.000244200259);
    u_xlat2.xyz = u_xlat0.xyy * vec3(4096.0, 256.0, 0.00390625);
    u_xlatb3 = greaterThanEqual(u_xlat2.xxyy, (-u_xlat2.xxyy));
    u_xlat8.x = floor(u_xlat2.z);
    u_xlat2.x = (u_xlatb3.x) ? float(4096.0) : float(-4096.0);
    u_xlat2.y = (u_xlatb3.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat2.z = (u_xlatb3.z) ? float(256.0) : float(-256.0);
    u_xlat2.w = (u_xlatb3.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.yw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.xz;
    u_xlat1.yw = u_xlat0.yx * vec2(0.00392156886, 0.000244200259);
    vs_TEXCOORD0.xy = u_xlat1.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.x = u_xlat8.x * 256.0;
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.xy = (bool(u_xlatb0)) ? vec2(256.0, 0.00390625) : vec2(-256.0, -0.00390625);
    u_xlat4 = u_xlat0.y * u_xlat8.x;
    u_xlat4 = fract(u_xlat4);
    u_xlat0.x = u_xlat4 * u_xlat0.x;
    u_xlat1.z = u_xlat0.x * 0.00392156886;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ParamTex;
uniform lowp sampler2D _TransitionTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
float u_xlat5;
lowp float u_xlat10_5;
mediump float u_xlat16_7;
float u_xlat10;
bool u_xlatb10;
float u_xlat15;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.zw * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_1 + _TextureSampleAdd;
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
    u_xlat10_5 = texture2D(_TransitionTex, vs_TEXCOORD2.xy).w;
    u_xlat16_2.x = float(0.25);
    u_xlat16_2.z = float(0.75);
    u_xlat16_2.yw = vs_TEXCOORD2.zz;
    u_xlat10_3.xyz = texture2D(_ParamTex, u_xlat16_2.xy).xyz;
    u_xlat10_4.xyz = texture2D(_ParamTex, u_xlat16_2.zw).xyz;
    u_xlat16_2.x = (-u_xlat10_3.x) + 1.0;
    u_xlat16_7 = u_xlat10_3.y * 0.25 + 1.0;
    u_xlat5 = (-u_xlat16_2.x) * u_xlat16_7 + u_xlat10_5;
    u_xlat5 = u_xlat10_3.y * 0.25 + u_xlat5;
    u_xlatb10 = u_xlat0.x>=u_xlat5;
    u_xlat10 = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat15 = u_xlat10_3.y * 0.25 + (-u_xlat5);
    u_xlat5 = u_xlat5 * 32.0;
    u_xlat5 = u_xlat5 / u_xlat10_3.z;
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
    u_xlat0.x = u_xlat5 * u_xlat0.x;
    SV_Target0.w = u_xlat0.x * vs_COLOR0.w;
    u_xlat0.x = u_xlat15 * 16.0;
    u_xlat0.x = u_xlat0.x / u_xlat10_3.z;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x * u_xlat10;
    u_xlat16_2.xyz = u_xlat10_4.xyz * u_xlat0.xxx + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DISSOLVE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb3;
float u_xlat4;
vec2 u_xlat8;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_TEXCOORD0.xxyy * vec4(4096.0, 0.000244140625, 256.0, 0.00390625);
    u_xlatb1 = greaterThanEqual(u_xlat0.xxzz, (-u_xlat0.xxzz));
    u_xlat0.xy = floor(u_xlat0.yw);
    u_xlat1.x = (u_xlatb1.x) ? float(4096.0) : float(-4096.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat1.z = (u_xlatb1.z) ? float(256.0) : float(-256.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat8.xy = u_xlat1.yw * in_TEXCOORD0.xy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy * u_xlat1.xz;
    u_xlat1.xz = u_xlat8.yx * vec2(0.00392156886, 0.000244200259);
    u_xlat2.xyz = u_xlat0.xyy * vec3(4096.0, 256.0, 0.00390625);
    u_xlatb3 = greaterThanEqual(u_xlat2.xxyy, (-u_xlat2.xxyy));
    u_xlat8.x = floor(u_xlat2.z);
    u_xlat2.x = (u_xlatb3.x) ? float(4096.0) : float(-4096.0);
    u_xlat2.y = (u_xlatb3.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat2.z = (u_xlatb3.z) ? float(256.0) : float(-256.0);
    u_xlat2.w = (u_xlatb3.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.yw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.xz;
    u_xlat1.yw = u_xlat0.yx * vec2(0.00392156886, 0.000244200259);
    vs_TEXCOORD0.xy = u_xlat1.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.x = u_xlat8.x * 256.0;
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.xy = (bool(u_xlatb0)) ? vec2(256.0, 0.00390625) : vec2(-256.0, -0.00390625);
    u_xlat4 = u_xlat0.y * u_xlat8.x;
    u_xlat4 = fract(u_xlat4);
    u_xlat0.x = u_xlat4 * u_xlat0.x;
    u_xlat1.z = u_xlat0.x * 0.00392156886;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ParamTex;
uniform lowp sampler2D _TransitionTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
float u_xlat5;
lowp float u_xlat10_5;
mediump float u_xlat16_7;
float u_xlat10;
bool u_xlatb10;
float u_xlat15;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.zw * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_1 + _TextureSampleAdd;
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
    u_xlat10_5 = texture2D(_TransitionTex, vs_TEXCOORD2.xy).w;
    u_xlat16_2.x = float(0.25);
    u_xlat16_2.z = float(0.75);
    u_xlat16_2.yw = vs_TEXCOORD2.zz;
    u_xlat10_3.xyz = texture2D(_ParamTex, u_xlat16_2.xy).xyz;
    u_xlat10_4.xyz = texture2D(_ParamTex, u_xlat16_2.zw).xyz;
    u_xlat16_2.x = (-u_xlat10_3.x) + 1.0;
    u_xlat16_7 = u_xlat10_3.y * 0.25 + 1.0;
    u_xlat5 = (-u_xlat16_2.x) * u_xlat16_7 + u_xlat10_5;
    u_xlat5 = u_xlat10_3.y * 0.25 + u_xlat5;
    u_xlatb10 = u_xlat0.x>=u_xlat5;
    u_xlat10 = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat15 = u_xlat10_3.y * 0.25 + (-u_xlat5);
    u_xlat5 = u_xlat5 * 32.0;
    u_xlat5 = u_xlat5 / u_xlat10_3.z;
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
    u_xlat0.x = u_xlat5 * u_xlat0.x;
    SV_Target0.w = u_xlat0.x * vs_COLOR0.w;
    u_xlat0.x = u_xlat15 * 16.0;
    u_xlat0.x = u_xlat0.x / u_xlat10_3.z;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x * u_xlat10;
    u_xlat16_2.xyz = u_xlat10_4.xyz * u_xlat0.xxx + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "UNITY_UI_ALPHACLIP" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb3;
float u_xlat4;
vec2 u_xlat8;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_TEXCOORD0.xxyy * vec4(4096.0, 0.000244140625, 256.0, 0.00390625);
    u_xlatb1 = greaterThanEqual(u_xlat0.xxzz, (-u_xlat0.xxzz));
    u_xlat0.xy = floor(u_xlat0.yw);
    u_xlat1.x = (u_xlatb1.x) ? float(4096.0) : float(-4096.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat1.z = (u_xlatb1.z) ? float(256.0) : float(-256.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat8.xy = u_xlat1.yw * in_TEXCOORD0.xy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy * u_xlat1.xz;
    u_xlat1.xz = u_xlat8.yx * vec2(0.00392156886, 0.000244200259);
    u_xlat2.xyz = u_xlat0.xyy * vec3(4096.0, 256.0, 0.00390625);
    u_xlatb3 = greaterThanEqual(u_xlat2.xxyy, (-u_xlat2.xxyy));
    u_xlat8.x = floor(u_xlat2.z);
    u_xlat2.x = (u_xlatb3.x) ? float(4096.0) : float(-4096.0);
    u_xlat2.y = (u_xlatb3.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat2.z = (u_xlatb3.z) ? float(256.0) : float(-256.0);
    u_xlat2.w = (u_xlatb3.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.yw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.xz;
    u_xlat1.yw = u_xlat0.yx * vec2(0.00392156886, 0.000244200259);
    vs_TEXCOORD0.xy = u_xlat1.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.x = u_xlat8.x * 256.0;
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.xy = (bool(u_xlatb0)) ? vec2(256.0, 0.00390625) : vec2(-256.0, -0.00390625);
    u_xlat4 = u_xlat0.y * u_xlat8.x;
    u_xlat4 = fract(u_xlat4);
    u_xlat0.x = u_xlat4 * u_xlat0.x;
    u_xlat1.z = u_xlat0.x * 0.00392156886;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
mediump float u_xlat16_2;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.zw * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_1 + _TextureSampleAdd;
    u_xlat1.w = u_xlat0.x * u_xlat1.w;
    u_xlat16_0 = u_xlat1 * vs_COLOR0;
    u_xlat16_2 = u_xlat1.w * vs_COLOR0.w + -0.00100000005;
    u_xlatb1 = u_xlat16_2<0.0;
    if(u_xlatb1){discard;}
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "UNITY_UI_ALPHACLIP" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb3;
float u_xlat4;
vec2 u_xlat8;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_TEXCOORD0.xxyy * vec4(4096.0, 0.000244140625, 256.0, 0.00390625);
    u_xlatb1 = greaterThanEqual(u_xlat0.xxzz, (-u_xlat0.xxzz));
    u_xlat0.xy = floor(u_xlat0.yw);
    u_xlat1.x = (u_xlatb1.x) ? float(4096.0) : float(-4096.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat1.z = (u_xlatb1.z) ? float(256.0) : float(-256.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat8.xy = u_xlat1.yw * in_TEXCOORD0.xy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy * u_xlat1.xz;
    u_xlat1.xz = u_xlat8.yx * vec2(0.00392156886, 0.000244200259);
    u_xlat2.xyz = u_xlat0.xyy * vec3(4096.0, 256.0, 0.00390625);
    u_xlatb3 = greaterThanEqual(u_xlat2.xxyy, (-u_xlat2.xxyy));
    u_xlat8.x = floor(u_xlat2.z);
    u_xlat2.x = (u_xlatb3.x) ? float(4096.0) : float(-4096.0);
    u_xlat2.y = (u_xlatb3.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat2.z = (u_xlatb3.z) ? float(256.0) : float(-256.0);
    u_xlat2.w = (u_xlatb3.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.yw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.xz;
    u_xlat1.yw = u_xlat0.yx * vec2(0.00392156886, 0.000244200259);
    vs_TEXCOORD0.xy = u_xlat1.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.x = u_xlat8.x * 256.0;
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.xy = (bool(u_xlatb0)) ? vec2(256.0, 0.00390625) : vec2(-256.0, -0.00390625);
    u_xlat4 = u_xlat0.y * u_xlat8.x;
    u_xlat4 = fract(u_xlat4);
    u_xlat0.x = u_xlat4 * u_xlat0.x;
    u_xlat1.z = u_xlat0.x * 0.00392156886;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
mediump float u_xlat16_2;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.zw * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_1 + _TextureSampleAdd;
    u_xlat1.w = u_xlat0.x * u_xlat1.w;
    u_xlat16_0 = u_xlat1 * vs_COLOR0;
    u_xlat16_2 = u_xlat1.w * vs_COLOR0.w + -0.00100000005;
    u_xlatb1 = u_xlat16_2<0.0;
    if(u_xlatb1){discard;}
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "UNITY_UI_ALPHACLIP" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb3;
float u_xlat4;
vec2 u_xlat8;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_TEXCOORD0.xxyy * vec4(4096.0, 0.000244140625, 256.0, 0.00390625);
    u_xlatb1 = greaterThanEqual(u_xlat0.xxzz, (-u_xlat0.xxzz));
    u_xlat0.xy = floor(u_xlat0.yw);
    u_xlat1.x = (u_xlatb1.x) ? float(4096.0) : float(-4096.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat1.z = (u_xlatb1.z) ? float(256.0) : float(-256.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat8.xy = u_xlat1.yw * in_TEXCOORD0.xy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy * u_xlat1.xz;
    u_xlat1.xz = u_xlat8.yx * vec2(0.00392156886, 0.000244200259);
    u_xlat2.xyz = u_xlat0.xyy * vec3(4096.0, 256.0, 0.00390625);
    u_xlatb3 = greaterThanEqual(u_xlat2.xxyy, (-u_xlat2.xxyy));
    u_xlat8.x = floor(u_xlat2.z);
    u_xlat2.x = (u_xlatb3.x) ? float(4096.0) : float(-4096.0);
    u_xlat2.y = (u_xlatb3.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat2.z = (u_xlatb3.z) ? float(256.0) : float(-256.0);
    u_xlat2.w = (u_xlatb3.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.yw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.xz;
    u_xlat1.yw = u_xlat0.yx * vec2(0.00392156886, 0.000244200259);
    vs_TEXCOORD0.xy = u_xlat1.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.x = u_xlat8.x * 256.0;
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.xy = (bool(u_xlatb0)) ? vec2(256.0, 0.00390625) : vec2(-256.0, -0.00390625);
    u_xlat4 = u_xlat0.y * u_xlat8.x;
    u_xlat4 = fract(u_xlat4);
    u_xlat0.x = u_xlat4 * u_xlat0.x;
    u_xlat1.z = u_xlat0.x * 0.00392156886;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
mediump float u_xlat16_2;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.zw * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_1 + _TextureSampleAdd;
    u_xlat1.w = u_xlat0.x * u_xlat1.w;
    u_xlat16_0 = u_xlat1 * vs_COLOR0;
    u_xlat16_2 = u_xlat1.w * vs_COLOR0.w + -0.00100000005;
    u_xlatb1 = u_xlat16_2<0.0;
    if(u_xlatb1){discard;}
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FADE" "UNITY_UI_ALPHACLIP" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb3;
float u_xlat4;
vec2 u_xlat8;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_TEXCOORD0.xxyy * vec4(4096.0, 0.000244140625, 256.0, 0.00390625);
    u_xlatb1 = greaterThanEqual(u_xlat0.xxzz, (-u_xlat0.xxzz));
    u_xlat0.xy = floor(u_xlat0.yw);
    u_xlat1.x = (u_xlatb1.x) ? float(4096.0) : float(-4096.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat1.z = (u_xlatb1.z) ? float(256.0) : float(-256.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat8.xy = u_xlat1.yw * in_TEXCOORD0.xy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy * u_xlat1.xz;
    u_xlat1.xz = u_xlat8.yx * vec2(0.00392156886, 0.000244200259);
    u_xlat2.xyz = u_xlat0.xyy * vec3(4096.0, 256.0, 0.00390625);
    u_xlatb3 = greaterThanEqual(u_xlat2.xxyy, (-u_xlat2.xxyy));
    u_xlat8.x = floor(u_xlat2.z);
    u_xlat2.x = (u_xlatb3.x) ? float(4096.0) : float(-4096.0);
    u_xlat2.y = (u_xlatb3.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat2.z = (u_xlatb3.z) ? float(256.0) : float(-256.0);
    u_xlat2.w = (u_xlatb3.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.yw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.xz;
    u_xlat1.yw = u_xlat0.yx * vec2(0.00392156886, 0.000244200259);
    vs_TEXCOORD0.xy = u_xlat1.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.x = u_xlat8.x * 256.0;
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.xy = (bool(u_xlatb0)) ? vec2(256.0, 0.00390625) : vec2(-256.0, -0.00390625);
    u_xlat4 = u_xlat0.y * u_xlat8.x;
    u_xlat4 = fract(u_xlat4);
    u_xlat0.x = u_xlat4 * u_xlat0.x;
    u_xlat1.z = u_xlat0.x * 0.00392156886;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ParamTex;
uniform lowp sampler2D _TransitionTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
float u_xlat1;
lowp float u_xlat10_1;
bool u_xlatb1;
vec2 u_xlat2;
bvec2 u_xlatb2;
mediump float u_xlat16_3;
vec2 u_xlat5;
bvec2 u_xlatb5;
void main()
{
    u_xlat16_0.x = 0.25;
    u_xlat16_0.y = vs_TEXCOORD2.z;
    u_xlat10_1 = texture2D(_ParamTex, u_xlat16_0.xy).x;
    u_xlat16_0.x = (-u_xlat10_1) + 1.0;
    u_xlat16_0.x = (-u_xlat16_0.x) * 2.0 + 1.0;
    u_xlat10_1 = texture2D(_TransitionTex, vs_TEXCOORD2.xy).w;
    u_xlat1 = u_xlat16_0.x + u_xlat10_1;
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlatb5.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlat5.x = u_xlatb5.x ? float(1.0) : 0.0;
    u_xlat5.y = u_xlatb5.y ? float(1.0) : 0.0;
;
    u_xlatb2.xy = greaterThanEqual(_ClipRect.zwzz, vs_TEXCOORD1.xyxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(1.0) : 0.0;
;
    u_xlat5.xy = u_xlat5.xy * u_xlat2.xy;
    u_xlat5.x = u_xlat5.y * u_xlat5.x;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_0 + _TextureSampleAdd;
    u_xlat5.x = u_xlat5.x * u_xlat0.w;
    u_xlat0.w = u_xlat1 * u_xlat5.x;
    u_xlat16_3 = u_xlat0.w * vs_COLOR0.w + -0.00100000005;
    u_xlat16_0 = u_xlat0 * vs_COLOR0;
    SV_Target0 = u_xlat16_0;
    u_xlatb1 = u_xlat16_3<0.0;
    if(u_xlatb1){discard;}
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FADE" "UNITY_UI_ALPHACLIP" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb3;
float u_xlat4;
vec2 u_xlat8;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_TEXCOORD0.xxyy * vec4(4096.0, 0.000244140625, 256.0, 0.00390625);
    u_xlatb1 = greaterThanEqual(u_xlat0.xxzz, (-u_xlat0.xxzz));
    u_xlat0.xy = floor(u_xlat0.yw);
    u_xlat1.x = (u_xlatb1.x) ? float(4096.0) : float(-4096.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat1.z = (u_xlatb1.z) ? float(256.0) : float(-256.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat8.xy = u_xlat1.yw * in_TEXCOORD0.xy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy * u_xlat1.xz;
    u_xlat1.xz = u_xlat8.yx * vec2(0.00392156886, 0.000244200259);
    u_xlat2.xyz = u_xlat0.xyy * vec3(4096.0, 256.0, 0.00390625);
    u_xlatb3 = greaterThanEqual(u_xlat2.xxyy, (-u_xlat2.xxyy));
    u_xlat8.x = floor(u_xlat2.z);
    u_xlat2.x = (u_xlatb3.x) ? float(4096.0) : float(-4096.0);
    u_xlat2.y = (u_xlatb3.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat2.z = (u_xlatb3.z) ? float(256.0) : float(-256.0);
    u_xlat2.w = (u_xlatb3.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.yw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.xz;
    u_xlat1.yw = u_xlat0.yx * vec2(0.00392156886, 0.000244200259);
    vs_TEXCOORD0.xy = u_xlat1.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.x = u_xlat8.x * 256.0;
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.xy = (bool(u_xlatb0)) ? vec2(256.0, 0.00390625) : vec2(-256.0, -0.00390625);
    u_xlat4 = u_xlat0.y * u_xlat8.x;
    u_xlat4 = fract(u_xlat4);
    u_xlat0.x = u_xlat4 * u_xlat0.x;
    u_xlat1.z = u_xlat0.x * 0.00392156886;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ParamTex;
uniform lowp sampler2D _TransitionTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
float u_xlat1;
lowp float u_xlat10_1;
bool u_xlatb1;
vec2 u_xlat2;
bvec2 u_xlatb2;
mediump float u_xlat16_3;
vec2 u_xlat5;
bvec2 u_xlatb5;
void main()
{
    u_xlat16_0.x = 0.25;
    u_xlat16_0.y = vs_TEXCOORD2.z;
    u_xlat10_1 = texture2D(_ParamTex, u_xlat16_0.xy).x;
    u_xlat16_0.x = (-u_xlat10_1) + 1.0;
    u_xlat16_0.x = (-u_xlat16_0.x) * 2.0 + 1.0;
    u_xlat10_1 = texture2D(_TransitionTex, vs_TEXCOORD2.xy).w;
    u_xlat1 = u_xlat16_0.x + u_xlat10_1;
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlatb5.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlat5.x = u_xlatb5.x ? float(1.0) : 0.0;
    u_xlat5.y = u_xlatb5.y ? float(1.0) : 0.0;
;
    u_xlatb2.xy = greaterThanEqual(_ClipRect.zwzz, vs_TEXCOORD1.xyxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(1.0) : 0.0;
;
    u_xlat5.xy = u_xlat5.xy * u_xlat2.xy;
    u_xlat5.x = u_xlat5.y * u_xlat5.x;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_0 + _TextureSampleAdd;
    u_xlat5.x = u_xlat5.x * u_xlat0.w;
    u_xlat0.w = u_xlat1 * u_xlat5.x;
    u_xlat16_3 = u_xlat0.w * vs_COLOR0.w + -0.00100000005;
    u_xlat16_0 = u_xlat0 * vs_COLOR0;
    SV_Target0 = u_xlat16_0;
    u_xlatb1 = u_xlat16_3<0.0;
    if(u_xlatb1){discard;}
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FADE" "UNITY_UI_ALPHACLIP" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb3;
float u_xlat4;
vec2 u_xlat8;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_TEXCOORD0.xxyy * vec4(4096.0, 0.000244140625, 256.0, 0.00390625);
    u_xlatb1 = greaterThanEqual(u_xlat0.xxzz, (-u_xlat0.xxzz));
    u_xlat0.xy = floor(u_xlat0.yw);
    u_xlat1.x = (u_xlatb1.x) ? float(4096.0) : float(-4096.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat1.z = (u_xlatb1.z) ? float(256.0) : float(-256.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat8.xy = u_xlat1.yw * in_TEXCOORD0.xy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy * u_xlat1.xz;
    u_xlat1.xz = u_xlat8.yx * vec2(0.00392156886, 0.000244200259);
    u_xlat2.xyz = u_xlat0.xyy * vec3(4096.0, 256.0, 0.00390625);
    u_xlatb3 = greaterThanEqual(u_xlat2.xxyy, (-u_xlat2.xxyy));
    u_xlat8.x = floor(u_xlat2.z);
    u_xlat2.x = (u_xlatb3.x) ? float(4096.0) : float(-4096.0);
    u_xlat2.y = (u_xlatb3.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat2.z = (u_xlatb3.z) ? float(256.0) : float(-256.0);
    u_xlat2.w = (u_xlatb3.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.yw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.xz;
    u_xlat1.yw = u_xlat0.yx * vec2(0.00392156886, 0.000244200259);
    vs_TEXCOORD0.xy = u_xlat1.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.x = u_xlat8.x * 256.0;
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.xy = (bool(u_xlatb0)) ? vec2(256.0, 0.00390625) : vec2(-256.0, -0.00390625);
    u_xlat4 = u_xlat0.y * u_xlat8.x;
    u_xlat4 = fract(u_xlat4);
    u_xlat0.x = u_xlat4 * u_xlat0.x;
    u_xlat1.z = u_xlat0.x * 0.00392156886;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ParamTex;
uniform lowp sampler2D _TransitionTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
float u_xlat1;
lowp float u_xlat10_1;
bool u_xlatb1;
vec2 u_xlat2;
bvec2 u_xlatb2;
mediump float u_xlat16_3;
vec2 u_xlat5;
bvec2 u_xlatb5;
void main()
{
    u_xlat16_0.x = 0.25;
    u_xlat16_0.y = vs_TEXCOORD2.z;
    u_xlat10_1 = texture2D(_ParamTex, u_xlat16_0.xy).x;
    u_xlat16_0.x = (-u_xlat10_1) + 1.0;
    u_xlat16_0.x = (-u_xlat16_0.x) * 2.0 + 1.0;
    u_xlat10_1 = texture2D(_TransitionTex, vs_TEXCOORD2.xy).w;
    u_xlat1 = u_xlat16_0.x + u_xlat10_1;
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlatb5.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlat5.x = u_xlatb5.x ? float(1.0) : 0.0;
    u_xlat5.y = u_xlatb5.y ? float(1.0) : 0.0;
;
    u_xlatb2.xy = greaterThanEqual(_ClipRect.zwzz, vs_TEXCOORD1.xyxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(1.0) : 0.0;
;
    u_xlat5.xy = u_xlat5.xy * u_xlat2.xy;
    u_xlat5.x = u_xlat5.y * u_xlat5.x;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_0 + _TextureSampleAdd;
    u_xlat5.x = u_xlat5.x * u_xlat0.w;
    u_xlat0.w = u_xlat1 * u_xlat5.x;
    u_xlat16_3 = u_xlat0.w * vs_COLOR0.w + -0.00100000005;
    u_xlat16_0 = u_xlat0 * vs_COLOR0;
    SV_Target0 = u_xlat16_0;
    u_xlatb1 = u_xlat16_3<0.0;
    if(u_xlatb1){discard;}
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "CUTOFF" "UNITY_UI_ALPHACLIP" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb3;
float u_xlat4;
vec2 u_xlat8;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_TEXCOORD0.xxyy * vec4(4096.0, 0.000244140625, 256.0, 0.00390625);
    u_xlatb1 = greaterThanEqual(u_xlat0.xxzz, (-u_xlat0.xxzz));
    u_xlat0.xy = floor(u_xlat0.yw);
    u_xlat1.x = (u_xlatb1.x) ? float(4096.0) : float(-4096.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat1.z = (u_xlatb1.z) ? float(256.0) : float(-256.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat8.xy = u_xlat1.yw * in_TEXCOORD0.xy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy * u_xlat1.xz;
    u_xlat1.xz = u_xlat8.yx * vec2(0.00392156886, 0.000244200259);
    u_xlat2.xyz = u_xlat0.xyy * vec3(4096.0, 256.0, 0.00390625);
    u_xlatb3 = greaterThanEqual(u_xlat2.xxyy, (-u_xlat2.xxyy));
    u_xlat8.x = floor(u_xlat2.z);
    u_xlat2.x = (u_xlatb3.x) ? float(4096.0) : float(-4096.0);
    u_xlat2.y = (u_xlatb3.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat2.z = (u_xlatb3.z) ? float(256.0) : float(-256.0);
    u_xlat2.w = (u_xlatb3.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.yw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.xz;
    u_xlat1.yw = u_xlat0.yx * vec2(0.00392156886, 0.000244200259);
    vs_TEXCOORD0.xy = u_xlat1.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.x = u_xlat8.x * 256.0;
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.xy = (bool(u_xlatb0)) ? vec2(256.0, 0.00390625) : vec2(-256.0, -0.00390625);
    u_xlat4 = u_xlat0.y * u_xlat8.x;
    u_xlat4 = fract(u_xlat4);
    u_xlat0.x = u_xlat4 * u_xlat0.x;
    u_xlat1.z = u_xlat0.x * 0.00392156886;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ParamTex;
uniform lowp sampler2D _TransitionTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp float u_xlat10_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
bool u_xlatb2;
float u_xlat4;
lowp float u_xlat10_4;
bool u_xlatb4;
void main()
{
    u_xlat16_0.x = 0.25;
    u_xlat16_0.y = vs_TEXCOORD2.z;
    u_xlat10_1 = texture2D(_ParamTex, u_xlat16_0.xy).x;
    u_xlat16_0.x = (-u_xlat10_1) + 1.0;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb1.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb1.w ? float(1.0) : 0.0;
;
    u_xlat1.xy = u_xlat1.zw * u_xlat1.xy;
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2 = u_xlat10_2 + _TextureSampleAdd;
    u_xlat1.x = u_xlat1.x * u_xlat2.w;
    u_xlat10_4 = texture2D(_TransitionTex, vs_TEXCOORD2.xy).w;
    u_xlat4 = u_xlat1.x * u_xlat10_4 + (-u_xlat16_0.x);
    u_xlatb4 = u_xlat4>=0.00100000005;
    u_xlat4 = u_xlatb4 ? 1.0 : float(0.0);
    u_xlat2.w = u_xlat4 * u_xlat1.x;
    u_xlat16_0.x = u_xlat2.w * vs_COLOR0.w + -0.00100000005;
    u_xlat16_1 = u_xlat2 * vs_COLOR0;
    SV_Target0 = u_xlat16_1;
    u_xlatb2 = u_xlat16_0.x<0.0;
    if(u_xlatb2){discard;}
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "CUTOFF" "UNITY_UI_ALPHACLIP" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb3;
float u_xlat4;
vec2 u_xlat8;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_TEXCOORD0.xxyy * vec4(4096.0, 0.000244140625, 256.0, 0.00390625);
    u_xlatb1 = greaterThanEqual(u_xlat0.xxzz, (-u_xlat0.xxzz));
    u_xlat0.xy = floor(u_xlat0.yw);
    u_xlat1.x = (u_xlatb1.x) ? float(4096.0) : float(-4096.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat1.z = (u_xlatb1.z) ? float(256.0) : float(-256.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat8.xy = u_xlat1.yw * in_TEXCOORD0.xy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy * u_xlat1.xz;
    u_xlat1.xz = u_xlat8.yx * vec2(0.00392156886, 0.000244200259);
    u_xlat2.xyz = u_xlat0.xyy * vec3(4096.0, 256.0, 0.00390625);
    u_xlatb3 = greaterThanEqual(u_xlat2.xxyy, (-u_xlat2.xxyy));
    u_xlat8.x = floor(u_xlat2.z);
    u_xlat2.x = (u_xlatb3.x) ? float(4096.0) : float(-4096.0);
    u_xlat2.y = (u_xlatb3.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat2.z = (u_xlatb3.z) ? float(256.0) : float(-256.0);
    u_xlat2.w = (u_xlatb3.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.yw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.xz;
    u_xlat1.yw = u_xlat0.yx * vec2(0.00392156886, 0.000244200259);
    vs_TEXCOORD0.xy = u_xlat1.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.x = u_xlat8.x * 256.0;
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.xy = (bool(u_xlatb0)) ? vec2(256.0, 0.00390625) : vec2(-256.0, -0.00390625);
    u_xlat4 = u_xlat0.y * u_xlat8.x;
    u_xlat4 = fract(u_xlat4);
    u_xlat0.x = u_xlat4 * u_xlat0.x;
    u_xlat1.z = u_xlat0.x * 0.00392156886;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ParamTex;
uniform lowp sampler2D _TransitionTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp float u_xlat10_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
bool u_xlatb2;
float u_xlat4;
lowp float u_xlat10_4;
bool u_xlatb4;
void main()
{
    u_xlat16_0.x = 0.25;
    u_xlat16_0.y = vs_TEXCOORD2.z;
    u_xlat10_1 = texture2D(_ParamTex, u_xlat16_0.xy).x;
    u_xlat16_0.x = (-u_xlat10_1) + 1.0;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb1.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb1.w ? float(1.0) : 0.0;
;
    u_xlat1.xy = u_xlat1.zw * u_xlat1.xy;
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2 = u_xlat10_2 + _TextureSampleAdd;
    u_xlat1.x = u_xlat1.x * u_xlat2.w;
    u_xlat10_4 = texture2D(_TransitionTex, vs_TEXCOORD2.xy).w;
    u_xlat4 = u_xlat1.x * u_xlat10_4 + (-u_xlat16_0.x);
    u_xlatb4 = u_xlat4>=0.00100000005;
    u_xlat4 = u_xlatb4 ? 1.0 : float(0.0);
    u_xlat2.w = u_xlat4 * u_xlat1.x;
    u_xlat16_0.x = u_xlat2.w * vs_COLOR0.w + -0.00100000005;
    u_xlat16_1 = u_xlat2 * vs_COLOR0;
    SV_Target0 = u_xlat16_1;
    u_xlatb2 = u_xlat16_0.x<0.0;
    if(u_xlatb2){discard;}
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "CUTOFF" "UNITY_UI_ALPHACLIP" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb3;
float u_xlat4;
vec2 u_xlat8;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_TEXCOORD0.xxyy * vec4(4096.0, 0.000244140625, 256.0, 0.00390625);
    u_xlatb1 = greaterThanEqual(u_xlat0.xxzz, (-u_xlat0.xxzz));
    u_xlat0.xy = floor(u_xlat0.yw);
    u_xlat1.x = (u_xlatb1.x) ? float(4096.0) : float(-4096.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat1.z = (u_xlatb1.z) ? float(256.0) : float(-256.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat8.xy = u_xlat1.yw * in_TEXCOORD0.xy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy * u_xlat1.xz;
    u_xlat1.xz = u_xlat8.yx * vec2(0.00392156886, 0.000244200259);
    u_xlat2.xyz = u_xlat0.xyy * vec3(4096.0, 256.0, 0.00390625);
    u_xlatb3 = greaterThanEqual(u_xlat2.xxyy, (-u_xlat2.xxyy));
    u_xlat8.x = floor(u_xlat2.z);
    u_xlat2.x = (u_xlatb3.x) ? float(4096.0) : float(-4096.0);
    u_xlat2.y = (u_xlatb3.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat2.z = (u_xlatb3.z) ? float(256.0) : float(-256.0);
    u_xlat2.w = (u_xlatb3.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.yw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.xz;
    u_xlat1.yw = u_xlat0.yx * vec2(0.00392156886, 0.000244200259);
    vs_TEXCOORD0.xy = u_xlat1.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.x = u_xlat8.x * 256.0;
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.xy = (bool(u_xlatb0)) ? vec2(256.0, 0.00390625) : vec2(-256.0, -0.00390625);
    u_xlat4 = u_xlat0.y * u_xlat8.x;
    u_xlat4 = fract(u_xlat4);
    u_xlat0.x = u_xlat4 * u_xlat0.x;
    u_xlat1.z = u_xlat0.x * 0.00392156886;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ParamTex;
uniform lowp sampler2D _TransitionTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp float u_xlat10_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
bool u_xlatb2;
float u_xlat4;
lowp float u_xlat10_4;
bool u_xlatb4;
void main()
{
    u_xlat16_0.x = 0.25;
    u_xlat16_0.y = vs_TEXCOORD2.z;
    u_xlat10_1 = texture2D(_ParamTex, u_xlat16_0.xy).x;
    u_xlat16_0.x = (-u_xlat10_1) + 1.0;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb1.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb1.w ? float(1.0) : 0.0;
;
    u_xlat1.xy = u_xlat1.zw * u_xlat1.xy;
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2 = u_xlat10_2 + _TextureSampleAdd;
    u_xlat1.x = u_xlat1.x * u_xlat2.w;
    u_xlat10_4 = texture2D(_TransitionTex, vs_TEXCOORD2.xy).w;
    u_xlat4 = u_xlat1.x * u_xlat10_4 + (-u_xlat16_0.x);
    u_xlatb4 = u_xlat4>=0.00100000005;
    u_xlat4 = u_xlatb4 ? 1.0 : float(0.0);
    u_xlat2.w = u_xlat4 * u_xlat1.x;
    u_xlat16_0.x = u_xlat2.w * vs_COLOR0.w + -0.00100000005;
    u_xlat16_1 = u_xlat2 * vs_COLOR0;
    SV_Target0 = u_xlat16_1;
    u_xlatb2 = u_xlat16_0.x<0.0;
    if(u_xlatb2){discard;}
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DISSOLVE" "UNITY_UI_ALPHACLIP" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb3;
float u_xlat4;
vec2 u_xlat8;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_TEXCOORD0.xxyy * vec4(4096.0, 0.000244140625, 256.0, 0.00390625);
    u_xlatb1 = greaterThanEqual(u_xlat0.xxzz, (-u_xlat0.xxzz));
    u_xlat0.xy = floor(u_xlat0.yw);
    u_xlat1.x = (u_xlatb1.x) ? float(4096.0) : float(-4096.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat1.z = (u_xlatb1.z) ? float(256.0) : float(-256.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat8.xy = u_xlat1.yw * in_TEXCOORD0.xy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy * u_xlat1.xz;
    u_xlat1.xz = u_xlat8.yx * vec2(0.00392156886, 0.000244200259);
    u_xlat2.xyz = u_xlat0.xyy * vec3(4096.0, 256.0, 0.00390625);
    u_xlatb3 = greaterThanEqual(u_xlat2.xxyy, (-u_xlat2.xxyy));
    u_xlat8.x = floor(u_xlat2.z);
    u_xlat2.x = (u_xlatb3.x) ? float(4096.0) : float(-4096.0);
    u_xlat2.y = (u_xlatb3.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat2.z = (u_xlatb3.z) ? float(256.0) : float(-256.0);
    u_xlat2.w = (u_xlatb3.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.yw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.xz;
    u_xlat1.yw = u_xlat0.yx * vec2(0.00392156886, 0.000244200259);
    vs_TEXCOORD0.xy = u_xlat1.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.x = u_xlat8.x * 256.0;
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.xy = (bool(u_xlatb0)) ? vec2(256.0, 0.00390625) : vec2(-256.0, -0.00390625);
    u_xlat4 = u_xlat0.y * u_xlat8.x;
    u_xlat4 = fract(u_xlat4);
    u_xlat0.x = u_xlat4 * u_xlat0.x;
    u_xlat1.z = u_xlat0.x * 0.00392156886;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ParamTex;
uniform lowp sampler2D _TransitionTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
float u_xlat5;
lowp float u_xlat10_5;
mediump float u_xlat16_7;
float u_xlat10;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.zw * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_1 + _TextureSampleAdd;
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
    u_xlat10_5 = texture2D(_TransitionTex, vs_TEXCOORD2.xy).w;
    u_xlat16_2.x = float(0.25);
    u_xlat16_2.z = float(0.75);
    u_xlat16_2.yw = vs_TEXCOORD2.zz;
    u_xlat10_3.xyz = texture2D(_ParamTex, u_xlat16_2.xy).xyz;
    u_xlat10_4.xyz = texture2D(_ParamTex, u_xlat16_2.zw).xyz;
    u_xlat16_2.x = (-u_xlat10_3.x) + 1.0;
    u_xlat16_7 = u_xlat10_3.y * 0.25 + 1.0;
    u_xlat5 = (-u_xlat16_2.x) * u_xlat16_7 + u_xlat10_5;
    u_xlat5 = u_xlat10_3.y * 0.25 + u_xlat5;
    u_xlat10 = u_xlat5 * 32.0;
    u_xlat10 = u_xlat10 / u_xlat10_3.z;
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
    u_xlat10 = u_xlat10 * u_xlat0.x;
    u_xlatb0.x = u_xlat0.x>=u_xlat5;
    u_xlat5 = u_xlat10_3.y * 0.25 + (-u_xlat5);
    u_xlat5 = u_xlat5 * 16.0;
    u_xlat5 = u_xlat5 / u_xlat10_3.z;
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
    u_xlat0.x = u_xlatb0.x ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat5 * u_xlat0.x;
    u_xlat16_2.xyz = u_xlat10_4.xyz * u_xlat0.xxx + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlat16_2.x = u_xlat10 * vs_COLOR0.w + -0.00100000005;
    u_xlat16_7 = u_xlat10 * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_7;
    u_xlatb0.x = u_xlat16_2.x<0.0;
    if(u_xlatb0.x){discard;}
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DISSOLVE" "UNITY_UI_ALPHACLIP" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb3;
float u_xlat4;
vec2 u_xlat8;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_TEXCOORD0.xxyy * vec4(4096.0, 0.000244140625, 256.0, 0.00390625);
    u_xlatb1 = greaterThanEqual(u_xlat0.xxzz, (-u_xlat0.xxzz));
    u_xlat0.xy = floor(u_xlat0.yw);
    u_xlat1.x = (u_xlatb1.x) ? float(4096.0) : float(-4096.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat1.z = (u_xlatb1.z) ? float(256.0) : float(-256.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat8.xy = u_xlat1.yw * in_TEXCOORD0.xy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy * u_xlat1.xz;
    u_xlat1.xz = u_xlat8.yx * vec2(0.00392156886, 0.000244200259);
    u_xlat2.xyz = u_xlat0.xyy * vec3(4096.0, 256.0, 0.00390625);
    u_xlatb3 = greaterThanEqual(u_xlat2.xxyy, (-u_xlat2.xxyy));
    u_xlat8.x = floor(u_xlat2.z);
    u_xlat2.x = (u_xlatb3.x) ? float(4096.0) : float(-4096.0);
    u_xlat2.y = (u_xlatb3.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat2.z = (u_xlatb3.z) ? float(256.0) : float(-256.0);
    u_xlat2.w = (u_xlatb3.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.yw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.xz;
    u_xlat1.yw = u_xlat0.yx * vec2(0.00392156886, 0.000244200259);
    vs_TEXCOORD0.xy = u_xlat1.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.x = u_xlat8.x * 256.0;
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.xy = (bool(u_xlatb0)) ? vec2(256.0, 0.00390625) : vec2(-256.0, -0.00390625);
    u_xlat4 = u_xlat0.y * u_xlat8.x;
    u_xlat4 = fract(u_xlat4);
    u_xlat0.x = u_xlat4 * u_xlat0.x;
    u_xlat1.z = u_xlat0.x * 0.00392156886;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ParamTex;
uniform lowp sampler2D _TransitionTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
float u_xlat5;
lowp float u_xlat10_5;
mediump float u_xlat16_7;
float u_xlat10;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.zw * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_1 + _TextureSampleAdd;
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
    u_xlat10_5 = texture2D(_TransitionTex, vs_TEXCOORD2.xy).w;
    u_xlat16_2.x = float(0.25);
    u_xlat16_2.z = float(0.75);
    u_xlat16_2.yw = vs_TEXCOORD2.zz;
    u_xlat10_3.xyz = texture2D(_ParamTex, u_xlat16_2.xy).xyz;
    u_xlat10_4.xyz = texture2D(_ParamTex, u_xlat16_2.zw).xyz;
    u_xlat16_2.x = (-u_xlat10_3.x) + 1.0;
    u_xlat16_7 = u_xlat10_3.y * 0.25 + 1.0;
    u_xlat5 = (-u_xlat16_2.x) * u_xlat16_7 + u_xlat10_5;
    u_xlat5 = u_xlat10_3.y * 0.25 + u_xlat5;
    u_xlat10 = u_xlat5 * 32.0;
    u_xlat10 = u_xlat10 / u_xlat10_3.z;
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
    u_xlat10 = u_xlat10 * u_xlat0.x;
    u_xlatb0.x = u_xlat0.x>=u_xlat5;
    u_xlat5 = u_xlat10_3.y * 0.25 + (-u_xlat5);
    u_xlat5 = u_xlat5 * 16.0;
    u_xlat5 = u_xlat5 / u_xlat10_3.z;
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
    u_xlat0.x = u_xlatb0.x ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat5 * u_xlat0.x;
    u_xlat16_2.xyz = u_xlat10_4.xyz * u_xlat0.xxx + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlat16_2.x = u_xlat10 * vs_COLOR0.w + -0.00100000005;
    u_xlat16_7 = u_xlat10 * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_7;
    u_xlatb0.x = u_xlat16_2.x<0.0;
    if(u_xlatb0.x){discard;}
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DISSOLVE" "UNITY_UI_ALPHACLIP" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb3;
float u_xlat4;
vec2 u_xlat8;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_TEXCOORD0.xxyy * vec4(4096.0, 0.000244140625, 256.0, 0.00390625);
    u_xlatb1 = greaterThanEqual(u_xlat0.xxzz, (-u_xlat0.xxzz));
    u_xlat0.xy = floor(u_xlat0.yw);
    u_xlat1.x = (u_xlatb1.x) ? float(4096.0) : float(-4096.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat1.z = (u_xlatb1.z) ? float(256.0) : float(-256.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat8.xy = u_xlat1.yw * in_TEXCOORD0.xy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy * u_xlat1.xz;
    u_xlat1.xz = u_xlat8.yx * vec2(0.00392156886, 0.000244200259);
    u_xlat2.xyz = u_xlat0.xyy * vec3(4096.0, 256.0, 0.00390625);
    u_xlatb3 = greaterThanEqual(u_xlat2.xxyy, (-u_xlat2.xxyy));
    u_xlat8.x = floor(u_xlat2.z);
    u_xlat2.x = (u_xlatb3.x) ? float(4096.0) : float(-4096.0);
    u_xlat2.y = (u_xlatb3.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat2.z = (u_xlatb3.z) ? float(256.0) : float(-256.0);
    u_xlat2.w = (u_xlatb3.w) ? float(0.00390625) : float(-0.00390625);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.yw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.xz;
    u_xlat1.yw = u_xlat0.yx * vec2(0.00392156886, 0.000244200259);
    vs_TEXCOORD0.xy = u_xlat1.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.x = u_xlat8.x * 256.0;
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.xy = (bool(u_xlatb0)) ? vec2(256.0, 0.00390625) : vec2(-256.0, -0.00390625);
    u_xlat4 = u_xlat0.y * u_xlat8.x;
    u_xlat4 = fract(u_xlat4);
    u_xlat0.x = u_xlat4 * u_xlat0.x;
    u_xlat1.z = u_xlat0.x * 0.00392156886;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ParamTex;
uniform lowp sampler2D _TransitionTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
float u_xlat5;
lowp float u_xlat10_5;
mediump float u_xlat16_7;
float u_xlat10;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.zw * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_1 + _TextureSampleAdd;
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
    u_xlat10_5 = texture2D(_TransitionTex, vs_TEXCOORD2.xy).w;
    u_xlat16_2.x = float(0.25);
    u_xlat16_2.z = float(0.75);
    u_xlat16_2.yw = vs_TEXCOORD2.zz;
    u_xlat10_3.xyz = texture2D(_ParamTex, u_xlat16_2.xy).xyz;
    u_xlat10_4.xyz = texture2D(_ParamTex, u_xlat16_2.zw).xyz;
    u_xlat16_2.x = (-u_xlat10_3.x) + 1.0;
    u_xlat16_7 = u_xlat10_3.y * 0.25 + 1.0;
    u_xlat5 = (-u_xlat16_2.x) * u_xlat16_7 + u_xlat10_5;
    u_xlat5 = u_xlat10_3.y * 0.25 + u_xlat5;
    u_xlat10 = u_xlat5 * 32.0;
    u_xlat10 = u_xlat10 / u_xlat10_3.z;
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
    u_xlat10 = u_xlat10 * u_xlat0.x;
    u_xlatb0.x = u_xlat0.x>=u_xlat5;
    u_xlat5 = u_xlat10_3.y * 0.25 + (-u_xlat5);
    u_xlat5 = u_xlat5 * 16.0;
    u_xlat5 = u_xlat5 / u_xlat10_3.z;
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
    u_xlat0.x = u_xlatb0.x ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat5 * u_xlat0.x;
    u_xlat16_2.xyz = u_xlat10_4.xyz * u_xlat0.xxx + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlat16_2.x = u_xlat10 * vs_COLOR0.w + -0.00100000005;
    u_xlat16_7 = u_xlat10 * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_7;
    u_xlatb0.x = u_xlat16_2.x<0.0;
    if(u_xlatb0.x){discard;}
    return;
}

#endif
"
}
}
}
}
}