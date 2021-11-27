#pragma once

#include "Core.h"

namespace Storm {
	class STORM_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	};

	// to be defined in client
	Application* CreateApplication();


}

