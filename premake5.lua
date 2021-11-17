workspace "Storm"
  architecture "x64"

  configurations
  {
  "Debug",
  "Release",
  "Dist"
  }

  outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

  project "Storm"
      location "Storm"
      kind "SharedLib"
      language "C++"

      targetdir ("bin/" .. outputdir .. "/%{prj.name}")
      objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

      files 
      {
          "%{prj.name}/SRC/**.h",
          "%{prj.name}/SRC/**.cpp"
      }

      includedirs
      {
        "%{prj.name}/SRC",
        "%{prj.name}/Storm/Events",
        "%{prj.name}/3dlibs/Spdlog/include" --remove Storm--
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
          "%{prj.name}/SRC/**.cpp"
      }

      includedirs 
      {
        "Storm/3dlibs/Spdlog/include",
        "Storm/SRC"
      }

      links
      {
         "Storm"
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
