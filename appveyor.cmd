@setlocal
@pushd %~dp0
@set _C=Release
@set _P=%~dp0build\%_C%\publish
@set _S=%~dp0src\

nuget restore

msbuild -p:Configuration=%_C%
msbuild %_S%Tools\SfxCA\SfxCA.vcxproj -p:Configuration=%_C% -p:Platform="x64" -p:OutputPath="%_P%\WixToolset.Dtf.MSBuild\\"
msbuild %_S%Tools\SfxCA\SfxCA.vcxproj -p:Configuration=%_C% -p:Platform="x86" -p:OutputPath="%_P%\WixToolset.Dtf.MSBuild\\"
msbuild %_S%Tools\MakeSfxCA\MakeSfxCA.csproj -p:Configuration=%_C% -p:OutputPath="%_P%\WixToolset.Dtf.MSBuild"
msbuild %_S%WixToolset.Dtf.MSBuild\WixToolset.Dtf.MSBuild.csproj -p:OutputPath="%_P%\WixToolset.Dtf.MSBuild"

msbuild %_S%WixToolset.Dtf.MSBuild\WixToolset.Dtf.MSBuild.csproj -target:Pack -p:Configuration=%_C%

@popd
@endlocal