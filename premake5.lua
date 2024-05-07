project "curlpp"
	kind "StaticLib"
	language "C++"
	cppdialect "C++latest"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")	
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"include/**.hpp",
		"include/**.inl",
		"src/**.cpp"
	}

	includedirs 
	{ 
		"include", 
		"../curl/include" 
	}

	defines
	{
		"CURL_STATICLIB"
	}

	links
	{
		"curl"
	}

	filter "system:windows"
		systemversion "latest"
		staticruntime "on"

	filter "configurations:Debug"
		symbols "on"

	filter "configurations:Release"
		optimize "on"

	filter "configurations:Dist"
		optimize "on"


	filter { "system:windows", "configurations:Debug" }
		buildoptions "/MTd"

	filter { "system:windows", "configurations:Release" }
		buildoptions "/MT"

	filter { "system:windows", "configurations:Dist" }
		buildoptions "/MT"