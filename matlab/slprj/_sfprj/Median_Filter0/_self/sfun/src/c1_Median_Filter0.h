#ifndef __c1_Median_Filter0_h__
#define __c1_Median_Filter0_h__

/* Include files */
#include "sf_runtime/sfc_sf.h"
#include "sf_runtime/sfc_mex.h"
#include "rtwtypes.h"
#include "multiword_types.h"

/* Type Definitions */
#ifndef typedef_SFc1_Median_Filter0InstanceStruct
#define typedef_SFc1_Median_Filter0InstanceStruct

typedef struct {
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint32_T chartNumber;
  uint32_T instanceNumber;
  int32_T c1_sfEvent;
  boolean_T c1_isStable;
  boolean_T c1_doneDoubleBufferReInit;
  uint8_T c1_is_active_c1_Median_Filter0;
} SFc1_Median_Filter0InstanceStruct;

#endif                                 /*typedef_SFc1_Median_Filter0InstanceStruct*/

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray *sf_c1_Median_Filter0_get_eml_resolved_functions_info(void);

/* Function Definitions */
extern void sf_c1_Median_Filter0_get_check_sum(mxArray *plhs[]);
extern void c1_Median_Filter0_method_dispatcher(SimStruct *S, int_T method, void
  *data);

#endif
