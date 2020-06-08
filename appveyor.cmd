@setlocal
@pushd %~dp0

nuget restore

msbuild -p:Configuration=Release

@popd
@endlocal