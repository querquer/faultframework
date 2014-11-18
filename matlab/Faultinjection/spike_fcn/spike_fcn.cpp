#include <cstdio>
#include <string>
#include <stdio.h>
#include <iostream>
#include <fstream>
#include <vector>
#include <math.h>
#include <algorithm>

#include "spike_fcn.hpp"
#include "exprtk.hpp"
#include "rapidxml.hpp"

using namespace rapidxml;
using namespace std;


std::string getXMLFile(int xml_id)
{
	xml_document<> doc;
	xml_node<> * root_node;
	ifstream theFile ("injection_campaign.xml");

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


double calc(std::string expression_string, double init)
{   
    double x = double(init);
    
	exprtk::symbol_table<double> symbol_table;
	symbol_table.add_variable("x",x);

	exprtk::expression<double> expression;
	expression.register_symbol_table(symbol_table);

	exprtk::parser<double> parser;
	parser.compile(expression_string,expression);
	
	return expression.value();
	//printf("fcn(%g) = \t%g\n",x, expression.value());
}


double spike_fcn(int fault_id, int xml_id, double length, double timestep)
{
	double start_p = -1.0;
	double end_p = 1.0;
	// start parsing
	xml_document<> doc;
	xml_node<> * root_node;
	string xmlFile = getXMLFile(xml_id);
	ifstream theFile (xmlFile);

	if (!theFile.is_open())
		return 0;

	vector<char> buffer((istreambuf_iterator<char>(theFile)), istreambuf_iterator<char>());
	buffer.push_back('\0');
	doc.parse<0>(&buffer[0]);
	root_node = doc.first_node("injection");

	string func_str = "amplitude";
	string id_str = "id";
	string func_p = "";
	bool match = false;
	for (xml_node<> * fault_node = root_node->first_node("fault"); fault_node; fault_node = fault_node->next_sibling())
	{
		match = false;
	    for(xml_node<> * child_node = fault_node->first_node(); child_node; child_node = child_node->next_sibling())
	    {

			if(id_str.compare(child_node->name()) == 0)
				if(fault_id == atoi(child_node->value()))
					match = true;
			
			if(func_str.compare(child_node->name()) == 0 && match == true)
				func_p = child_node->value();
			
	    }
	}
	double norm_factor = 1/length; 
	double res = calc(func_p, timestep*norm_factor*2-1);
	return res;
}
