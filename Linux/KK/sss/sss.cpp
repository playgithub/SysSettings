#include <string>
#include <iostream>
#include <sstream>
#include <cstdlib>

void show_usage()
{
	std::cout << "sss start/stop/restart" << std::endl;
}

int main(int argc, char * argv[])
{
	if (argc == 2)
	{
		std::string ip("0.0.0.0");
		unsigned int port = 6666;
		std::string pw("ssr224@@[]");
		std::string encryption_method("aes-256-cfb");
		std::string action(argv[1]);
		unsigned int time_out_in_seconds = 300;
		
		std::ostringstream cmd;
		cmd << "ssserver -s " << ip
			<< " -p " << port
			<< " -k " << pw
			<< " -m " << encryption_method
			<< " -t " << time_out_in_seconds
			<< " -d ";
		
		if (action == "start" || action == "stop" || action == "restart")
		{
			cmd << action;
			system(cmd.str().c_str());
		}
		else
			show_usage();
	}	
	else
		show_usage();
	
	return 0;
}