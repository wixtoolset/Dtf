@setlocal
@pushd %~dp0
@set _P=%~dp0build\Release\publish

nuget restore

dotnet publish -c Release -o %_P%\WixToolset.Dtf.MSBuild\net461\ -f net461 src\Tools\MakeSfxCA 
dotnet publish -c Release -o %_P%\WixToolset.Dtf.MSBuild\netcoreapp2.1\ -f netcoreapp2.1 src\Tools\MakeSfxCA

dotnet pack -c Release src\WixToolset.Dtf.MSBuild

msbuild -p:Configuration=Release

@popd
@endlocal