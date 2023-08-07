#include "Flame.h"


Flame::App* Flame::App::CreateApplication()
{
	return new App();
}