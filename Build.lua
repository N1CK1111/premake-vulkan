-- premake5.lua
workspace "premake-vulkan"
   architecture "x86_64"
   configurations { "Debug", "Release", "Dist" }
   startproject "Engine"

OutputDir = "%{cfg.system}-%{cfg.architecture}/%{cfg.buildcfg}"

group "Vendor"
   include "vendor/Build-Vendor.lua"
group ""

include "App/Build-App.lua"