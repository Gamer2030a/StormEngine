#pragma once

#include <iostream>
#include <fstream>
#include <ctime>
using namespace std;

void Getsystemtime() //gets system local time
{
	// current date/time based on current system
	time_t now = time(0);

	// convert now to string form
	char* dt = ctime(&now);

	cout << "The local date and time is: " << dt << endl;

	// convert now to tm struct for UTC
	tm* gmtm = gmtime(&now);
	dt = asctime(gmtm);
	cout << "The UTC date and time is:" << dt << endl;

}

void Getsysteminfo() //gets system info like cpu and gpu model or windows version and ...
{


}

void Mklogfile(std::string Filename = "StormLog", std::string Message = "Message", std::string Timestamp = "2022") //creates a folder and a log file insde with the timestamp and opens it
{
	ofstream MyFile(Filename + Timestamp + ".txt");

	// Write to the file
	MyFile << Message;

	// Close the file
	MyFile.close();

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

