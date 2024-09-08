DependencyDir = {}


project "Vendor"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    targetdir "bin/%{cfg.buildcfg}"
    staticruntime "on"

    files { "vkbootstrap/**.h", "vkbootstrap/**.cpp" }

    includedirs
    {
        "vkbootstrap"
    }
   
    externalincludedirs
    {

    }
   
    libdirs
    {

    }
   
	links
	{
		"mingw32",
		"SDL2",
		"SDL2main",
        "vulkan-1",
        "VkLayer_khronos_validation"
	}

	targetdir ("../bin/" .. OutputDir .. "/%{prj.name}")
	objdir ("../bin/objs/" .. OutputDir .. "/%{prj.name}")

	filter "system:windows"
		systemversion "latest"
		defines { }

	filter "configurations:Debug"
		defines { "DEBUG" }
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		defines { "RELEASE" }
		runtime "Release"
		optimize "On"
		symbols "On"

   filter "configurations:Dist"
       defines { "DIST" }
       runtime "Release"
       optimize "On"
       symbols "Off"