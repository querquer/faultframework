#include <cstdio>
#include <string>
#include <stdio.h>
#include <iostream>
#include <fstream>
#include <vector>
#include <math.h>
#include <algorithm>

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

double param_fcn(int fault_id, int param_id, int xml_id)
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
	string param_str = "param";
	string strValue = "";
	int count = 0;
	bool fit = 0;
	double param_d = 0.0;

	for (xml_node<> * fault_node = root_node->first_node("fault"); fault_node; fault_node = fault_node->next_sibling())
	{
		fit = 0;
	    for(xml_node<> * child_node = fault_node->first_node(); child_node; child_node = child_node->next_sibling())
	    {
			strValue = "";
			if(id_str.compare(child_node->name()) == 0)
				if(atoi(child_node->value()) == fault_id)
					fit = 1;
			
			if(fit == 1)
			{
				xml_attribute<> *pAttr = child_node->first_attribute("type");
				if(pAttr != 0)				
				{
					if(count == param_id)
					{
						strValue = pAttr->value();

						if(param_str.compare(strValue) == 0)
							param_d = atof(child_node->value());

					}
					++count;
				}
			}
	    }
	}

	return param_d;
}
