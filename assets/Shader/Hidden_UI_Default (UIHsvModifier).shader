//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/UI/Default (UIHsvModifier)" {
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
_ParamTex ("Parameter Texture", 2D) = "white" { }
}
SubShader {
 Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
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
  GpuProgramID 44443
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
varying mediump float vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat2;
float u_xlat6;
bool u_xlatb6;
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
    u_xlat0.xy = in_TEXCOORD0.xx * vec2(4096.0, 0.000244140625);
    u_xlat2 = floor(u_xlat0.y);
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.xz = (bool(u_xlatb0)) ? vec2(4096.0, 0.000244140625) : vec2(-4096.0, -0.000244140625);
    u_xlat6 = u_xlat2 * 4096.0;
    u_xlatb6 = u_xlat6>=(-u_xlat6);
    u_xlat1.xy = (bool(u_xlatb6)) ? vec2(4096.0, 0.000244140625) : vec2(-4096.0, -0.000244140625);
    u_xlat2 = u_xlat2 * u_xlat1.y;
    u_xlat2 = fract(u_xlat2);
    u_xlat2 = u_xlat2 * u_xlat1.x;
    u_xlat1.y = u_xlat2 * 0.000244200259;
    u_xlat2 = u_xlat0.z * in_TEXCOORD0.x;
    u_xlat2 = fract(u_xlat2);
    u_xlat0.x = u_xlat2 * u_xlat0.x;
    u_xlat1.x = u_xlat0.x * 0.000244200259;
    vs_TEXCOORD0.xy = u_xlat1.xy;
    vs_TEXCOORD2 = in_TEXCOORD0.y;
    vs_TEXCOORD1 = in_POSITION0;
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
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp vec4 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
bvec2 u_xlatb7;
bool u_xlatb8;
mediump vec2 u_xlat16_10;
mediump float u_xlat16_11;
mediump vec2 u_xlat16_13;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlatb1 = u_xlat10_0.y>=u_xlat10_0.z;
    u_xlat16_2.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_10.xy = (-u_xlat10_0.zy) + u_xlat10_0.yz;
    u_xlat16_1.xy = u_xlat16_2.xx * u_xlat16_10.xy + u_xlat10_0.zy;
    u_xlat16_10.x = float(1.0);
    u_xlat16_10.y = float(-1.0);
    u_xlat16_1.zw = u_xlat16_2.xx * u_xlat16_10.xy + vec2(-1.0, 0.666666687);
    u_xlat16_2.xyz = (-u_xlat16_1.xyw);
    u_xlat16_2.w = (-u_xlat10_0.x);
    u_xlat16_3.yzw = u_xlat16_1.yzx + u_xlat16_2.yzw;
    u_xlat16_3.x = u_xlat10_0.x + u_xlat16_2.x;
    u_xlatb8 = u_xlat10_0.x>=u_xlat16_1.x;
    u_xlat16_2.x = (u_xlatb8) ? 1.0 : 0.0;
    u_xlat16_10.x = u_xlat16_2.x * u_xlat16_3.w + u_xlat10_0.x;
    u_xlat16_2.xzw = u_xlat16_2.xxx * u_xlat16_3.yzx + u_xlat16_1.ywx;
    u_xlat16_3.x = min(u_xlat16_2.x, u_xlat16_10.x);
    u_xlat16_10.x = (-u_xlat16_2.x) + u_xlat16_10.x;
    u_xlat16_3.x = u_xlat16_2.w + (-u_xlat16_3.x);
    u_xlat16_11 = u_xlat16_3.x * 6.0 + 1.00000001e-10;
    u_xlat16_10.x = u_xlat16_10.x / u_xlat16_11;
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_2.z;
    u_xlat16_2.x = abs(u_xlat16_10.x);
    u_xlat16_10.x = u_xlat16_2.w + 1.00000001e-10;
    u_xlat16_2.z = u_xlat16_3.x / u_xlat16_10.x;
    u_xlat16_1.x = float(0.25);
    u_xlat16_1.z = float(0.75);
    u_xlat16_1.yw = vec2(vs_TEXCOORD2);
    u_xlat10_3 = texture2D(_ParamTex, u_xlat16_1.xy);
    u_xlat10_0.xyz = texture2D(_ParamTex, u_xlat16_1.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_0.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat16_5.xyz = u_xlat16_2.xzw + (-u_xlat10_3.xyz);
    u_xlat16_6.xyz = -abs(u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = min(abs(u_xlat16_5.xyz), u_xlat16_6.xyz);
    u_xlat16_13.xy = u_xlat16_5.yz * vec2(0.100000001, 0.100000001);
    u_xlat16_10.x = max(u_xlat16_13.x, u_xlat16_5.x);
    u_xlat16_10.x = max(u_xlat16_13.y, u_xlat16_10.x);
    u_xlatb0.x = u_xlat10_3.w>=u_xlat16_10.x;
    u_xlat16_10.x = (u_xlatb0.x) ? 1.0 : 0.0;
    u_xlat16_2.xyz = u_xlat16_4.yzx * u_xlat16_10.xxx + u_xlat16_2.zwx;
    u_xlat16_4.xyz = u_xlat16_2.zzz + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_2.xy = u_xlat16_2.xy;
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
    u_xlat16_4.xyz = fract(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_4.xyz = abs(u_xlat16_4.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xzw = u_xlat16_2.xxx * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_2.yyy * u_xlat16_2.xzw + _TextureSampleAdd.xyz;
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
;
    u_xlatb7.xy = greaterThanEqual(_ClipRect.zwzz, vs_TEXCOORD1.xyxx).xy;
    u_xlat7.x = u_xlatb7.x ? float(1.0) : 0.0;
    u_xlat7.y = u_xlatb7.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.xy * u_xlat7.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat16_1.w = u_xlat10_0.w * u_xlat0.x + _TextureSampleAdd.w;
    SV_Target0 = u_xlat16_1 * vs_COLOR0;
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
varying mediump float vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat2;
float u_xlat6;
bool u_xlatb6;
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
    u_xlat0.xy = in_TEXCOORD0.xx * vec2(4096.0, 0.000244140625);
    u_xlat2 = floor(u_xlat0.y);
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.xz = (bool(u_xlatb0)) ? vec2(4096.0, 0.000244140625) : vec2(-4096.0, -0.000244140625);
    u_xlat6 = u_xlat2 * 4096.0;
    u_xlatb6 = u_xlat6>=(-u_xlat6);
    u_xlat1.xy = (bool(u_xlatb6)) ? vec2(4096.0, 0.000244140625) : vec2(-4096.0, -0.000244140625);
    u_xlat2 = u_xlat2 * u_xlat1.y;
    u_xlat2 = fract(u_xlat2);
    u_xlat2 = u_xlat2 * u_xlat1.x;
    u_xlat1.y = u_xlat2 * 0.000244200259;
    u_xlat2 = u_xlat0.z * in_TEXCOORD0.x;
    u_xlat2 = fract(u_xlat2);
    u_xlat0.x = u_xlat2 * u_xlat0.x;
    u_xlat1.x = u_xlat0.x * 0.000244200259;
    vs_TEXCOORD0.xy = u_xlat1.xy;
    vs_TEXCOORD2 = in_TEXCOORD0.y;
    vs_TEXCOORD1 = in_POSITION0;
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
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp vec4 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
bvec2 u_xlatb7;
bool u_xlatb8;
mediump vec2 u_xlat16_10;
mediump float u_xlat16_11;
mediump vec2 u_xlat16_13;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlatb1 = u_xlat10_0.y>=u_xlat10_0.z;
    u_xlat16_2.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_10.xy = (-u_xlat10_0.zy) + u_xlat10_0.yz;
    u_xlat16_1.xy = u_xlat16_2.xx * u_xlat16_10.xy + u_xlat10_0.zy;
    u_xlat16_10.x = float(1.0);
    u_xlat16_10.y = float(-1.0);
    u_xlat16_1.zw = u_xlat16_2.xx * u_xlat16_10.xy + vec2(-1.0, 0.666666687);
    u_xlat16_2.xyz = (-u_xlat16_1.xyw);
    u_xlat16_2.w = (-u_xlat10_0.x);
    u_xlat16_3.yzw = u_xlat16_1.yzx + u_xlat16_2.yzw;
    u_xlat16_3.x = u_xlat10_0.x + u_xlat16_2.x;
    u_xlatb8 = u_xlat10_0.x>=u_xlat16_1.x;
    u_xlat16_2.x = (u_xlatb8) ? 1.0 : 0.0;
    u_xlat16_10.x = u_xlat16_2.x * u_xlat16_3.w + u_xlat10_0.x;
    u_xlat16_2.xzw = u_xlat16_2.xxx * u_xlat16_3.yzx + u_xlat16_1.ywx;
    u_xlat16_3.x = min(u_xlat16_2.x, u_xlat16_10.x);
    u_xlat16_10.x = (-u_xlat16_2.x) + u_xlat16_10.x;
    u_xlat16_3.x = u_xlat16_2.w + (-u_xlat16_3.x);
    u_xlat16_11 = u_xlat16_3.x * 6.0 + 1.00000001e-10;
    u_xlat16_10.x = u_xlat16_10.x / u_xlat16_11;
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_2.z;
    u_xlat16_2.x = abs(u_xlat16_10.x);
    u_xlat16_10.x = u_xlat16_2.w + 1.00000001e-10;
    u_xlat16_2.z = u_xlat16_3.x / u_xlat16_10.x;
    u_xlat16_1.x = float(0.25);
    u_xlat16_1.z = float(0.75);
    u_xlat16_1.yw = vec2(vs_TEXCOORD2);
    u_xlat10_3 = texture2D(_ParamTex, u_xlat16_1.xy);
    u_xlat10_0.xyz = texture2D(_ParamTex, u_xlat16_1.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_0.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat16_5.xyz = u_xlat16_2.xzw + (-u_xlat10_3.xyz);
    u_xlat16_6.xyz = -abs(u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = min(abs(u_xlat16_5.xyz), u_xlat16_6.xyz);
    u_xlat16_13.xy = u_xlat16_5.yz * vec2(0.100000001, 0.100000001);
    u_xlat16_10.x = max(u_xlat16_13.x, u_xlat16_5.x);
    u_xlat16_10.x = max(u_xlat16_13.y, u_xlat16_10.x);
    u_xlatb0.x = u_xlat10_3.w>=u_xlat16_10.x;
    u_xlat16_10.x = (u_xlatb0.x) ? 1.0 : 0.0;
    u_xlat16_2.xyz = u_xlat16_4.yzx * u_xlat16_10.xxx + u_xlat16_2.zwx;
    u_xlat16_4.xyz = u_xlat16_2.zzz + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_2.xy = u_xlat16_2.xy;
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
    u_xlat16_4.xyz = fract(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_4.xyz = abs(u_xlat16_4.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xzw = u_xlat16_2.xxx * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_2.yyy * u_xlat16_2.xzw + _TextureSampleAdd.xyz;
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
;
    u_xlatb7.xy = greaterThanEqual(_ClipRect.zwzz, vs_TEXCOORD1.xyxx).xy;
    u_xlat7.x = u_xlatb7.x ? float(1.0) : 0.0;
    u_xlat7.y = u_xlatb7.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.xy * u_xlat7.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat16_1.w = u_xlat10_0.w * u_xlat0.x + _TextureSampleAdd.w;
    SV_Target0 = u_xlat16_1 * vs_COLOR0;
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
varying mediump float vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat2;
float u_xlat6;
bool u_xlatb6;
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
    u_xlat0.xy = in_TEXCOORD0.xx * vec2(4096.0, 0.000244140625);
    u_xlat2 = floor(u_xlat0.y);
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.xz = (bool(u_xlatb0)) ? vec2(4096.0, 0.000244140625) : vec2(-4096.0, -0.000244140625);
    u_xlat6 = u_xlat2 * 4096.0;
    u_xlatb6 = u_xlat6>=(-u_xlat6);
    u_xlat1.xy = (bool(u_xlatb6)) ? vec2(4096.0, 0.000244140625) : vec2(-4096.0, -0.000244140625);
    u_xlat2 = u_xlat2 * u_xlat1.y;
    u_xlat2 = fract(u_xlat2);
    u_xlat2 = u_xlat2 * u_xlat1.x;
    u_xlat1.y = u_xlat2 * 0.000244200259;
    u_xlat2 = u_xlat0.z * in_TEXCOORD0.x;
    u_xlat2 = fract(u_xlat2);
    u_xlat0.x = u_xlat2 * u_xlat0.x;
    u_xlat1.x = u_xlat0.x * 0.000244200259;
    vs_TEXCOORD0.xy = u_xlat1.xy;
    vs_TEXCOORD2 = in_TEXCOORD0.y;
    vs_TEXCOORD1 = in_POSITION0;
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
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp vec4 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
bvec2 u_xlatb7;
bool u_xlatb8;
mediump vec2 u_xlat16_10;
mediump float u_xlat16_11;
mediump vec2 u_xlat16_13;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlatb1 = u_xlat10_0.y>=u_xlat10_0.z;
    u_xlat16_2.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_10.xy = (-u_xlat10_0.zy) + u_xlat10_0.yz;
    u_xlat16_1.xy = u_xlat16_2.xx * u_xlat16_10.xy + u_xlat10_0.zy;
    u_xlat16_10.x = float(1.0);
    u_xlat16_10.y = float(-1.0);
    u_xlat16_1.zw = u_xlat16_2.xx * u_xlat16_10.xy + vec2(-1.0, 0.666666687);
    u_xlat16_2.xyz = (-u_xlat16_1.xyw);
    u_xlat16_2.w = (-u_xlat10_0.x);
    u_xlat16_3.yzw = u_xlat16_1.yzx + u_xlat16_2.yzw;
    u_xlat16_3.x = u_xlat10_0.x + u_xlat16_2.x;
    u_xlatb8 = u_xlat10_0.x>=u_xlat16_1.x;
    u_xlat16_2.x = (u_xlatb8) ? 1.0 : 0.0;
    u_xlat16_10.x = u_xlat16_2.x * u_xlat16_3.w + u_xlat10_0.x;
    u_xlat16_2.xzw = u_xlat16_2.xxx * u_xlat16_3.yzx + u_xlat16_1.ywx;
    u_xlat16_3.x = min(u_xlat16_2.x, u_xlat16_10.x);
    u_xlat16_10.x = (-u_xlat16_2.x) + u_xlat16_10.x;
    u_xlat16_3.x = u_xlat16_2.w + (-u_xlat16_3.x);
    u_xlat16_11 = u_xlat16_3.x * 6.0 + 1.00000001e-10;
    u_xlat16_10.x = u_xlat16_10.x / u_xlat16_11;
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_2.z;
    u_xlat16_2.x = abs(u_xlat16_10.x);
    u_xlat16_10.x = u_xlat16_2.w + 1.00000001e-10;
    u_xlat16_2.z = u_xlat16_3.x / u_xlat16_10.x;
    u_xlat16_1.x = float(0.25);
    u_xlat16_1.z = float(0.75);
    u_xlat16_1.yw = vec2(vs_TEXCOORD2);
    u_xlat10_3 = texture2D(_ParamTex, u_xlat16_1.xy);
    u_xlat10_0.xyz = texture2D(_ParamTex, u_xlat16_1.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_0.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat16_5.xyz = u_xlat16_2.xzw + (-u_xlat10_3.xyz);
    u_xlat16_6.xyz = -abs(u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = min(abs(u_xlat16_5.xyz), u_xlat16_6.xyz);
    u_xlat16_13.xy = u_xlat16_5.yz * vec2(0.100000001, 0.100000001);
    u_xlat16_10.x = max(u_xlat16_13.x, u_xlat16_5.x);
    u_xlat16_10.x = max(u_xlat16_13.y, u_xlat16_10.x);
    u_xlatb0.x = u_xlat10_3.w>=u_xlat16_10.x;
    u_xlat16_10.x = (u_xlatb0.x) ? 1.0 : 0.0;
    u_xlat16_2.xyz = u_xlat16_4.yzx * u_xlat16_10.xxx + u_xlat16_2.zwx;
    u_xlat16_4.xyz = u_xlat16_2.zzz + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_2.xy = u_xlat16_2.xy;
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
    u_xlat16_4.xyz = fract(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_4.xyz = abs(u_xlat16_4.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xzw = u_xlat16_2.xxx * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_2.yyy * u_xlat16_2.xzw + _TextureSampleAdd.xyz;
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
;
    u_xlatb7.xy = greaterThanEqual(_ClipRect.zwzz, vs_TEXCOORD1.xyxx).xy;
    u_xlat7.x = u_xlatb7.x ? float(1.0) : 0.0;
    u_xlat7.y = u_xlatb7.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.xy * u_xlat7.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat16_1.w = u_xlat10_0.w * u_xlat0.x + _TextureSampleAdd.w;
    SV_Target0 = u_xlat16_1 * vs_COLOR0;
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
varying mediump float vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat2;
float u_xlat6;
bool u_xlatb6;
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
    u_xlat0.xy = in_TEXCOORD0.xx * vec2(4096.0, 0.000244140625);
    u_xlat2 = floor(u_xlat0.y);
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.xz = (bool(u_xlatb0)) ? vec2(4096.0, 0.000244140625) : vec2(-4096.0, -0.000244140625);
    u_xlat6 = u_xlat2 * 4096.0;
    u_xlatb6 = u_xlat6>=(-u_xlat6);
    u_xlat1.xy = (bool(u_xlatb6)) ? vec2(4096.0, 0.000244140625) : vec2(-4096.0, -0.000244140625);
    u_xlat2 = u_xlat2 * u_xlat1.y;
    u_xlat2 = fract(u_xlat2);
    u_xlat2 = u_xlat2 * u_xlat1.x;
    u_xlat1.y = u_xlat2 * 0.000244200259;
    u_xlat2 = u_xlat0.z * in_TEXCOORD0.x;
    u_xlat2 = fract(u_xlat2);
    u_xlat0.x = u_xlat2 * u_xlat0.x;
    u_xlat1.x = u_xlat0.x * 0.000244200259;
    vs_TEXCOORD0.xy = u_xlat1.xy;
    vs_TEXCOORD2 = in_TEXCOORD0.y;
    vs_TEXCOORD1 = in_POSITION0;
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
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec4 u_xlatb0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
lowp vec3 u_xlat10_5;
bool u_xlatb5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
bool u_xlatb9;
mediump vec2 u_xlat16_10;
mediump float u_xlat16_11;
mediump vec2 u_xlat16_14;
bool u_xlatb25;
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
    u_xlat16_2.x = u_xlat10_1.w * u_xlat0.x + -0.00100000005;
    u_xlat16_0.w = u_xlat10_1.w * u_xlat0.x + _TextureSampleAdd.w;
    u_xlatb25 = u_xlat16_2.x<0.0;
    if(u_xlatb25){discard;}
    u_xlatb25 = u_xlat10_1.y>=u_xlat10_1.z;
    u_xlat16_2.x = (u_xlatb25) ? 1.0 : 0.0;
    u_xlat16_10.xy = (-u_xlat10_1.zy) + u_xlat10_1.yz;
    u_xlat16_3.xy = u_xlat16_2.xx * u_xlat16_10.xy + u_xlat10_1.zy;
    u_xlat16_10.x = float(1.0);
    u_xlat16_10.y = float(-1.0);
    u_xlat16_3.zw = u_xlat16_2.xx * u_xlat16_10.xy + vec2(-1.0, 0.666666687);
    u_xlat16_2.xyz = (-u_xlat16_3.xyw);
    u_xlat16_2.w = (-u_xlat10_1.x);
    u_xlat16_4.yzw = u_xlat16_2.yzw + u_xlat16_3.yzx;
    u_xlat16_4.x = u_xlat10_1.x + u_xlat16_2.x;
    u_xlatb9 = u_xlat10_1.x>=u_xlat16_3.x;
    u_xlat16_2.x = (u_xlatb9) ? 1.0 : 0.0;
    u_xlat16_10.x = u_xlat16_2.x * u_xlat16_4.w + u_xlat10_1.x;
    u_xlat16_2.xzw = u_xlat16_2.xxx * u_xlat16_4.yzx + u_xlat16_3.ywx;
    u_xlat16_3.x = (-u_xlat16_2.x) + u_xlat16_10.x;
    u_xlat16_10.x = min(u_xlat16_2.x, u_xlat16_10.x);
    u_xlat16_10.x = (-u_xlat16_10.x) + u_xlat16_2.w;
    u_xlat16_11 = u_xlat16_10.x * 6.0 + 1.00000001e-10;
    u_xlat16_3.x = u_xlat16_3.x / u_xlat16_11;
    u_xlat16_3.x = u_xlat16_2.z + u_xlat16_3.x;
    u_xlat16_2.x = abs(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_2.w + 1.00000001e-10;
    u_xlat16_2.z = u_xlat16_10.x / u_xlat16_3.x;
    u_xlat16_1.x = float(0.25);
    u_xlat16_1.z = float(0.75);
    u_xlat16_1.yw = vec2(vs_TEXCOORD2);
    u_xlat10_3 = texture2D(_ParamTex, u_xlat16_1.xy);
    u_xlat10_5.xyz = texture2D(_ParamTex, u_xlat16_1.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_5.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat16_6.xyz = u_xlat16_2.xzw + (-u_xlat10_3.xyz);
    u_xlat16_7.xyz = -abs(u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = min(abs(u_xlat16_6.xyz), u_xlat16_7.xyz);
    u_xlat16_14.xy = u_xlat16_6.yz * vec2(0.100000001, 0.100000001);
    u_xlat16_10.x = max(u_xlat16_14.x, u_xlat16_6.x);
    u_xlat16_10.x = max(u_xlat16_14.y, u_xlat16_10.x);
    u_xlatb5 = u_xlat10_3.w>=u_xlat16_10.x;
    u_xlat16_10.x = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_2.xyz = u_xlat16_4.yzx * u_xlat16_10.xxx + u_xlat16_2.zwx;
    u_xlat16_4.xyz = u_xlat16_2.zzz + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_2.xy = u_xlat16_2.xy;
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
    u_xlat16_4.xyz = fract(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_4.xyz = abs(u_xlat16_4.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xzw = u_xlat16_2.xxx * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_0.xyz = u_xlat16_2.yyy * u_xlat16_2.xzw + _TextureSampleAdd.xyz;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
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
varying mediump float vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat2;
float u_xlat6;
bool u_xlatb6;
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
    u_xlat0.xy = in_TEXCOORD0.xx * vec2(4096.0, 0.000244140625);
    u_xlat2 = floor(u_xlat0.y);
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.xz = (bool(u_xlatb0)) ? vec2(4096.0, 0.000244140625) : vec2(-4096.0, -0.000244140625);
    u_xlat6 = u_xlat2 * 4096.0;
    u_xlatb6 = u_xlat6>=(-u_xlat6);
    u_xlat1.xy = (bool(u_xlatb6)) ? vec2(4096.0, 0.000244140625) : vec2(-4096.0, -0.000244140625);
    u_xlat2 = u_xlat2 * u_xlat1.y;
    u_xlat2 = fract(u_xlat2);
    u_xlat2 = u_xlat2 * u_xlat1.x;
    u_xlat1.y = u_xlat2 * 0.000244200259;
    u_xlat2 = u_xlat0.z * in_TEXCOORD0.x;
    u_xlat2 = fract(u_xlat2);
    u_xlat0.x = u_xlat2 * u_xlat0.x;
    u_xlat1.x = u_xlat0.x * 0.000244200259;
    vs_TEXCOORD0.xy = u_xlat1.xy;
    vs_TEXCOORD2 = in_TEXCOORD0.y;
    vs_TEXCOORD1 = in_POSITION0;
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
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec4 u_xlatb0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
lowp vec3 u_xlat10_5;
bool u_xlatb5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
bool u_xlatb9;
mediump vec2 u_xlat16_10;
mediump float u_xlat16_11;
mediump vec2 u_xlat16_14;
bool u_xlatb25;
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
    u_xlat16_2.x = u_xlat10_1.w * u_xlat0.x + -0.00100000005;
    u_xlat16_0.w = u_xlat10_1.w * u_xlat0.x + _TextureSampleAdd.w;
    u_xlatb25 = u_xlat16_2.x<0.0;
    if(u_xlatb25){discard;}
    u_xlatb25 = u_xlat10_1.y>=u_xlat10_1.z;
    u_xlat16_2.x = (u_xlatb25) ? 1.0 : 0.0;
    u_xlat16_10.xy = (-u_xlat10_1.zy) + u_xlat10_1.yz;
    u_xlat16_3.xy = u_xlat16_2.xx * u_xlat16_10.xy + u_xlat10_1.zy;
    u_xlat16_10.x = float(1.0);
    u_xlat16_10.y = float(-1.0);
    u_xlat16_3.zw = u_xlat16_2.xx * u_xlat16_10.xy + vec2(-1.0, 0.666666687);
    u_xlat16_2.xyz = (-u_xlat16_3.xyw);
    u_xlat16_2.w = (-u_xlat10_1.x);
    u_xlat16_4.yzw = u_xlat16_2.yzw + u_xlat16_3.yzx;
    u_xlat16_4.x = u_xlat10_1.x + u_xlat16_2.x;
    u_xlatb9 = u_xlat10_1.x>=u_xlat16_3.x;
    u_xlat16_2.x = (u_xlatb9) ? 1.0 : 0.0;
    u_xlat16_10.x = u_xlat16_2.x * u_xlat16_4.w + u_xlat10_1.x;
    u_xlat16_2.xzw = u_xlat16_2.xxx * u_xlat16_4.yzx + u_xlat16_3.ywx;
    u_xlat16_3.x = (-u_xlat16_2.x) + u_xlat16_10.x;
    u_xlat16_10.x = min(u_xlat16_2.x, u_xlat16_10.x);
    u_xlat16_10.x = (-u_xlat16_10.x) + u_xlat16_2.w;
    u_xlat16_11 = u_xlat16_10.x * 6.0 + 1.00000001e-10;
    u_xlat16_3.x = u_xlat16_3.x / u_xlat16_11;
    u_xlat16_3.x = u_xlat16_2.z + u_xlat16_3.x;
    u_xlat16_2.x = abs(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_2.w + 1.00000001e-10;
    u_xlat16_2.z = u_xlat16_10.x / u_xlat16_3.x;
    u_xlat16_1.x = float(0.25);
    u_xlat16_1.z = float(0.75);
    u_xlat16_1.yw = vec2(vs_TEXCOORD2);
    u_xlat10_3 = texture2D(_ParamTex, u_xlat16_1.xy);
    u_xlat10_5.xyz = texture2D(_ParamTex, u_xlat16_1.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_5.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat16_6.xyz = u_xlat16_2.xzw + (-u_xlat10_3.xyz);
    u_xlat16_7.xyz = -abs(u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = min(abs(u_xlat16_6.xyz), u_xlat16_7.xyz);
    u_xlat16_14.xy = u_xlat16_6.yz * vec2(0.100000001, 0.100000001);
    u_xlat16_10.x = max(u_xlat16_14.x, u_xlat16_6.x);
    u_xlat16_10.x = max(u_xlat16_14.y, u_xlat16_10.x);
    u_xlatb5 = u_xlat10_3.w>=u_xlat16_10.x;
    u_xlat16_10.x = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_2.xyz = u_xlat16_4.yzx * u_xlat16_10.xxx + u_xlat16_2.zwx;
    u_xlat16_4.xyz = u_xlat16_2.zzz + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_2.xy = u_xlat16_2.xy;
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
    u_xlat16_4.xyz = fract(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_4.xyz = abs(u_xlat16_4.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xzw = u_xlat16_2.xxx * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_0.xyz = u_xlat16_2.yyy * u_xlat16_2.xzw + _TextureSampleAdd.xyz;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
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
varying mediump float vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat2;
float u_xlat6;
bool u_xlatb6;
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
    u_xlat0.xy = in_TEXCOORD0.xx * vec2(4096.0, 0.000244140625);
    u_xlat2 = floor(u_xlat0.y);
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.xz = (bool(u_xlatb0)) ? vec2(4096.0, 0.000244140625) : vec2(-4096.0, -0.000244140625);
    u_xlat6 = u_xlat2 * 4096.0;
    u_xlatb6 = u_xlat6>=(-u_xlat6);
    u_xlat1.xy = (bool(u_xlatb6)) ? vec2(4096.0, 0.000244140625) : vec2(-4096.0, -0.000244140625);
    u_xlat2 = u_xlat2 * u_xlat1.y;
    u_xlat2 = fract(u_xlat2);
    u_xlat2 = u_xlat2 * u_xlat1.x;
    u_xlat1.y = u_xlat2 * 0.000244200259;
    u_xlat2 = u_xlat0.z * in_TEXCOORD0.x;
    u_xlat2 = fract(u_xlat2);
    u_xlat0.x = u_xlat2 * u_xlat0.x;
    u_xlat1.x = u_xlat0.x * 0.000244200259;
    vs_TEXCOORD0.xy = u_xlat1.xy;
    vs_TEXCOORD2 = in_TEXCOORD0.y;
    vs_TEXCOORD1 = in_POSITION0;
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
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec4 u_xlatb0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
lowp vec3 u_xlat10_5;
bool u_xlatb5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
bool u_xlatb9;
mediump vec2 u_xlat16_10;
mediump float u_xlat16_11;
mediump vec2 u_xlat16_14;
bool u_xlatb25;
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
    u_xlat16_2.x = u_xlat10_1.w * u_xlat0.x + -0.00100000005;
    u_xlat16_0.w = u_xlat10_1.w * u_xlat0.x + _TextureSampleAdd.w;
    u_xlatb25 = u_xlat16_2.x<0.0;
    if(u_xlatb25){discard;}
    u_xlatb25 = u_xlat10_1.y>=u_xlat10_1.z;
    u_xlat16_2.x = (u_xlatb25) ? 1.0 : 0.0;
    u_xlat16_10.xy = (-u_xlat10_1.zy) + u_xlat10_1.yz;
    u_xlat16_3.xy = u_xlat16_2.xx * u_xlat16_10.xy + u_xlat10_1.zy;
    u_xlat16_10.x = float(1.0);
    u_xlat16_10.y = float(-1.0);
    u_xlat16_3.zw = u_xlat16_2.xx * u_xlat16_10.xy + vec2(-1.0, 0.666666687);
    u_xlat16_2.xyz = (-u_xlat16_3.xyw);
    u_xlat16_2.w = (-u_xlat10_1.x);
    u_xlat16_4.yzw = u_xlat16_2.yzw + u_xlat16_3.yzx;
    u_xlat16_4.x = u_xlat10_1.x + u_xlat16_2.x;
    u_xlatb9 = u_xlat10_1.x>=u_xlat16_3.x;
    u_xlat16_2.x = (u_xlatb9) ? 1.0 : 0.0;
    u_xlat16_10.x = u_xlat16_2.x * u_xlat16_4.w + u_xlat10_1.x;
    u_xlat16_2.xzw = u_xlat16_2.xxx * u_xlat16_4.yzx + u_xlat16_3.ywx;
    u_xlat16_3.x = (-u_xlat16_2.x) + u_xlat16_10.x;
    u_xlat16_10.x = min(u_xlat16_2.x, u_xlat16_10.x);
    u_xlat16_10.x = (-u_xlat16_10.x) + u_xlat16_2.w;
    u_xlat16_11 = u_xlat16_10.x * 6.0 + 1.00000001e-10;
    u_xlat16_3.x = u_xlat16_3.x / u_xlat16_11;
    u_xlat16_3.x = u_xlat16_2.z + u_xlat16_3.x;
    u_xlat16_2.x = abs(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_2.w + 1.00000001e-10;
    u_xlat16_2.z = u_xlat16_10.x / u_xlat16_3.x;
    u_xlat16_1.x = float(0.25);
    u_xlat16_1.z = float(0.75);
    u_xlat16_1.yw = vec2(vs_TEXCOORD2);
    u_xlat10_3 = texture2D(_ParamTex, u_xlat16_1.xy);
    u_xlat10_5.xyz = texture2D(_ParamTex, u_xlat16_1.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_5.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat16_6.xyz = u_xlat16_2.xzw + (-u_xlat10_3.xyz);
    u_xlat16_7.xyz = -abs(u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = min(abs(u_xlat16_6.xyz), u_xlat16_7.xyz);
    u_xlat16_14.xy = u_xlat16_6.yz * vec2(0.100000001, 0.100000001);
    u_xlat16_10.x = max(u_xlat16_14.x, u_xlat16_6.x);
    u_xlat16_10.x = max(u_xlat16_14.y, u_xlat16_10.x);
    u_xlatb5 = u_xlat10_3.w>=u_xlat16_10.x;
    u_xlat16_10.x = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_2.xyz = u_xlat16_4.yzx * u_xlat16_10.xxx + u_xlat16_2.zwx;
    u_xlat16_4.xyz = u_xlat16_2.zzz + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_2.xy = u_xlat16_2.xy;
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
    u_xlat16_4.xyz = fract(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_4.xyz = abs(u_xlat16_4.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xzw = u_xlat16_2.xxx * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_0.xyz = u_xlat16_2.yyy * u_xlat16_2.xzw + _TextureSampleAdd.xyz;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
    return;
}

#endif
"
}
}
}
}
}