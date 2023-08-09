dependencies = {}
dependencies["GLFW"] = "dependencies/GLFW/GLFW"
dependencies["Glad"] = "dependencies/Glad/Glad"
dependencies["ImGui"] = "dependencies/ImGui"
dependencies["spdlog"] = "dependencies/spdlog"

group "Dependencies"
	include "dependencies/GLFW"
	include "dependencies/Glad"
	include "dependencies/ImGui"
group ""

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
		dependencies["spdlog"] .. "/include",
		dependencies["GLFW"] .. "/include",
		dependencies["Glad"] .. "/include",
		dependencies["ImGui"],
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