#pragma once

#include "FMath.h"

#include "GLFW/glfw3.h"
//#include <3dlibs/glfw3.h>
//#include <glm/vec4.hpp>

#ifdef HZ_PLATFORM_WINDOWS

extern Storm::Application* Storm::CreateApplication();

int main(int argc, char** argv)
{
	Storm::Log::Init();
	//ST_ERROR("DA DA DAN");
	//ST_CORE_WARN("DA DA DAN");
	//ST_CORE_INFO("Uh oh");

	Getsystemtime();
	Mklogfile("Stormlog", "Log File Created");



	auto app = Storm::CreateApplication();
	app->Run();
	delete app;
	
}

#endif

