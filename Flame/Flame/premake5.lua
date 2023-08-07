dependencies = {}
dependencies["SDL2"] = "dependencies/SDL2/SDL2-2.28.2"


project "Flame"
	kind "StaticLib"
	language "C++"
	cppdialect "C++20"
	staticruntime "on"

	targetdir (bin_dir)
	objdir (bin_int_dir)

	pchheader("pchFlame.h")
	pchsource("src/pchFlame.cpp")

	files 
	{
		"src/**.cpp",
		"src/**.h",
	}

	includedirs
	{
		"src",
		"src/Flame",
		dependencies["SDL2"] .. "/include",
	}

	libdirs
	{
		dependencies["SDL2"] .. "/lib/x64",
	}

	links 
	{
		"SDL2.lib",
		"SDL2main.lib",
	}

	filter "system:windows"
		systemversion "latest"

		defines
		{
			"FLAME_PLATFORM_WINDOWS",
		}

	filter "configurations:Debug"
		defines "DEBUG"
		defines "FLAME_DEBUG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "RELEASE"
		defines "FLAME_RELEASE"
		runtime "Release"
		symbols "on"