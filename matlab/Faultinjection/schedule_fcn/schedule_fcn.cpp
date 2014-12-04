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

struct compare 
{
    bool operator()(const string& first, const string& second) {
        return first.length() < second.length();
	}
} c;

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

int schedule_fcn(double simlength, double simtime, int fault_id, int xml_id)
{
	int FAULT_NUM = 13;
	// init array
	pair<string,string> * pairArr;
	pairArr = new pair<string,string> [FAULT_NUM];  
	pairArr [0] = make_pair("value correlated offset","A"); 
	pairArr [1] = make_pair("time correlated offset","B"); 
	pairArr [2] = make_pair("value correlated noise","C"); 
	pairArr [3] = make_pair("time correlated noise","D"); 
	pairArr [4] = make_pair("const offset","E"); 
	pairArr [5] = make_pair("const noise","F"); 
	pairArr [6] = make_pair("outlier","G"); 
	pairArr [7] = make_pair("spike","H"); 
	pairArr [8] = make_pair("stuck at zero","I"); 
	pairArr [9] = make_pair("stuck at x","J"); 
	pairArr [10] = make_pair("saturation","K"); 
	pairArr [11] = make_pair("const delay","L"); 
	pairArr [12] = make_pair("time correlated delay","M"); 



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

	xml_node<> * schedule_node = root_node->first_node("schedule");
	int sched_act = atoi(schedule_node->value());

	vector<string> t_set;
	vector<string> perm_set;
	string label_str = "label";
	string perm_str = "permanent";
	string act_str = "activation";
	string id_str = "id";
	string temp = "";
	int perm; 
	int act;
	bool match_id = false;
	for (xml_node<> * fault_node = root_node->first_node("fault"); fault_node; fault_node = fault_node->next_sibling())
	{
		perm = 0;
		act = 0;
	    for(xml_node<> * child_node = fault_node->first_node(); child_node; child_node = child_node->next_sibling())
	    {
			if(label_str.compare(child_node->name()) == 0)
				temp = child_node->value();

			if(act_str.compare(child_node->name()) == 0)
				act = atoi(child_node->value());
			
			
			if(perm_str.compare(child_node->name()) == 0)
				perm = atoi(child_node->value());

			if(id_str.compare(child_node->name()) == 0)
				if(fault_id == atoi(child_node->value()))
					match_id = true;		
	    }
		
		if(match_id == true && act == 1 && sched_act == 0)
			return 1;

		if(perm == 0 && act == 1)
			t_set.push_back(temp);
		
		if(perm == 1 && act == 1)
			perm_set.push_back(temp);
	}
	

	// sort labels alphabetical
	sort( t_set.begin(),t_set.end(),std::less<std::string>());
	sort( perm_set.begin(),perm_set.end(),std::less<std::string>());

	// replace label with terminal
	for(unsigned int i = 0; i < t_set.size(); ++i)
	{
		for(int j = 0; j < FAULT_NUM; ++j)
		{
			if(pairArr[j].first.compare(t_set[i].data()) == 0)
			{
				t_set.at(i) = pairArr[j].second.data();
				break;
			}
		}
	}
	for(unsigned int i = 0; i < perm_set.size(); ++i)
	{
		for(int j = 0; j < FAULT_NUM; ++j)
		{
			if(pairArr[j].first.compare(perm_set[i].data()) == 0)
			{
				perm_set.at(i) = pairArr[j].second.data();
				break;
			}
		}
	}

	// create power set out of the non permanent terminal set
	vector<string> p_set;
	p_set.push_back("");
	for(unsigned int i = 0; i < t_set.size(); ++i)
	{
		// menge verdoppeln
		vector<string> temp(p_set);
		unsigned int size = p_set.size();
		for(unsigned int j = 0; j < p_set.size(); ++j)
			temp.push_back(p_set.at(j));
		p_set = temp;

		// an die zweite h�lfte das i-te element anf�gen
		for(unsigned int j = 0; j < size; ++j)
			p_set.at(size+j).append(t_set.at(i));	
	}


	sort( p_set.begin(),p_set.end(), c);
	
	// include the permanent set into the power set
	string perm_t_str = "";
	for(unsigned int i = 0; i < perm_set.size(); ++i)
		perm_t_str.append(perm_set.at(i));

	for(unsigned int i = 0; i < p_set.size(); ++i)
	{
		p_set.at(i).append(perm_t_str);	
	}

	// match word with simtime
	double dis = simlength/ p_set.size();
	int tt = simtime/dis;
	
	if(tt >=  p_set.size())
		tt =  p_set.size()-1;
	string act_w = p_set[tt].data();

	
	size_t match;
	string temp_t;
	temp_t = pairArr[fault_id].second.data();
	match = act_w.find(temp_t);
	if(match != string::npos)
	{
		return 1;
	}
	
	return 0;
}

