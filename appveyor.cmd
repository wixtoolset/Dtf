@setlocal
@pushd %~dp0

nuget restore

msbuild -p:Configuration=Release;Platform=x86;PlatformToolset=v141
msbuild -p:Configuration=Release;Platform=x64;PlatformToolset=v141

msbuild -p:Configuration=Release -t:PackNativeNuget src\Tools\SfxCA\SfxCA.vcxproj

@popd
@endlocal