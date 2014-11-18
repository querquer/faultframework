#include <matrix.h>
#include <mex.h>   
#include <iostream>
#include <cstdio>
#include <string>
#include <stdio.h>
#include <iostream>
#include <fstream>
#include <vector>

#include "pars_distr.hpp"
#include "rapidxml.hpp"
#include "exprtk.hpp"

using namespace rapidxml;
using namespace std;

/* Usage:
 * 1: const noise
 * 2: time correlated noise
 * 3: value correlated noise
 */

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

double pars_distr(int fault_id, int xml_id, double random_val)
{
	//printf("start parsFcn(%i, %i, %g)\n", fault_id, xml_id, random_val);
	double val_min, val_max, step_size;

	//start parsing
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

	string attr_str = "pdf";
	string label_str = "label";
	string fault_str; 
	string distr_str;
	if(fault_id == 1)
		fault_str = "const noise";
	else if(fault_id == 2)
		fault_str = "time correlated noise";
	else 
		fault_str = "value correlated noise";


	for (xml_node<> * fault_node = root_node->first_node("fault"); fault_node; fault_node = fault_node->next_sibling())
	{
	    for(xml_node<> * child_node = fault_node->first_node(); child_node; child_node = child_node->next_sibling())
	    {
			if(label_str.compare(child_node->name()) == 0)
				if(fault_str.compare(child_node->value()) != 0)
					break;
			
			if(attr_str.compare(child_node->name()) == 0)
				distr_str = child_node->value();
			

			xml_attribute<> *pAttrMin = child_node->first_attribute("min");
			if(pAttrMin != 0)	
				val_min = atof(pAttrMin->value());
			
			xml_attribute<> *pAttrMax = child_node->first_attribute("max");
			if(pAttrMax != 0)
				val_max = atof(pAttrMax->value());

			xml_attribute<> *pAttrStep = child_node->first_attribute("step_size");
			if(pAttrStep != 0)
				step_size = atof(pAttrStep->value());
	    }
		
	}
	//printf("min: %g max:%g step_size: %g\n", val_min, val_max, step_size);

	// build histrogram
	vector<double> his;
	int ind = 0;
	double sum = 0;
	double i = val_min;
	for(; i <= val_max;)
	{	
		his.push_back(calc(distr_str, i));
		//printf("%g\t %g\n", i, calc(distr_str, i));
		++ind;
		i=i+step_size;
		sum = sum + calc(distr_str, i);
	}
	his.push_back(calc(distr_str, i));
	//printf("%g\t %g\n", i, calc(distr_str, i));

	double rnd_match = random_val * sum;
	double sum_match = 0;
	double ind_match;

	// kleinste abfangen
	if(rnd_match <= his.at(0))
		return 0;

	// search new random in histogram
	//printf("sum: %g rnd_match: %g\n", sum, rnd_match);
	for(unsigned int i = 0; i < his.size(); ++i)
	{
		sum_match = sum_match + his.at(i);
		//printf("sum_match: %g ind: %i\n",sum_match, i);
		if(rnd_match <= sum_match)
		{
			ind_match = i-1;
			break;
		}
	}
	//printf("ind_match: %g   his_size:%i \n", ind_match, his.size());
	double rnd_new = ind_match/his.size();
	return rnd_new;
}

