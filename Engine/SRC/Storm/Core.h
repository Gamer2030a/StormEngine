#pragma once
#ifdef HZ_PLATFORM_WINDOWS //WAS HZ MADE IT ST
  #ifdef HZ_BUILD_DLL //WAS HZ MADE IT ST
      #define STORM_API __declspec(dllexport)
   #else
      #define STORM_API __declspec(dllimport)
   #endif
 #else 
#error Storm only supports windows!
#endif
