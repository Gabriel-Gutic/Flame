project "SandBox"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++20"
	staticruntime "on"

	targetdir (bin_dir)
	objdir (bin_int_dir)

	-- pchheader("pch.h")
	-- pchsource("src/pch.cpp")

	files 
	{
		"src/**.cpp",
		"src/**.h",
	}

	includedirs
	{
		"src",
		sln .. "Flame/src",
		sln .. "Flame/src/Flame",
	}

	links
	{
		"Flame",
	}

	postbuildcommands
    {
        {"{COPY} \"" .. sln .. "Flame/" .. dependencies["SDL2"] .. "/lib/x64/SDL2.dll\" \"" .. bin_dir .. "\""}
    }

	filter "system:windows"
		systemversion "latest"
		-- kind "WindowedApp"

		defines
		{
			"SANDBOX_PLATFORM_WINDOWS",
		}

	filter "configurations:Debug"
		defines "DEBUG"
		defines "SANDBOX_DEBUG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "RELEASE"
		defines "SANDBOX_RELEASE"
		runtime "Release"
		symbols "on"