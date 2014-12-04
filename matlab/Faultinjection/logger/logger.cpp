#include <cstdio>
#include <string>
#include <stdio.h>
#include <iostream>
#include <fstream>
#include <vector>
#include <math.h>
#include <algorithm>
#include <time.h>
#include <ctime>

#ifdef __linux__
    #include <sstream>
#endif

using namespace std;


int logger(int xml_id, double step, double value, double *act_bus, double *ampl_bus)
{
	fstream logFile;
	time_t t = time(0);
	struct tm * now = localtime( & t );

	string fileName = "log/LOG_";
    
    #ifdef __linux__
        stringstream ss;
        ss << (long double)(xml_id);
        fileName.append(ss.str());
        fileName.append(".txt");
    #else
        fileName.append(to_string((long double)(xml_id)));
        fileName.append(".txt");
    #endif
	
	logFile.open (fileName.c_str(), fstream::in | fstream::out | fstream::app);
	
	vector<string> str_list;
	str_list.push_back("vco");
 	str_list.push_back("tco"); 
	str_list.push_back("vcn"); 
	str_list.push_back("tcn"); 
	str_list.push_back("nco"); 
	str_list.push_back("ncn"); 
	str_list.push_back("out"); 
	str_list.push_back("spi"); 
	str_list.push_back("stz"); 
	str_list.push_back("stx"); 
	str_list.push_back("sat"); 
	str_list.push_back("ncd"); 
	str_list.push_back("tcd"); 
	
	
	// static log part
	logFile << "\n" << now->tm_hour << now->tm_min << now->tm_sec << " SimStep: " << step << "\t" << "value: " << value << "\t"; 

	// non static log part
	for(int i = 0; i < 13; ++i)
	{
		if(act_bus[i] == 1)
			logFile << " Fault: " << str_list[i] << "\t" << "Ampl: " << ampl_bus[i] << "\t"; 
	}
	
	
	logFile.close();
	return 0;
}