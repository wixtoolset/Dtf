@setlocal
@pushd %~dp0
@set _C=Release
@set _P=%~dp0build\%_C%\publish
@set _S=%~dp0src\

nuget restore

msbuild -p:Configuration=%_C%

msbuild %_S%Tools\SfxCA\SfxCA.vcxproj -p:Configuration=%_C% -p:Platform="x64" -p:OutputPath="%_P%\WixToolset.Dtf.MSBuild\tools\\"
msbuild %_S%Tools\SfxCA\SfxCA.vcxproj -p:Configuration=%_C% -p:Platform="x86" -p:OutputPath="%_P%\WixToolset.Dtf.MSBuild\tools\\"

msbuild %_S%Tools\MakeSfxCA\MakeSfxCA.csproj -p:Configuration=%_C% -p:TargetFramework="net461" -p:OutputPath="%_P%\WixToolset.Dtf.MSBuild\tools\net461"
msbuild %_S%Tools\MakeSfxCA\MakeSfxCA.csproj -p:Configuration=%_C% -p:TargetFramework="netcoreapp2.1" -p:OutputPath="%_P%\WixToolset.Dtf.MSBuild\tools\netcoreapp2.1"

msbuild %_S%WixToolset.Dtf.Compression\WixToolset.Dtf.Compression.csproj -p:Configuration=%_C% -p:OutputPath="%_P%\WixToolset.Dtf.MSBuild\tools
msbuild %_S%WixToolset.Dtf.Compression.Cap\WixToolset.Dtf.Compression.Cap.csproj -p:Configuration=%_C% -p:OutputPath="%_P%\WixToolset.Dtf.MSBuild\tools
msbuild %_S%WixToolset.Dtf.Compression.Zip\WixToolset.Dtf.Compression.Zip.csproj -p:Configuration=%_C% -p:OutputPath="%_P%\WixToolset.Dtf.MSBuild\tools
msbuild %_S%WixToolset.Dtf.Resources\WixToolset.Dtf.Resources.csproj -p:Configuration=%_C% -p:OutputPath="%_P%\WixToolset.Dtf.MSBuild\tools
msbuild %_S%WixToolset.Dtf.WindowsInstaller\WixToolset.Dtf.WindowsInstaller.csproj -p:Configuration=%_C% -p:OutputPath="%_P%\WixToolset.Dtf.MSBuild\tools
msbuild %_S%WixToolset.Dtf.WindowsInstaller.Linq\WixToolset.Dtf.WindowsInstaller.Linq.csproj -p:Configuration=%_C% -p:OutputPath="%_P%\WixToolset.Dtf.MSBuild\tools
msbuild %_S%WixToolset.Dtf.WindowsInstaller.Package\WixToolset.Dtf.WindowsInstaller.Package.csproj -p:Configuration=%_C% -p:OutputPath="%_P%\WixToolset.Dtf.MSBuild\tools

msbuild %_S%WixToolset.Dtf.MSBuild\WixToolset.Dtf.MSBuild.csproj -p:Configuration=%_C% -p:OutputPath="%_P%\WixToolset.Dtf.MSBuild"

msbuild %_S%WixToolset.Dtf.Compression\WixToolset.Dtf.Compression.csproj -p:Configuration=%_C% -t:CustomBuild
msbuild %_S%WixToolset.Dtf.Compression.Cab\WixToolset.Dtf.Compression.Cab.csproj -p:Configuration=%_C% -t:CustomBuild
msbuild %_S%WixToolset.Dtf.Compression.Zip\WixToolset.Dtf.Compression.Zip.csproj -p:Configuration=%_C% -t:CustomBuild
msbuild %_S%WixToolset.Dtf.Resources\WixToolset.Dtf.Resources.csproj -p:Configuration=%_C% -t:CustomBuild
msbuild %_S%WixToolset.Dtf.WindowsInstaller\WixToolset.Dtf.WindowsInstaller.csproj -p:Configuration=%_C% -t:CustomBuild
msbuild %_S%WixToolset.Dtf.WindowsInstaller.Linq\WixToolset.Dtf.WindowsInstaller.Linq.csproj -p:Configuration=%_C% -t:CustomBuild
msbuild %_S%WixToolset.Dtf.WindowsInstaller.Package\WixToolset.Dtf.WindowsInstaller.Package.csproj -p:Configuration=%_C% -t:CustomBuild

msbuild %_S%WixToolset.Dtf.MSBuild\WixToolset.Dtf.MSBuild.csproj -target:Pack -p:Configuration=%_C%

@popd
@endlocal