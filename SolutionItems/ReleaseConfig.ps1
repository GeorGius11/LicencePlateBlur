if (Get-Command conan -errorAction SilentlyContinue)
{}
else
{
	echo conan
	$uri = "https://github.com/conan-io/conan/releases/latest/download/conan-win-64.exe"
	$out = "$env:TEMP\conan.exe"
	curl  $uri -OutFile $out
	.$out | Out-Null
}
if (Get-Command cmake -errorAction SilentlyContinue)
{}
else
{
    	echo cmake
	$uri = "https://github.com/Kitware/CMake/releases/download/v3.23.2/cmake-3.23.2-windows-x86_64.msi"
	$out = "$env:TEMP\cmake.msi"
	curl $uri -OutFile $out
	Start-Process msiexec -argumentlist "/i $out" -Wait
}
cd ..
cd final_core
if (Test-Path -Path .\build\) 
{
	Remove-Item .\build\ -Recurse
}
mkdir build
cd build
conan install .. -s build_type=Release
cd ..
cmake -S .  -B ./build -G "Visual Studio 17 2022"
