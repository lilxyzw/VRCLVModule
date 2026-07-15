if(_UdonLightVolumeEnabled)
{
    float3 L0, L1r, L1g, L1b = 0;
    #if defined(VRCLV_VERSION) && VRCLV_VERSION == 3
    LightVolumeSH(vertex.position, L0, L1r, L1g, L1b, vertex.N);
    #else
    LightVolumeSH(vertex.position, L0, L1r, L1g, L1b);
    #endif

    // VRCLV Specular
    SCLightData light = (SCLightData)0;
    light.direction = L1r + L1g + L1b;
    light.direction = dot(light.direction, light.direction) == 0 ? 0 : normalize(light.direction);
    light.color = max(L0 + float3(dot(L1r, vertex.N), dot(L1g, vertex.N), dot(L1b, vertex.N)), 0);

    __SC_PHASE_light__

    SHAr = float4(L1r, L0.r);
    SHAg = float4(L1g, L0.g);
    SHAb = float4(L1b, L0.b);
    SHBr = 0;
    SHBg = 0;
    SHBb = 0;
    SHC = 0;
}