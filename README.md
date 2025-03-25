
# Premake & Vulkan

This project aims to allow vblanco20-1's legacy Vulkan guide to be built with MSYS2 and premake.
## Building

Install MSYS2 from https://www.msys2.org/
Then download the required packages for mingw-w64-x86_64

```bash
pacman -S make \
  mingw-w64-x86_64-toolchain \
  mingw-w64-x86_64-vulkan-devel \
  mingw-w64-x86_64-SDL2 \
  mingw-w64-x86_64-glslang 
```
Once you have installed the required packages simply run the command below in the root project directory
```bash
./vendor/Binaries/Premake/Windows/premake5.exe --file=Build.lua gmake2
```
After creating the Makefiles with gmake2 run ```make``` in the root project directory.
