if(_UdonLightVolumeEnabled)
{
    float3 L0, L1r, L1g, L1b = 0;
    LightVolumeSH(vertex.position, L0, L1r, L1g, L1b);
    
    SHAr = float4(L1r, L0.r);
    SHAg = float4(L1g, L0.g);
    SHAb = float4(L1b, L0.b);
    SHBr = 0;
    SHBg = 0;
    SHBb = 0;
    SHC = 0;
}