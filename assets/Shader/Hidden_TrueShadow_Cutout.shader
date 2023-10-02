//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/TrueShadow/Cutout" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_Offset ("Offset", Vector) = (0,0,0,0)
}
SubShader {
 Pass {
  Blend Zero OneMinusSrcAlpha, Zero OneMinusSrcAlpha
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 34304
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec2 _Offset;
uniform 	float _OverflowAlpha;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp float u_xlat10_0;
bvec2 u_xlatb1;
bvec2 u_xlatb4;
bool u_xlatb6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + _Offset.xy;
    u_xlatb4.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), u_xlat0.xyxy).xy;
    u_xlatb4.x = u_xlatb4.y || u_xlatb4.x;
    u_xlatb1.xy = lessThan(u_xlat0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb6 = u_xlatb1.y || u_xlatb1.x;
    u_xlatb4.x = u_xlatb6 || u_xlatb4.x;
    if(u_xlatb4.x){
        SV_Target0 = vec4(vec4(vec4(_OverflowAlpha, _OverflowAlpha, _OverflowAlpha, _OverflowAlpha)));
        return;
    }
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy).w;
    SV_Target0.w = u_xlat10_0 * u_xlat10_0;
    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
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
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec2 _Offset;
uniform 	float _OverflowAlpha;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp float u_xlat10_0;
bvec2 u_xlatb1;
bvec2 u_xlatb4;
bool u_xlatb6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + _Offset.xy;
    u_xlatb4.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), u_xlat0.xyxy).xy;
    u_xlatb4.x = u_xlatb4.y || u_xlatb4.x;
    u_xlatb1.xy = lessThan(u_xlat0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb6 = u_xlatb1.y || u_xlatb1.x;
    u_xlatb4.x = u_xlatb6 || u_xlatb4.x;
    if(u_xlatb4.x){
        SV_Target0 = vec4(vec4(vec4(_OverflowAlpha, _OverflowAlpha, _OverflowAlpha, _OverflowAlpha)));
        return;
    }
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy).w;
    SV_Target0.w = u_xlat10_0 * u_xlat10_0;
    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
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
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec2 _Offset;
uniform 	float _OverflowAlpha;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp float u_xlat10_0;
bvec2 u_xlatb1;
bvec2 u_xlatb4;
bool u_xlatb6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + _Offset.xy;
    u_xlatb4.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), u_xlat0.xyxy).xy;
    u_xlatb4.x = u_xlatb4.y || u_xlatb4.x;
    u_xlatb1.xy = lessThan(u_xlat0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb6 = u_xlatb1.y || u_xlatb1.x;
    u_xlatb4.x = u_xlatb6 || u_xlatb4.x;
    if(u_xlatb4.x){
        SV_Target0 = vec4(vec4(vec4(_OverflowAlpha, _OverflowAlpha, _OverflowAlpha, _OverflowAlpha)));
        return;
    }
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy).w;
    SV_Target0.w = u_xlat10_0 * u_xlat10_0;
    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
"
}
}
}
}
}