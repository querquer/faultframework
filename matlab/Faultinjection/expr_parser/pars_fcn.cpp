#include <matrix.h>
#include <mex.h>   
#include <iostream>
#include <cstdio>
#include <string>
#include <stdio.h>
#include <iostream>
#include <fstream>
#include <vector>

#include "pars_fcn.hpp"
#include "rapidxml.hpp"
#include "exprtk.hpp"

using namespace rapidxml;
using namespace std;

/* Usage
 * 
 * fault_id 
 * 1 = time correlated offset
 * 2 = time correlated noise
 * 3 = time correlated delay
 */

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


void calc(double sampletime, double simlength, std::string expression_string, double* res, double init)
{   
    double x = double(init);
    
	exprtk::symbol_table<double> symbol_table;
	symbol_table.add_variable("x",x);

	exprtk::expression<double> expression;
	expression.register_symbol_table(symbol_table);

	exprtk::parser<double> parser;
	parser.compile(expression_string,expression);
	
	*res = expression.value();
	//printf("fcn(%g) = \t%g\n",x, expression.value());
}

double pars_fcn(double fault_id,double sampletime, double simlength, double init, int xml_id)
{
	//printf("start parsFcn(%g, %g, %g)\n", sampletime, simlength, init);
	double value = -1.0;
	double* res = &value;

	// start parsing
	xml_document<> doc;
	xml_node<> * root_node;
	string xml_file = getXMLFile(xml_id);
	ifstream theFile;
    theFile.open(xml_file.c_str(),std::fstream::in | std::fstream::out | std::fstream::app);


	if (!theFile.is_open())
		return value;

	vector<char> buffer((istreambuf_iterator<char>(theFile)), istreambuf_iterator<char>());
	buffer.push_back('\0');
	doc.parse<0>(&buffer[0]);
	root_node = doc.first_node("injection");

	string attr = "correlation";
	string label_str = "label";
	string fault_str; 
	if(fault_id == 1)
		fault_str = "time correlated offset";
	else if(fault_id == 2)
		fault_str = "time correlated noise";
	else 
		fault_str = "time correlated delay";

	for (xml_node<> * fault_node = root_node->first_node("fault"); fault_node; fault_node = fault_node->next_sibling())
	{
	    for(xml_node<> * child_node = fault_node->first_node(); child_node; child_node = child_node->next_sibling())
	    {
			if(label_str.compare(child_node->name()) == 0)
				if(fault_str.compare(child_node->value()) != 0)
					break;
			
			if(attr.compare(child_node->name()) == 0)
			{
                calc(sampletime, simlength, child_node->value(), res, init);
			}
	    }
	}

	return value;
}