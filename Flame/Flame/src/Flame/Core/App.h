#pragma once


namespace Flame
{
	class App
	{
	private:
		App();
	public:
		App(const App& other) = delete;
		virtual ~App();

		void Run();

		static App* CreateApplication();
	private:
		static App* s_Instance;

		bool m_IsRunning;
	};
}
