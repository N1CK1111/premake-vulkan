DependencyDir = {}
DependencyDir["vkbootstrap"] = "../vendor/vkbootstrap"

project "Engine"
--  kind "WindowedApp"
    language "C++"
    cppdialect "C++20"
    targetdir "bin/%{cfg.buildcfg}"
    staticruntime "on"

    files 
    {
        "Source/*.h", 
        "Source/*.cpp" 
    }

    includedirs
    {
        "Source",

        --For VkBootstrap
        "../vendor/vkbootstrap"
    }
   
    externalincludedirs
    {

    }
   
    libdirs
    {
        "/mingw64/bin"
    }

	links
    {
        "mingw32",
        "SDL2main",
        "Vendor",
	    "SDL2",
		"vulkan-1",
        "VkLayer_khronos_validation"
    }

    targetdir ("../bin/" .. OutputDir .. "/%{prj.name}")
    objdir ("../bin/objs/" .. OutputDir .. "/%{prj.name}")

    -- This only works with MSYS2 and other bash shells
    prebuildcommands {
        "mkdir -p %{cfg.buildtarget.directory}/res",
        "cp -R ../res/* %{cfg.buildtarget.directory}/res",
        "cp -R ../dlls/* %{cfg.buildtarget.directory}",

        "mkdir -p %{cfg.buildtarget.directory}/shaders",

        "find ../shaders -name '*.frag' -exec sh -c 'glslangValidator -V \"{}\" -o %{cfg.buildtarget.directory}/shaders/\"$(basename {})\".spv' \\;",

        "find ../shaders -name '*.vert' -exec sh -c 'glslangValidator -V \"{}\" -o %{cfg.buildtarget.directory}/shaders/\"$(basename {})\".spv' \\;"
    }

    filter "system:windows"
        systemversion "latest"
        defines { "WINDOWS" }

    filter "configurations:Debug"
        defines { "DEBUG" }
        runtime "Debug"
        symbols "On"
        kind "ConsoleApp"

    filter "configurations:Release"
        defines { "RELEASE" }
        runtime "Release"
        optimize "On"
        symbols "On"
        kind "WindowedApp"

    filter "configurations:Dist"
        defines { "DIST" }
        runtime "Release"
        optimize "On"
        symbols "Off"
        kind "WindowedApp"