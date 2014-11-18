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

#include "exprtk.hpp"
#include "rapidxml.hpp"

using namespace rapidxml;
using namespace std;


int creatTable(string fileName)
{
	ifstream logFile (fileName);

	if(!logFile.is_open())
	{
		printf("unable to open file!");
		return -1;
	}

	double matrix[10][10];
	for(int i = 0; i < 10; ++i)
		for(int j = 0; j < 10; ++j)
			matrix[i][j] = 0;

	int trans_count = 0;
	string line;
	string str ("Fault:");	
	string fault_str;
	string fault_str_old = "";
	vector<string> fault_list;
	fault_list.push_back("");

	while ( getline(logFile,line) )
	{
		size_t found = line.find(str);

		string x;
		string temp;
		int size_old;
		fault_str = "";
		while(found != string::npos)
		{
			// looking for "Fault:"
			size_old = line.size();
			//printf("found at %i\t", found);
			found += 7;

			// get value of fault
			x = line.substr(found, 3);
			//printf("get Fault: %s\t", x.data());
			
			
			// check if already in fault_str
			size_t match = fault_str.find(x);
			if(match  == string::npos)
				fault_str.append(x);
			//printf("append Fault: %s\n", fault_str.data());


			// substring line of file
			temp = line.substr(found,( size_old - found ));
			found = temp.find(str);
			line=temp;
		}
		printf("fault_str: %s \n",fault_str.data());

		// add to fault_list if not already in
		bool in = false;
		for(int i = 0; i <fault_list.size(); ++i)
		{
			if(fault_list[i]  == fault_str)
				in = true;
		}
		if(in == false)
			fault_list.push_back(fault_str);

		// increase table
		int id_new, id_old;
		for(int i = 0; i <fault_list.size(); ++i)
		{
			if(fault_list[i] == fault_str)
				id_new = i;
			if(fault_list[i] == fault_str_old)
				id_old = i;
		}
		
		cout << id_new << " <- " << id_old << endl;

		matrix[id_new][id_old] += 1; 

		
		++trans_count;
		fault_str_old = fault_str;
	}
	printf("fault list: \n");
	for(int i = 0; i <fault_list.size(); ++i)
		cout << fault_list[i] << " ";
	cout << "\n";
	// ausgabe tabelle
	string outFileName = "";
	outFileName.append(fileName.substr(0,fileName.length()-4));
	outFileName.append("_transM.txt");
	ofstream outFile (outFileName);
	printf("ausgabe tabelle\n");
	for(int i = 0; i < 6; ++i)
	{
		for(int j = 0; j < 6; ++j)
		{
			cout << matrix[i][j] << " ";

			// transform from number to prob
			matrix[i][j] = matrix[i][j]/trans_count;
			outFile << matrix[i][j] << " ";
		}
		cout << "\n";
		outFile << "\n";
	}
	
	cout << "Ausgabe in " << outFileName << endl; 
	outFile.close();
	logFile.close();
	return 0;
}






int main()
{
	string fileName;
	cout << "Bitte geben sie den Namen des Log-Files an:\n";
	cin >> fileName;

	if(creatTable(fileName) == 0)
		cout << "creatTable() war erfolgreich\n";

	
	int i;
	cin >> i;

	return 0;
}

//int logger(int xml_id, double step, double value, double *act_bus, double *ampl_bus)
//{
//	fstream logFile;
//	time_t t = time(0);
//	struct tm * now = localtime( & t );
//
//	string fileName = "log/LOG_";
//	fileName.append(to_string((xml_id)));
//	fileName.append(".txt");
//
//	
//	logFile.open (fileName, fstream::in | fstream::out | fstream::app);
//	
//	vector<string> str_list;
//	str_list.push_back("vco");
// 	str_list.push_back("tco"); 
//	str_list.push_back("vcn"); 
//	str_list.push_back("tcn"); 
//	str_list.push_back("nco"); 
//	str_list.push_back("ncn"); 
//	str_list.push_back("out"); 
//	str_list.push_back("spi"); 
//	str_list.push_back("stz"); 
//	str_list.push_back("stx"); 
//	str_list.push_back("sat"); 
//	str_list.push_back("ncd"); 
//	str_list.push_back("tcd"); 
//	
//
//	// static log part
//	logFile << t << " SimStep: " << step << "\t" << "value: " << value << "\t"; 
//
//	// non static log part
//	for(int i = 0; i < 13; ++i)
//	{
//		if(act_bus[i] == 1)
//			logFile << " Fault: " << str_list[i] << "\t" << "Ampl: " << ampl_bus[i] << "\t"; 
//	}
//	logFile << "\n";
//	
//	logFile.close();
//	return 0;
//}

//int logger(int xml_id, double step, double value, double *act_bus, double *ampl_bus)
//{
//	fstream logFile;
//	time_t t = time(0);
//	struct tm * now = localtime( & t );
//
//	string fileName = "log/LOG_";
//	fileName.append(to_string((xml_id)));
//	fileName.append(".txt");
//
//	
//	logFile.open (fileName, fstream::in | fstream::out | fstream::app);
//	
//	vector<string> str_list;
//	str_list.push_back("vco");
// 	str_list.push_back("tco"); 
//	str_list.push_back("vcn"); 
//	str_list.push_back("tcn"); 
//	str_list.push_back("nco"); 
//	str_list.push_back("ncn"); 
//	str_list.push_back("out"); 
//	str_list.push_back("spi"); 
//	str_list.push_back("stz"); 
//	str_list.push_back("stx"); 
//	str_list.push_back("sat"); 
//	str_list.push_back("ncd"); 
//	str_list.push_back("tcd"); 
//	
//	// check double entries
//    if(logFile.is_open()) {
//        logFile.seekg(-1,ios_base::end);                
//
//        bool keepLooping = true;
//        while(keepLooping) {
//            char ch;
//            logFile.get(ch);                           
//
//            if((int)logFile.tellg() <= 1) {             
//                logFile.seekg(0);                       
//                keepLooping = false;                
//            }
//            else if(ch == '\n') {                   
//                keepLooping = false;               
//            }
//            else {                                  
//                logFile.seekg(-2,ios_base::cur);       
//            }
//        }
//
//        string lastLine; 
//		string str_ss = "SimStep";
//		string str_v = "Value";
//		int start;
//        getline(logFile,lastLine);                      
//
//		size_t found = lastLine.find(str_ss);
//		if(found != string::npos)
//		{
//			start = found+8;
//			found = lastLine.find(str_v);
//			if(found != string::npos)
//			{
//				string old_simstep = lastLine.substr(start, (found - start));
//				char * temp = new char[old_simstep.size() + 1];
//				copy(old_simstep.begin(), old_simstep.end(), temp);
//				temp[old_simstep.size()] = '\0'; 
//				double old_simstep_d = atof(temp);
//				delete[] temp;
//				if(old_simstep_d == step)
//					return 0;
//			}
//		}
//
//		// static log part
//		logFile << "\n" << t << " SimStep: " << step << "\t" << "Value: " << value << "\t"; 
//
//		// non static log part
//		for(int i = 0; i < 13; ++i)
//		{
//			if(act_bus[i] == 1)
//				logFile << " Fault: " << str_list[i] << "\t" << "Ampl: " << ampl_bus[i] << "\t"; 
//		}
//		cout << "writed to file " << fileName << "\n";
//	
//		//logFile.close();
//    }
//
//	// static log part
//	logFile << "\n" << t << " SimStep: " << step << "\t" << "value: " << value << "\t"; 
//
//	// non static log part
//	for(int i = 0; i < 13; ++i)
//	{
//		if(act_bus[i] == 1)
//			logFile << " Fault: " << str_list[i] << "\t" << "Ampl: " << ampl_bus[i] << "\t"; 
//	}
//	cout << "writed to file " << fileName << "\n";
//	
//	logFile.close();
//
//	return 0;
//}


//
//void logger(int xml_id, double step, double value, int act_bus[], double ampl_bus[])
//{
//	printf("start logger\n");
//	fstream logFile;
//	time_t t = time(0);
//	struct tm * now = localtime( & t );
//
//	string fileName = "log/LOG_";
//	fileName.append(to_string((xml_id)));
//	fileName.append(".txt");
//
//	
//	logFile.open (fileName, fstream::in | fstream::out | fstream::app);
//	
//	vector<string> str_list;
//	str_list.push_back("vco");
// 	str_list.push_back("tco"); 
//	str_list.push_back("vcn"); 
//	str_list.push_back("tcn"); 
//	str_list.push_back("nco"); 
//	str_list.push_back("ncn"); 
//	str_list.push_back("out"); 
//	str_list.push_back("spi"); 
//	str_list.push_back("stz"); 
//	str_list.push_back("stx"); 
//	str_list.push_back("sat"); 
//	str_list.push_back("ncd"); 
//	str_list.push_back("tcd"); 
//	
//
//	// static log part
//	logFile << t << " SimStep: " << step << "\t" << "value: " << value << "\t"; 
//
//	// non static log part
//	for(int i = 0; i < 13; ++i)
//	{
//		if(act_bus[i] == 1)
//			logFile << " Fault: " << str_list[i] << "\t" << "Ampl: " << ampl_bus[i] << "\t"; 
//	}
//	logFile << "\n";
//	
//	logFile.close();
//}


	//	printf("start stop part\n");
	//	string line, match_str;

// cout << ( 1900 + now->tm_year ) << " " << ( 1 + now->tm_mon ) << " " << now->tm_mday << " " << now->tm_hour << " " << now->tm_min << " " << now->tm_sec << endl;  

	//	// fault_str
	//	string str ("Fault_str:");	
	//	while ( getline(logFile,line) )
	//	{
	//		size_t found = str.find(line);
	//		string x;
	//		if (found != string::npos)
	//		{
	//			printf("found at %i\n", found);
	//			//found += 12;
	//			x = line.substr(found, 2);
	//			printf("%s\n", x.data());
	//		}else
	//		{
	//			printf("not found\n");
	//		}		
	//		
	//	}

	//}
	//

//
//std::string getXMLFile(int xml_id)
//{
//	xml_document<> doc;
//	xml_node<> * root_node;
//	ifstream theFile ("injection_campaign.xml");
//
//	if (!theFile.is_open())
//		return "";
//
//	vector<char> buffer((istreambuf_iterator<char>(theFile)), istreambuf_iterator<char>());
//	buffer.push_back('\0');
//	doc.parse<0>(&buffer[0]);
//	root_node = doc.first_node("injection");
//
//	string id_str = "id";
//	string file_str = "file";
//	string xml_str = "";
//	int fit = 0;
//	for (xml_node<> * fault_node = root_node->first_node("campaign"); fault_node; fault_node = fault_node->next_sibling())
//	{
//		fit = 0;
//	    for(xml_node<> * child_node = fault_node->first_node(); child_node; child_node = child_node->next_sibling())
//	    {
//			if(id_str.compare(child_node->name()) == 0)
//				if(xml_id == atoi(child_node->value()))
//					fit = 1;
//			
//			if(fit == 1)
//				if(file_str.compare(child_node->name()) == 0)
//					xml_str = child_node->value();
//	    }
//	}
//
//	return xml_str;
//}
//
//
//double calc(std::string expression_string, double init)
//{   
//    double x = double(init);
//    
//	exprtk::symbol_table<double> symbol_table;
//	symbol_table.add_variable("x",x);
//
//	exprtk::expression<double> expression;
//	expression.register_symbol_table(symbol_table);
//
//	exprtk::parser<double> parser;
//	parser.compile(expression_string,expression);
//	
//	return expression.value();
//	//printf("fcn(%g) = \t%g\n",x, expression.value());
//}
//
//
//double pars_distr(int fault_id, int xml_id, double random_val)
//{
//	//printf("start parsFcn(%i, %i, %g)\n", fault_id, xml_id, random_val);
//	double val_min, val_max, step_size;
//
//	// start parsing
//	xml_document<> doc;
//	xml_node<> * root_node;
//	string xmlFile = getXMLFile(xml_id);
//	ifstream theFile (xmlFile);
//
//	if (!theFile.is_open())
//		return 0;
//
//	vector<char> buffer((istreambuf_iterator<char>(theFile)), istreambuf_iterator<char>());
//	buffer.push_back('\0');
//	doc.parse<0>(&buffer[0]);
//	root_node = doc.first_node("injection");
//
//	string attr_str = "pdf";
//	string label_str = "label";
//	string fault_str; 
//	string distr_str;
//	if(fault_id == 1)
//		fault_str = "const noise";
//	else if(fault_id == 2)
//		fault_str = "time correlated noise";
//	else 
//		fault_str = "value correlated noise";
//
//
//	for (xml_node<> * fault_node = root_node->first_node("fault"); fault_node; fault_node = fault_node->next_sibling())
//	{
//	    for(xml_node<> * child_node = fault_node->first_node(); child_node; child_node = child_node->next_sibling())
//	    {
//			if(label_str.compare(child_node->name()) == 0)
//				if(fault_str.compare(child_node->value()) != 0)
//					break;
//			
//			if(attr_str.compare(child_node->name()) == 0)
//				distr_str = child_node->value();
//			
//
//			xml_attribute<> *pAttrMin = child_node->first_attribute("min");
//			if(pAttrMin != 0)	
//				val_min = atof(pAttrMin->value());
//			
//			xml_attribute<> *pAttrMax = child_node->first_attribute("max");
//			if(pAttrMax != 0)
//				val_max = atof(pAttrMax->value());
//
//			xml_attribute<> *pAttrStep = child_node->first_attribute("step_size");
//			if(pAttrStep != 0)
//				step_size = atof(pAttrStep->value());
//	    }
//		
//	}
//	//printf("min: %g max:%g step_size: %g\n", val_min, val_max, step_size);
//
//	// build histrogram
//	vector<double> his;
//	int ind = 0;
//	double sum = 0;
//	double i = val_min;
//	for(; i <= val_max;)
//	{	
//		his.push_back(calc(distr_str, i));
//		//printf("%g\t %g\n", i, calc(distr_str, i));
//		++ind;
//		i=i+step_size;
//		sum = sum + calc(distr_str, i);
//	}
//	his.push_back(calc(distr_str, i));
//	//printf("%g\t %g\n", i, calc(distr_str, i));
//
//	double rnd_match = random_val * sum;
//	double sum_match = 0;
//	double ind_match;
//
//	// kleinste abfangen
//	if(rnd_match <= his.at(0))
//		return 0;
//
//	// search new random in histogram
//	//printf("sum: %g rnd_match: %g\n", sum, rnd_match);
//	for(unsigned int i = 0; i < his.size(); ++i)
//	{
//		sum_match = sum_match + his.at(i);
//		//printf("sum_match: %g ind: %i\n",sum_match, i);
//		if(rnd_match <= sum_match)
//		{
//			ind_match = i-1;
//			break;
//		}
//	}
//	//printf("ind_match: %g   his_size:%i \n", ind_match, his.size());
//	double rnd_new = ind_match/his.size();
//	return rnd_new;
//}