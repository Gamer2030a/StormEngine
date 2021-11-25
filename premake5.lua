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

      targetdir ("bin/" .. outputdir .. "/%{prj.name}")
      objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

      pchheader "STpch.h"
      pchsource "Engine/SRC/STpch.cpp"

      files 
      {
          "%{prj.name}/SRC/**.h",
          "%{prj.name}/SRC/**.cpp",
          "%{prj.name}/SRC/**.ini"
      }

      includedirs
      {
        "%{prj.name}/SRC",
        "%{prj.name}/Storm/Events",
        "%{prj.name}/3dlibs/Spdlog/include", --remove Storm--
        "%{prj.name}/3dlibs/glm/glm",
        "${IncludeDir.GLFW}"
      }

      links 
      {
          "GLFW",
          "opengl32.lib"
      }

      filter "system:windows"
       cppdialect "C++17"
       staticruntime "On"
       systemversion "latest" --10.0.19041.0--

       defines
       {
           "HZ_PLATFORM_WINDOWS",  --WAS HZ MADE IT ST--
           "HZ_BUILD_DLL"
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
        "Engine/3dlibs/glm/glm" --this--
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
           "HZ_PLATFORM_WINDOWS" --WAS HZ MADE IT ST--
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
