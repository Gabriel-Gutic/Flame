#include "pchFlame.h"
#include "Logger.h"

#include "spdlog/sinks/stdout_color_sinks.h"


namespace Flame
{
	std::shared_ptr<spdlog::logger> Logger::s_Core = nullptr;
	std::shared_ptr<spdlog::logger> Logger::s_Client = nullptr;
	void Logger::Init()
	{
		s_Core = spdlog::stdout_color_mt("Flame");
		s_Client = spdlog::stdout_color_mt("Client");
	}

	std::shared_ptr<spdlog::logger> Logger::GetCore()
	{
		return s_Core;
	}

	std::shared_ptr<spdlog::logger> Logger::GetClient()
	{
		return s_Client;
	}
}


