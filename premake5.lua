workspace "Storm"
  architecture "x64"


      configurations
  {
  "Debug",
  "Release",
  "Dist"
  }

  outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

  IncludeDir = {}
  IncludeDir["GLFW"] = "Engine/3dlibs/GLFW/include"

  include "Engine/3dlibs/GLFW"

  project "Engine"
      location "Engine"
      kind "SharedLib"
      language "C++"
      cppdialect "C++17"
	  staticruntime "off"

      targetdir ("bin/" .. outputdir .. "/%{prj.name}")
      objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

      pchheader "STpch.h"
      pchsource "Engine/SRC/STpch.cpp"

         files 
      {
          "%{prj.name}/SRC/**.h",
          "%{prj.name}/SRC/**.cpp",
          "%{prj.name}/SRC/**.ini",
          "%{prj.name}/3dlibs/GLFW/include/**.h",    --new adds file to project solution
          "%{prj.name}/3dlibs/GLFW/include/**.cpp",  --new adds file to project solution
          "Engine/3dlibs/glm/glm/**.hpp",
		  "Engine/3dlibs/glm/glm/**.inl",
          "3dlibs/ImGuizmo/ImGuizmo.h",              --new adds file to project solution
		  "3dlibs/ImGuizmo/ImGuizmo.cpp"             --new adds file to project solution
      }


          includedirs
      {
        "%{prj.name}/SRC",
        "%{prj.name}/Storm/Events",
        "%{prj.name}/3dlibs/Spdlog/include", 
        "%{prj.name}/3dlibs/glm/glm",
		"%{IncludeDir.GLFW}",
        "%{IncludeDir.ImGui}",   --new adds file to project solution
        "%{IncludeDir.ImGuizmo}"  --new adds file to project solution
      }

          links 
      {
          "GLFW",
          "ImGui",
          "opengl32.lib"
      }

      	filter "files:vendor/ImGuizmo/**.cpp"   --new adds file to project solution
	    flags { "NoPCH" }  

      filter "system:windows"
       cppdialect "C++17"
       staticruntime "On"
       systemversion "latest" --10.0.19041.0--

          defines
       {
           "HZ_PLATFORM_WINDOWS",  
           "HZ_BUILD_DLL"
       }

          flags
	   {
	  	    "MultiProcessorCompile"
       }

          postbuildcommands
       {
           ("{COPY} %{cfg.buildtarget.relpath} ../bin/"  .. outputdir .."/Sandbox")
       }

                filter "configurations:Debug"
         defines "ST_DEBUG"
         symbols "On"

                filter "configurations:Release"
         defines "ST_RELEASE"
         optimize "On"

                filter "configurations:Dist"
         defines "ST_DIST"
         optimize "On"

        project "Sandbox"
          location "Sandbox"
          kind "ConsoleApp"
          language "C++"

      targetdir ("bin/" .. outputdir .. "/%{prj.name}")
      objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

        files 
      {
          "%{prj.name}/SRC/**.h",
          "%{prj.name}/SRC/**.cpp",
      }

         includedirs 
      {
        "Engine/3dlibs/Spdlog/include",
        "Engine/SRC",
        "Engine/3dlibs/glm/glm" 
      }

         links
      {
         "Engine"
      }

      filter "system:windows"
       cppdialect "C++17"
       staticruntime "On"
       systemversion "latest"

          defines
       {
           "HZ_PLATFORM_WINDOWS" 
       }

                filter "configurations:Debug"
         defines "ST_DEBUG"
         symbols "On"

                filter "configurations:Release"
         defines "ST_RELEASE"
         optimize "On"

                filter "configurations:Dist"
         defines "ST_DIST"
         optimize "On"
