#pragma once

#include <memory>

#include "Core.h"
#include "spdlog/spdlog.h"

namespace Storm {
	class STORM_API Log
	{
	public:
		static void Init();

		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }

	private: 
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;

	};
}

//Core Log macros
#define ST_CORE_ERROR(...)   ::Storm::Log::GetCoreLogger()->error(__VA_ARGS__)
#define ST_CORE_WARN(...)    ::Storm::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define ST_CORE_INFO(...)    ::Storm::Log::GetCoreLogger()->info(__VA_ARGS__)
#define ST_CORE_TRACE(...)   ::Storm::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define ST_CORE_FATAL(...)   ::Storm::Log::GetCoreLogger()->critical(__VA_ARGS__)

//Client Log macros
#define ST_ERROR(...)        ::Storm::Log::GetClientLogger()->error(__VA_ARGS__)
#define ST_WARN(...)         ::Storm::Log::GetClientLogger()->warn(__VA_ARGS__)
#define ST_INFO(...)         ::Storm::Log::GetClientLogger()->info(__VA_ARGS__)
#define ST_TRACE(...)        ::Storm::Log::GetClientLogger()->trace(__VA_ARGS__)
#define ST_FATAL(...)        ::Storm::Log::GetClientLogger()->critical(__VA_ARGS__)



