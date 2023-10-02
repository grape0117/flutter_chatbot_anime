//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/TrueShadow/Generate" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 22978
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
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
    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(_Radius);
    vs_TEXCOORD0 = u_xlat16_0 * vec4(-0.5, -0.5, 0.5, 0.5) + in_TEXCOORD0.xyxy;
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
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.zw);
    u_xlat0 = u_xlat10_0 * vec4(0.25, 0.25, 0.25, 0.25);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xw);
    u_xlat0 = u_xlat10_1 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat0;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_1 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat0;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.zy);
    u_xlat0 = u_xlat10_1 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat0;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
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
    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(_Radius);
    vs_TEXCOORD0 = u_xlat16_0 * vec4(-0.5, -0.5, 0.5, 0.5) + in_TEXCOORD0.xyxy;
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
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.zw);
    u_xlat0 = u_xlat10_0 * vec4(0.25, 0.25, 0.25, 0.25);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xw);
    u_xlat0 = u_xlat10_1 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat0;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_1 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat0;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.zy);
    u_xlat0 = u_xlat10_1 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat0;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
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
    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(_Radius);
    vs_TEXCOORD0 = u_xlat16_0 * vec4(-0.5, -0.5, 0.5, 0.5) + in_TEXCOORD0.xyxy;
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
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.zw);
    u_xlat0 = u_xlat10_0 * vec4(0.25, 0.25, 0.25, 0.25);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xw);
    u_xlat0 = u_xlat10_1 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat0;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_1 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat0;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.zy);
    u_xlat0 = u_xlat10_1 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat0;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
}
}
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 126482
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
uniform 	mediump vec4 _CropRegion;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
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
    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(_Radius);
    u_xlat16_0 = u_xlat16_0 * vec4(-0.5, -0.5, 0.5, 0.5) + in_TEXCOORD0.xyxy;
    u_xlat16_1 = (-_CropRegion.xyxy) + _CropRegion.zwzw;
    vs_TEXCOORD0 = u_xlat16_0 * u_xlat16_1 + _CropRegion.xyxy;
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
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.zw);
    u_xlat0 = u_xlat10_0 * vec4(0.25, 0.25, 0.25, 0.25);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xw);
    u_xlat0 = u_xlat10_1 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat0;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_1 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat0;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.zy);
    u_xlat0 = u_xlat10_1 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat0;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
uniform 	mediump vec4 _CropRegion;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
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
    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(_Radius);
    u_xlat16_0 = u_xlat16_0 * vec4(-0.5, -0.5, 0.5, 0.5) + in_TEXCOORD0.xyxy;
    u_xlat16_1 = (-_CropRegion.xyxy) + _CropRegion.zwzw;
    vs_TEXCOORD0 = u_xlat16_0 * u_xlat16_1 + _CropRegion.xyxy;
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
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.zw);
    u_xlat0 = u_xlat10_0 * vec4(0.25, 0.25, 0.25, 0.25);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xw);
    u_xlat0 = u_xlat10_1 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat0;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_1 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat0;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.zy);
    u_xlat0 = u_xlat10_1 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat0;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
uniform 	mediump vec4 _CropRegion;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
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
    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(_Radius);
    u_xlat16_0 = u_xlat16_0 * vec4(-0.5, -0.5, 0.5, 0.5) + in_TEXCOORD0.xyxy;
    u_xlat16_1 = (-_CropRegion.xyxy) + _CropRegion.zwzw;
    vs_TEXCOORD0 = u_xlat16_0 * u_xlat16_1 + _CropRegion.xyxy;
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
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.zw);
    u_xlat0 = u_xlat10_0 * vec4(0.25, 0.25, 0.25, 0.25);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xw);
    u_xlat0 = u_xlat10_1 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat0;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_1 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat0;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.zy);
    u_xlat0 = u_xlat10_1 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat0;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
}
}
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 134955
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
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
    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(_Radius);
    vs_TEXCOORD0 = u_xlat16_0 * vec4(-0.5, -0.5, 0.5, 0.5) + in_TEXCOORD0.xyxy;
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
uniform 	mediump vec4 _BlueNoise_TexelSize;
uniform 	mediump vec2 _TargetSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _BlueNoise;
varying mediump vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
mediump vec2 u_xlat16_2;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.zw);
    u_xlat0 = u_xlat10_0 * vec4(0.25, 0.25, 0.25, 0.25);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xw);
    u_xlat0 = u_xlat10_1 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat0;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_1 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat0;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.zy);
    u_xlat0 = u_xlat10_1 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat0;
    u_xlat16_2.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat16_2.xy * _TargetSize.xy;
    u_xlat16_2.xy = u_xlat16_2.xy * _BlueNoise_TexelSize.xy;
    u_xlat10_1.x = texture2D(_BlueNoise, u_xlat16_2.xy).x;
    u_xlat16_2.x = u_xlat10_1.x + -0.5;
    SV_Target0 = u_xlat16_2.xxxx * vec4(0.00390625, 0.00390625, 0.00390625, 0.00390625) + u_xlat0;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
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
    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(_Radius);
    vs_TEXCOORD0 = u_xlat16_0 * vec4(-0.5, -0.5, 0.5, 0.5) + in_TEXCOORD0.xyxy;
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
uniform 	mediump vec4 _BlueNoise_TexelSize;
uniform 	mediump vec2 _TargetSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _BlueNoise;
varying mediump vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
mediump vec2 u_xlat16_2;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.zw);
    u_xlat0 = u_xlat10_0 * vec4(0.25, 0.25, 0.25, 0.25);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xw);
    u_xlat0 = u_xlat10_1 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat0;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_1 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat0;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.zy);
    u_xlat0 = u_xlat10_1 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat0;
    u_xlat16_2.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat16_2.xy * _TargetSize.xy;
    u_xlat16_2.xy = u_xlat16_2.xy * _BlueNoise_TexelSize.xy;
    u_xlat10_1.x = texture2D(_BlueNoise, u_xlat16_2.xy).x;
    u_xlat16_2.x = u_xlat10_1.x + -0.5;
    SV_Target0 = u_xlat16_2.xxxx * vec4(0.00390625, 0.00390625, 0.00390625, 0.00390625) + u_xlat0;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _Radius;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
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
    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(_Radius);
    vs_TEXCOORD0 = u_xlat16_0 * vec4(-0.5, -0.5, 0.5, 0.5) + in_TEXCOORD0.xyxy;
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
uniform 	mediump vec4 _BlueNoise_TexelSize;
uniform 	mediump vec2 _TargetSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _BlueNoise;
varying mediump vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
mediump vec2 u_xlat16_2;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.zw);
    u_xlat0 = u_xlat10_0 * vec4(0.25, 0.25, 0.25, 0.25);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xw);
    u_xlat0 = u_xlat10_1 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat0;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_1 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat0;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.zy);
    u_xlat0 = u_xlat10_1 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat0;
    u_xlat16_2.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat16_2.xy * _TargetSize.xy;
    u_xlat16_2.xy = u_xlat16_2.xy * _BlueNoise_TexelSize.xy;
    u_xlat10_1.x = texture2D(_BlueNoise, u_xlat16_2.xy).x;
    u_xlat16_2.x = u_xlat10_1.x + -0.5;
    SV_Target0 = u_xlat16_2.xxxx * vec4(0.00390625, 0.00390625, 0.00390625, 0.00390625) + u_xlat0;
    return;
}

#endif
"
}
}
}
}
}