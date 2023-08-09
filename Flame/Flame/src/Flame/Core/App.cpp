#include "pchFlame.h"
#include "App.h"


namespace Flame
{
	App* App::s_Instance = nullptr;
	App::App()
        :m_IsRunning(true)
	{
        FLAME_ASSERT(!s_Instance, "Flame App was already instantiated!");
	}

	App::~App()
	{
	}

	void App::Run()
	{
	}
}
