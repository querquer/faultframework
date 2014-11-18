#ifndef _LOGGER_H_
#define _LOGGER_H_

//int logger(int xml_id, double step, double value, int act_bus[], double ampl_bus[]);
int logger(int xml_id, double step, double value, double *act_bus, double *ampl_bus);

#endif