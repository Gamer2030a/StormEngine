
#include <Storm.h>
using namespace std;

class Sandbox : public Storm::Application
{
public:
	Sandbox()
	{

	}

	~Sandbox()
	{

	}
};

Storm::Application* Storm::CreateApplication()
{
	return new Sandbox();
}

