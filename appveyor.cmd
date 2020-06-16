@setlocal
@pushd %~dp0
@set _C=Release
@set _P=%~dp0build\%_C%\publish

nuget restore

msbuild -p:Configuration=%_C% -t:CustomBuild

msbuild .\src\Tools\SfxCA\SfxCA.vcxproj -p:Configuration=%_C% -p:Platform="x64" -p:OutputPath="%_P%\WixToolset.Dtf.MSBuild\tools\\"
msbuild .\src\Tools\SfxCA\SfxCA.vcxproj -p:Configuration=%_C% -p:Platform="x86" -p:OutputPath="%_P%\WixToolset.Dtf.MSBuild\tools\\"

msbuild .\src\Tools\MakeSfxCA\MakeSfxCA.csproj -p:Configuration=%_C% -p:TargetFramework="net461" -p:OutputPath="%_P%\WixToolset.Dtf.MSBuild\tools\net461"
msbuild .\src\Tools\MakeSfxCA\MakeSfxCA.csproj -p:Configuration=%_C% -p:TargetFramework="netcoreapp2.1" -p:OutputPath="%_P%\WixToolset.Dtf.MSBuild\tools\netcoreapp2.1"

msbuild .\src\WixToolset.Dtf.MSBuild\WixToolset.Dtf.MSBuild.csproj -p:Configuration=%_C% -p:OutputPath="%_P%\WixToolset.Dtf.MSBuild"
msbuild .\src\WixToolset.Dtf.MSBuild\WixToolset.Dtf.MSBuild.csproj -target:Pack -p:Configuration=%_C%

@popd
@endlocal