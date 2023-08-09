#include "pchFlame.h"
#include "App.h"


int main(int argc, char* argv[])
{
	Flame::App* app = Flame::App::CreateApplication();

	app->Run();

	delete app;

	return 0;
}