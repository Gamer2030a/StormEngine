#pragma once
#include "CoreLogger.h"


#ifdef HZ_PLATFORM_WINDOWS

extern Storm::Application* Storm::CreateApplication();

int main(int argc, char** argv)
{
	Storm::Log::Init();
	ST_ERROR("Error");
	ST_FATAL("critical");
	ST_CORE_WARN("Warn");
	ST_CORE_INFO("Info");



	auto app = Storm::CreateApplication();
	app->Run();
	delete app;

	Getsystemtime();

}

#endif

