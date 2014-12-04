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

double global_occ(int fault_id)
{
	// start parsing
	xml_document<> doc;
	xml_node<> * root_node;
	ifstream theFile;
    theFile.open("injection_campaign.xml",std::fstream::in | std::fstream::out | std::fstream::app);

	if (!theFile.is_open())
		return 0;

	vector<char> buffer((istreambuf_iterator<char>(theFile)), istreambuf_iterator<char>());
	buffer.push_back('\0');
	doc.parse<0>(&buffer[0]);
	root_node = doc.first_node("injection");

	
	double occ;
	int id;
	int act;
	for (xml_node<> * global_node = root_node->first_node("global"); global_node; global_node = global_node->next_sibling())
	{
	    for(xml_node<> * child_node = global_node->first_node(); child_node; child_node = child_node->next_sibling())
	    {
			// check for right id
			xml_attribute<> *pAttrId = child_node->first_attribute("id");
			if(pAttrId != 0)	
				id = atoi(pAttrId->value());

			xml_attribute<> *pAttrOcc = child_node->first_attribute("occ");
			if(pAttrOcc != 0)	
				occ = atof(pAttrOcc->value());

			xml_attribute<> *pAttrAct = child_node->first_attribute("activation");
			if(pAttrAct != 0)	
				act = atoi(pAttrAct->value());

			if(act == 1 && id == fault_id)
				return occ;

			if(act == 0 && id == fault_id)
				return 0.0;
	    }
	}

	return 0.0;
}
