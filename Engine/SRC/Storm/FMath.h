#pragma once

#include <iostream>
#include <fstream>
#include <ctime>
#include <filesystem>
using namespace std;

void Getsystemtime() //gets system local time
{
	// current date/time based on current system
	time_t now = time(0);

	// convert now to string form
	char* dt = ctime(&now);

	//cout << "The local date and time is: " << dt << endl;
	ST_CORE_INFO(dt);


}

void Getsysteminfo() //gets system info like cpu and gpu model or windows version and ...
{


}

void Mklogfile(std::string Filename = "StormLog", std::string Message = "Message") //creates a folder and a log file insde with the timestamp and opens it
{

	// current date/time based on current system
	time_t now = time(0);

	// convert now to string form
	char* dt = ctime(&now);

	ofstream MyFile(Filename + dt + ".txt");

	string directory_name("Stormlog_dir"); //Create Directory

	std::filesystem::create_directory(directory_name) ?
		cout << "created directory - " << directory_name << endl :
		cout << "create_directory() failed dir exists" << endl;

	// Write to the file
	MyFile << Message;

	// Close the file
	MyFile.close();

	ST_CORE_INFO("Log File Created");
}

void Writelog()//writes to the chosen log file
{

}

void Readlog(std::string Filename = "StormLog")//reads chosen log file
{
	ifstream MyReadFile(Filename + ".txt");

	// Close the file
	MyReadFile.close();
}

void Closelog()//close the chosen log file
{


}

