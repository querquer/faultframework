#include <cstdio>
#include <string>
#include <stdio.h>
#include <iostream>
#include <fstream>
#include <vector>
#include <math.h>
#include <algorithm>

#include "schedule_fcn.hpp"
#include "exprtk.hpp"
#include "rapidxml.hpp"

using namespace rapidxml;
using namespace std;

std::string getXMLFile(int xml_id)
{
	xml_document<> doc;
	xml_node<> * root_node;
	ifstream theFile;
    theFile.open("injection_campaign.xml",std::fstream::in | std::fstream::out | std::fstream::app);

	if (!theFile.is_open())
		return "";

	vector<char> buffer((istreambuf_iterator<char>(theFile)), istreambuf_iterator<char>());
	buffer.push_back('\0');
	doc.parse<0>(&buffer[0]);
	root_node = doc.first_node("injection");

	string id_str = "id";
	string file_str = "file";
	string xml_str = "";
	int fit = 0;
	for (xml_node<> * fault_node = root_node->first_node("campaign"); fault_node; fault_node = fault_node->next_sibling())
	{
		fit = 0;
	    for(xml_node<> * child_node = fault_node->first_node(); child_node; child_node = child_node->next_sibling())
	    {
			if(id_str.compare(child_node->name()) == 0)
				if(xml_id == atoi(child_node->value()))
					fit = 1;
			
			if(fit == 1)
				if(file_str.compare(child_node->name()) == 0)
					xml_str = child_node->value();
	    }
	}

	return xml_str;
}

double occ_fcn(int fault_id, int xml_id)
{
	// start parsing
	xml_document<> doc;
	xml_node<> * root_node;
	string xml_file = getXMLFile(xml_id);
	ifstream theFile;
    theFile.open(xml_file.c_str(),std::fstream::in | std::fstream::out | std::fstream::app);

	if (!theFile.is_open())
		return 0;

	vector<char> buffer((istreambuf_iterator<char>(theFile)), istreambuf_iterator<char>());
	buffer.push_back('\0');
	doc.parse<0>(&buffer[0]);
	root_node = doc.first_node("injection");

	string id_str = "id";
	string occ_str = "occurrence";

	string temp = "";
	int perm; 
	double occ = 0.0;
	bool fit = 0;
	for (xml_node<> * fault_node = root_node->first_node("fault"); fault_node; fault_node = fault_node->next_sibling())
	{
		perm = 0;
		fit = 0;
	    for(xml_node<> * child_node = fault_node->first_node(); child_node; child_node = child_node->next_sibling())
	    {
			if(id_str.compare(child_node->name()) == 0)
				if(atoi(child_node->value()) == fault_id)
					fit = 1;

			if(occ_str.compare(child_node->name()) == 0 && fit == 1)
				occ = atof(child_node->value());
	    }
	}

	return occ;
}

//int main()
//{
//	double sampletime = 0.1;
//	double simlength = 10;
//	double simtime = 0;
//
//	int act;
//	for(int i = 0; i < (simlength/sampletime); ++i)
//	{
//		simtime = simtime + sampletime;
//		printf("start sim :: simlength: %g  simtime: %g\nact_schedule:", simlength, simtime);
//		for(int j = 0; j < 13; ++j)
//		{
//			act = schedule(simlength,  simtime, j);
//			printf("%i", act);
//		}
//		printf("\n");
//	}
//
//
//
//	//printf("\n act: %i\n", act);
//	int a;
//	cin >> a;
//	return 1;
//}