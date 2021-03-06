/* Include files */

#include <stddef.h>
#include "blas.h"
#include "Median_Filter_sfun.h"
#include "c1_Median_Filter.h"
#include "mwmathutil.h"
#define CHARTINSTANCE_CHARTNUMBER      (chartInstance->chartNumber)
#define CHARTINSTANCE_INSTANCENUMBER   (chartInstance->instanceNumber)
#include "Median_Filter_sfun_debug_macros.h"
#define _SF_MEX_LISTEN_FOR_CTRL_C(S)   sf_mex_listen_for_ctrl_c(sfGlobalDebugInstanceStruct,S);

/* Type Definitions */

/* Named Constants */
#define CALL_EVENT                     (-1)

/* Variable Declarations */

/* Variable Definitions */
static real_T _sfTime_;
static const char * c1_debug_family_names[9] = { "i", "test_vector", "nargin",
  "nargout", "data_in", "old_vector", "order", "new_vector", "data_out" };

/* Function Declarations */
static void initialize_c1_Median_Filter(SFc1_Median_FilterInstanceStruct
  *chartInstance);
static void initialize_params_c1_Median_Filter(SFc1_Median_FilterInstanceStruct *
  chartInstance);
static void enable_c1_Median_Filter(SFc1_Median_FilterInstanceStruct
  *chartInstance);
static void disable_c1_Median_Filter(SFc1_Median_FilterInstanceStruct
  *chartInstance);
static void c1_update_debugger_state_c1_Median_Filter
  (SFc1_Median_FilterInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c1_Median_Filter
  (SFc1_Median_FilterInstanceStruct *chartInstance);
static void set_sim_state_c1_Median_Filter(SFc1_Median_FilterInstanceStruct
  *chartInstance, const mxArray *c1_st);
static void finalize_c1_Median_Filter(SFc1_Median_FilterInstanceStruct
  *chartInstance);
static void sf_gateway_c1_Median_Filter(SFc1_Median_FilterInstanceStruct
  *chartInstance);
static void initSimStructsc1_Median_Filter(SFc1_Median_FilterInstanceStruct
  *chartInstance);
static void init_script_number_translation(uint32_T c1_machineNumber, uint32_T
  c1_chartNumber, uint32_T c1_instanceNumber);
static const mxArray *c1_sf_marshallOut(void *chartInstanceVoid, void *c1_inData);
static real_T c1_emlrt_marshallIn(SFc1_Median_FilterInstanceStruct
  *chartInstance, const mxArray *c1_data_out, const char_T *c1_identifier);
static real_T c1_b_emlrt_marshallIn(SFc1_Median_FilterInstanceStruct
  *chartInstance, const mxArray *c1_u, const emlrtMsgIdentifier *c1_parentId);
static void c1_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c1_mxArrayInData, const char_T *c1_varName, void *c1_outData);
static const mxArray *c1_b_sf_marshallOut(void *chartInstanceVoid, void
  *c1_inData);
static void c1_c_emlrt_marshallIn(SFc1_Median_FilterInstanceStruct
  *chartInstance, const mxArray *c1_new_vector, const char_T *c1_identifier,
  real_T c1_y[100]);
static void c1_d_emlrt_marshallIn(SFc1_Median_FilterInstanceStruct
  *chartInstance, const mxArray *c1_u, const emlrtMsgIdentifier *c1_parentId,
  real_T c1_y[100]);
static void c1_b_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c1_mxArrayInData, const char_T *c1_varName, void *c1_outData);
static const mxArray *c1_c_sf_marshallOut(void *chartInstanceVoid, real_T
  c1_inData_data[], int32_T c1_inData_sizes[2]);
static void c1_e_emlrt_marshallIn(SFc1_Median_FilterInstanceStruct
  *chartInstance, const mxArray *c1_u, const emlrtMsgIdentifier *c1_parentId,
  real_T c1_y_data[], int32_T c1_y_sizes[2]);
static void c1_c_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c1_mxArrayInData, const char_T *c1_varName, real_T c1_outData_data[], int32_T
  c1_outData_sizes[2]);
static void c1_info_helper(const mxArray **c1_info);
static const mxArray *c1_emlrt_marshallOut(const char * c1_u);
static const mxArray *c1_b_emlrt_marshallOut(const uint32_T c1_u);
static real_T c1_median(SFc1_Median_FilterInstanceStruct *chartInstance, real_T
  c1_x_data[], int32_T c1_x_sizes);
static void c1_eml_switch_helper(SFc1_Median_FilterInstanceStruct *chartInstance);
static void c1_eml_sort_idx(SFc1_Median_FilterInstanceStruct *chartInstance,
  real_T c1_x_data[], int32_T c1_x_sizes, int32_T c1_idx_data[], int32_T
  *c1_idx_sizes);
static const mxArray *c1_d_sf_marshallOut(void *chartInstanceVoid, void
  *c1_inData);
static int32_T c1_f_emlrt_marshallIn(SFc1_Median_FilterInstanceStruct
  *chartInstance, const mxArray *c1_u, const emlrtMsgIdentifier *c1_parentId);
static void c1_d_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c1_mxArrayInData, const char_T *c1_varName, void *c1_outData);
static uint8_T c1_g_emlrt_marshallIn(SFc1_Median_FilterInstanceStruct
  *chartInstance, const mxArray *c1_b_is_active_c1_Median_Filter, const char_T
  *c1_identifier);
static uint8_T c1_h_emlrt_marshallIn(SFc1_Median_FilterInstanceStruct
  *chartInstance, const mxArray *c1_u, const emlrtMsgIdentifier *c1_parentId);
static void init_dsm_address_info(SFc1_Median_FilterInstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c1_Median_Filter(SFc1_Median_FilterInstanceStruct
  *chartInstance)
{
  chartInstance->c1_sfEvent = CALL_EVENT;
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c1_is_active_c1_Median_Filter = 0U;
}

static void initialize_params_c1_Median_Filter(SFc1_Median_FilterInstanceStruct *
  chartInstance)
{
  (void)chartInstance;
}

static void enable_c1_Median_Filter(SFc1_Median_FilterInstanceStruct
  *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c1_Median_Filter(SFc1_Median_FilterInstanceStruct
  *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c1_update_debugger_state_c1_Median_Filter
  (SFc1_Median_FilterInstanceStruct *chartInstance)
{
  (void)chartInstance;
}

static const mxArray *get_sim_state_c1_Median_Filter
  (SFc1_Median_FilterInstanceStruct *chartInstance)
{
  const mxArray *c1_st;
  const mxArray *c1_y = NULL;
  real_T c1_hoistedGlobal;
  real_T c1_u;
  const mxArray *c1_b_y = NULL;
  int32_T c1_i0;
  real_T c1_b_u[100];
  const mxArray *c1_c_y = NULL;
  uint8_T c1_b_hoistedGlobal;
  uint8_T c1_c_u;
  const mxArray *c1_d_y = NULL;
  real_T *c1_data_out;
  real_T (*c1_new_vector)[100];
  c1_data_out = (real_T *)ssGetOutputPortSignal(chartInstance->S, 2);
  c1_new_vector = (real_T (*)[100])ssGetOutputPortSignal(chartInstance->S, 1);
  c1_st = NULL;
  c1_st = NULL;
  c1_y = NULL;
  sf_mex_assign(&c1_y, sf_mex_createcellmatrix(3, 1), false);
  c1_hoistedGlobal = *c1_data_out;
  c1_u = c1_hoistedGlobal;
  c1_b_y = NULL;
  sf_mex_assign(&c1_b_y, sf_mex_create("y", &c1_u, 0, 0U, 0U, 0U, 0), false);
  sf_mex_setcell(c1_y, 0, c1_b_y);
  for (c1_i0 = 0; c1_i0 < 100; c1_i0++) {
    c1_b_u[c1_i0] = (*c1_new_vector)[c1_i0];
  }

  c1_c_y = NULL;
  sf_mex_assign(&c1_c_y, sf_mex_create("y", c1_b_u, 0, 0U, 1U, 0U, 2, 1, 100),
                false);
  sf_mex_setcell(c1_y, 1, c1_c_y);
  c1_b_hoistedGlobal = chartInstance->c1_is_active_c1_Median_Filter;
  c1_c_u = c1_b_hoistedGlobal;
  c1_d_y = NULL;
  sf_mex_assign(&c1_d_y, sf_mex_create("y", &c1_c_u, 3, 0U, 0U, 0U, 0), false);
  sf_mex_setcell(c1_y, 2, c1_d_y);
  sf_mex_assign(&c1_st, c1_y, false);
  return c1_st;
}

static void set_sim_state_c1_Median_Filter(SFc1_Median_FilterInstanceStruct
  *chartInstance, const mxArray *c1_st)
{
  const mxArray *c1_u;
  real_T c1_dv0[100];
  int32_T c1_i1;
  real_T *c1_data_out;
  real_T (*c1_new_vector)[100];
  c1_data_out = (real_T *)ssGetOutputPortSignal(chartInstance->S, 2);
  c1_new_vector = (real_T (*)[100])ssGetOutputPortSignal(chartInstance->S, 1);
  chartInstance->c1_doneDoubleBufferReInit = true;
  c1_u = sf_mex_dup(c1_st);
  *c1_data_out = c1_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell
    (c1_u, 0)), "data_out");
  c1_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c1_u, 1)),
                        "new_vector", c1_dv0);
  for (c1_i1 = 0; c1_i1 < 100; c1_i1++) {
    (*c1_new_vector)[c1_i1] = c1_dv0[c1_i1];
  }

  chartInstance->c1_is_active_c1_Median_Filter = c1_g_emlrt_marshallIn
    (chartInstance, sf_mex_dup(sf_mex_getcell(c1_u, 2)),
     "is_active_c1_Median_Filter");
  sf_mex_destroy(&c1_u);
  c1_update_debugger_state_c1_Median_Filter(chartInstance);
  sf_mex_destroy(&c1_st);
}

static void finalize_c1_Median_Filter(SFc1_Median_FilterInstanceStruct
  *chartInstance)
{
  (void)chartInstance;
}

static void sf_gateway_c1_Median_Filter(SFc1_Median_FilterInstanceStruct
  *chartInstance)
{
  real_T c1_hoistedGlobal;
  real_T c1_b_hoistedGlobal;
  real_T c1_data_in;
  int32_T c1_i2;
  real_T c1_old_vector[100];
  real_T c1_order;
  uint32_T c1_debug_family_var_map[9];
  real_T c1_i;
  int32_T c1_test_vector_sizes[2];
  real_T c1_test_vector_data[100];
  real_T c1_nargin = 3.0;
  real_T c1_nargout = 2.0;
  real_T c1_new_vector[100];
  real_T c1_data_out;
  int32_T c1_i3;
  real_T c1_d0;
  int32_T c1_i4;
  int32_T c1_b_i;
  int32_T c1_iv0[2];
  int32_T c1_test_vector;
  int32_T c1_b_test_vector;
  int32_T c1_loop_ub;
  int32_T c1_i5;
  real_T c1_b_order;
  int32_T c1_i6;
  int32_T c1_c_i;
  int32_T c1_b_test_vector_sizes;
  int32_T c1_b_loop_ub;
  int32_T c1_i7;
  real_T c1_b_test_vector_data[100];
  int32_T c1_i8;
  int32_T c1_i9;
  int32_T c1_i10;
  real_T *c1_b_data_in;
  real_T *c1_c_order;
  real_T *c1_b_data_out;
  real_T (*c1_b_new_vector)[100];
  real_T (*c1_b_old_vector)[100];
  c1_b_data_out = (real_T *)ssGetOutputPortSignal(chartInstance->S, 2);
  c1_c_order = (real_T *)ssGetInputPortSignal(chartInstance->S, 2);
  c1_b_old_vector = (real_T (*)[100])ssGetInputPortSignal(chartInstance->S, 1);
  c1_b_new_vector = (real_T (*)[100])ssGetOutputPortSignal(chartInstance->S, 1);
  c1_b_data_in = (real_T *)ssGetInputPortSignal(chartInstance->S, 0);
  _SFD_SYMBOL_SCOPE_PUSH(0U, 0U);
  _sfTime_ = sf_get_time(chartInstance->S);
  _SFD_CC_CALL(CHART_ENTER_SFUNCTION_TAG, 0U, chartInstance->c1_sfEvent);
  _SFD_DATA_RANGE_CHECK(*c1_b_data_in, 0U);
  chartInstance->c1_sfEvent = CALL_EVENT;
  _SFD_CC_CALL(CHART_ENTER_DURING_FUNCTION_TAG, 0U, chartInstance->c1_sfEvent);
  c1_hoistedGlobal = *c1_b_data_in;
  c1_b_hoistedGlobal = *c1_c_order;
  c1_data_in = c1_hoistedGlobal;
  for (c1_i2 = 0; c1_i2 < 100; c1_i2++) {
    c1_old_vector[c1_i2] = (*c1_b_old_vector)[c1_i2];
  }

  c1_order = c1_b_hoistedGlobal;
  _SFD_SYMBOL_SCOPE_PUSH_EML(0U, 9U, 9U, c1_debug_family_names,
    c1_debug_family_var_map);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c1_i, 0U, c1_sf_marshallOut,
    c1_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_DYN_IMPORTABLE(c1_test_vector_data, (const int32_T *)
    &c1_test_vector_sizes, NULL, 0, 1, (void *)c1_c_sf_marshallOut, (void *)
    c1_c_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c1_nargin, 2U, c1_sf_marshallOut,
    c1_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c1_nargout, 3U, c1_sf_marshallOut,
    c1_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML(&c1_data_in, 4U, c1_sf_marshallOut);
  _SFD_SYMBOL_SCOPE_ADD_EML(c1_old_vector, 5U, c1_b_sf_marshallOut);
  _SFD_SYMBOL_SCOPE_ADD_EML(&c1_order, 6U, c1_sf_marshallOut);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(c1_new_vector, 7U, c1_b_sf_marshallOut,
    c1_b_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c1_data_out, 8U, c1_sf_marshallOut,
    c1_sf_marshallIn);
  CV_EML_FCN(0, 0);
  _SFD_EML_CALL(0U, chartInstance->c1_sfEvent, 5);
  CV_EML_IF(0, 1, 0, false);
  _SFD_EML_CALL(0U, chartInstance->c1_sfEvent, 8);
  for (c1_i3 = 0; c1_i3 < 100; c1_i3++) {
    c1_new_vector[c1_i3] = 0.0;
  }

  _SFD_EML_CALL(0U, chartInstance->c1_sfEvent, 9);
  c1_d0 = c1_order - 1.0;
  c1_i4 = (int32_T)c1_d0;
  _SFD_FOR_LOOP_VECTOR_CHECK(1.0, 1.0, c1_d0, mxDOUBLE_CLASS, c1_i4);
  c1_i = 1.0;
  c1_b_i = 0;
  while (c1_b_i <= c1_i4 - 1) {
    c1_i = 1.0 + (real_T)c1_b_i;
    CV_EML_FOR(0, 1, 0, 1);
    _SFD_EML_CALL(0U, chartInstance->c1_sfEvent, 10);
    c1_new_vector[_SFD_EML_ARRAY_BOUNDS_CHECK("new_vector", (int32_T)c1_i, 1,
      100, 1, 0) - 1] = c1_old_vector[_SFD_EML_ARRAY_BOUNDS_CHECK("old_vector",
      (int32_T)(c1_i + 1.0), 1, 100, 1, 0) - 1];
    c1_b_i++;
    _SF_MEX_LISTEN_FOR_CTRL_C(chartInstance->S);
  }

  CV_EML_FOR(0, 1, 0, 0);
  _SFD_EML_CALL(0U, chartInstance->c1_sfEvent, 15);
  c1_new_vector[_SFD_EML_ARRAY_BOUNDS_CHECK("new_vector", (int32_T)
    _SFD_INTEGER_CHECK("order", c1_order), 1, 100, 1, 0) - 1] = c1_data_in;
  _SFD_EML_CALL(0U, chartInstance->c1_sfEvent, 17);
  c1_test_vector_sizes[0] = 1;
  c1_iv0[0] = 1;
  c1_iv0[1] = (int32_T)c1_order;
  c1_test_vector_sizes[1] = c1_iv0[1];
  c1_test_vector = c1_test_vector_sizes[0];
  c1_b_test_vector = c1_test_vector_sizes[1];
  c1_loop_ub = (int32_T)c1_order - 1;
  for (c1_i5 = 0; c1_i5 <= c1_loop_ub; c1_i5++) {
    c1_test_vector_data[c1_i5] = 0.0;
  }

  _SFD_EML_CALL(0U, chartInstance->c1_sfEvent, 18);
  c1_b_order = c1_order;
  c1_i6 = (int32_T)c1_b_order - 1;
  c1_i = 1.0;
  c1_c_i = 0;
  while (c1_c_i <= c1_i6) {
    c1_i = 1.0 + (real_T)c1_c_i;
    CV_EML_FOR(0, 1, 1, 1);
    _SFD_EML_CALL(0U, chartInstance->c1_sfEvent, 19);
    c1_test_vector_data[_SFD_EML_ARRAY_BOUNDS_CHECK("test_vector", (int32_T)c1_i,
      1, c1_test_vector_sizes[1], 1, 0) - 1] = c1_new_vector[(int32_T)c1_i - 1];
    c1_c_i++;
    _SF_MEX_LISTEN_FOR_CTRL_C(chartInstance->S);
  }

  CV_EML_FOR(0, 1, 1, 0);
  _SFD_EML_CALL(0U, chartInstance->c1_sfEvent, 22);
  c1_b_test_vector_sizes = c1_test_vector_sizes[1];
  c1_b_loop_ub = c1_test_vector_sizes[1] - 1;
  for (c1_i7 = 0; c1_i7 <= c1_b_loop_ub; c1_i7++) {
    c1_b_test_vector_data[c1_i7] = c1_test_vector_data[c1_i7];
  }

  c1_data_out = c1_median(chartInstance, c1_b_test_vector_data,
    c1_b_test_vector_sizes);
  _SFD_EML_CALL(0U, chartInstance->c1_sfEvent, -22);
  _SFD_SYMBOL_SCOPE_POP();
  for (c1_i8 = 0; c1_i8 < 100; c1_i8++) {
    (*c1_b_new_vector)[c1_i8] = c1_new_vector[c1_i8];
  }

  *c1_b_data_out = c1_data_out;
  _SFD_CC_CALL(EXIT_OUT_OF_FUNCTION_TAG, 0U, chartInstance->c1_sfEvent);
  _SFD_SYMBOL_SCOPE_POP();
  _SFD_CHECK_FOR_STATE_INCONSISTENCY(_Median_FilterMachineNumber_,
    chartInstance->chartNumber, chartInstance->instanceNumber);
  for (c1_i9 = 0; c1_i9 < 100; c1_i9++) {
    _SFD_DATA_RANGE_CHECK((*c1_b_new_vector)[c1_i9], 1U);
  }

  for (c1_i10 = 0; c1_i10 < 100; c1_i10++) {
    _SFD_DATA_RANGE_CHECK((*c1_b_old_vector)[c1_i10], 2U);
  }

  _SFD_DATA_RANGE_CHECK(*c1_c_order, 3U);
  _SFD_DATA_RANGE_CHECK(*c1_b_data_out, 4U);
}

static void initSimStructsc1_Median_Filter(SFc1_Median_FilterInstanceStruct
  *chartInstance)
{
  (void)chartInstance;
}

static void init_script_number_translation(uint32_T c1_machineNumber, uint32_T
  c1_chartNumber, uint32_T c1_instanceNumber)
{
  (void)c1_machineNumber;
  (void)c1_chartNumber;
  (void)c1_instanceNumber;
}

static const mxArray *c1_sf_marshallOut(void *chartInstanceVoid, void *c1_inData)
{
  const mxArray *c1_mxArrayOutData = NULL;
  real_T c1_u;
  const mxArray *c1_y = NULL;
  SFc1_Median_FilterInstanceStruct *chartInstance;
  chartInstance = (SFc1_Median_FilterInstanceStruct *)chartInstanceVoid;
  c1_mxArrayOutData = NULL;
  c1_u = *(real_T *)c1_inData;
  c1_y = NULL;
  sf_mex_assign(&c1_y, sf_mex_create("y", &c1_u, 0, 0U, 0U, 0U, 0), false);
  sf_mex_assign(&c1_mxArrayOutData, c1_y, false);
  return c1_mxArrayOutData;
}

static real_T c1_emlrt_marshallIn(SFc1_Median_FilterInstanceStruct
  *chartInstance, const mxArray *c1_data_out, const char_T *c1_identifier)
{
  real_T c1_y;
  emlrtMsgIdentifier c1_thisId;
  c1_thisId.fIdentifier = c1_identifier;
  c1_thisId.fParent = NULL;
  c1_y = c1_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c1_data_out),
    &c1_thisId);
  sf_mex_destroy(&c1_data_out);
  return c1_y;
}

static real_T c1_b_emlrt_marshallIn(SFc1_Median_FilterInstanceStruct
  *chartInstance, const mxArray *c1_u, const emlrtMsgIdentifier *c1_parentId)
{
  real_T c1_y;
  real_T c1_d1;
  (void)chartInstance;
  sf_mex_import(c1_parentId, sf_mex_dup(c1_u), &c1_d1, 1, 0, 0U, 0, 0U, 0);
  c1_y = c1_d1;
  sf_mex_destroy(&c1_u);
  return c1_y;
}

static void c1_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c1_mxArrayInData, const char_T *c1_varName, void *c1_outData)
{
  const mxArray *c1_data_out;
  const char_T *c1_identifier;
  emlrtMsgIdentifier c1_thisId;
  real_T c1_y;
  SFc1_Median_FilterInstanceStruct *chartInstance;
  chartInstance = (SFc1_Median_FilterInstanceStruct *)chartInstanceVoid;
  c1_data_out = sf_mex_dup(c1_mxArrayInData);
  c1_identifier = c1_varName;
  c1_thisId.fIdentifier = c1_identifier;
  c1_thisId.fParent = NULL;
  c1_y = c1_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c1_data_out),
    &c1_thisId);
  sf_mex_destroy(&c1_data_out);
  *(real_T *)c1_outData = c1_y;
  sf_mex_destroy(&c1_mxArrayInData);
}

static const mxArray *c1_b_sf_marshallOut(void *chartInstanceVoid, void
  *c1_inData)
{
  const mxArray *c1_mxArrayOutData = NULL;
  int32_T c1_i11;
  real_T c1_b_inData[100];
  int32_T c1_i12;
  real_T c1_u[100];
  const mxArray *c1_y = NULL;
  SFc1_Median_FilterInstanceStruct *chartInstance;
  chartInstance = (SFc1_Median_FilterInstanceStruct *)chartInstanceVoid;
  c1_mxArrayOutData = NULL;
  for (c1_i11 = 0; c1_i11 < 100; c1_i11++) {
    c1_b_inData[c1_i11] = (*(real_T (*)[100])c1_inData)[c1_i11];
  }

  for (c1_i12 = 0; c1_i12 < 100; c1_i12++) {
    c1_u[c1_i12] = c1_b_inData[c1_i12];
  }

  c1_y = NULL;
  sf_mex_assign(&c1_y, sf_mex_create("y", c1_u, 0, 0U, 1U, 0U, 2, 1, 100), false);
  sf_mex_assign(&c1_mxArrayOutData, c1_y, false);
  return c1_mxArrayOutData;
}

static void c1_c_emlrt_marshallIn(SFc1_Median_FilterInstanceStruct
  *chartInstance, const mxArray *c1_new_vector, const char_T *c1_identifier,
  real_T c1_y[100])
{
  emlrtMsgIdentifier c1_thisId;
  c1_thisId.fIdentifier = c1_identifier;
  c1_thisId.fParent = NULL;
  c1_d_emlrt_marshallIn(chartInstance, sf_mex_dup(c1_new_vector), &c1_thisId,
                        c1_y);
  sf_mex_destroy(&c1_new_vector);
}

static void c1_d_emlrt_marshallIn(SFc1_Median_FilterInstanceStruct
  *chartInstance, const mxArray *c1_u, const emlrtMsgIdentifier *c1_parentId,
  real_T c1_y[100])
{
  real_T c1_dv1[100];
  int32_T c1_i13;
  (void)chartInstance;
  sf_mex_import(c1_parentId, sf_mex_dup(c1_u), c1_dv1, 1, 0, 0U, 1, 0U, 2, 1,
                100);
  for (c1_i13 = 0; c1_i13 < 100; c1_i13++) {
    c1_y[c1_i13] = c1_dv1[c1_i13];
  }

  sf_mex_destroy(&c1_u);
}

static void c1_b_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c1_mxArrayInData, const char_T *c1_varName, void *c1_outData)
{
  const mxArray *c1_new_vector;
  const char_T *c1_identifier;
  emlrtMsgIdentifier c1_thisId;
  real_T c1_y[100];
  int32_T c1_i14;
  SFc1_Median_FilterInstanceStruct *chartInstance;
  chartInstance = (SFc1_Median_FilterInstanceStruct *)chartInstanceVoid;
  c1_new_vector = sf_mex_dup(c1_mxArrayInData);
  c1_identifier = c1_varName;
  c1_thisId.fIdentifier = c1_identifier;
  c1_thisId.fParent = NULL;
  c1_d_emlrt_marshallIn(chartInstance, sf_mex_dup(c1_new_vector), &c1_thisId,
                        c1_y);
  sf_mex_destroy(&c1_new_vector);
  for (c1_i14 = 0; c1_i14 < 100; c1_i14++) {
    (*(real_T (*)[100])c1_outData)[c1_i14] = c1_y[c1_i14];
  }

  sf_mex_destroy(&c1_mxArrayInData);
}

static const mxArray *c1_c_sf_marshallOut(void *chartInstanceVoid, real_T
  c1_inData_data[], int32_T c1_inData_sizes[2])
{
  const mxArray *c1_mxArrayOutData = NULL;
  int32_T c1_b_inData_sizes[2];
  int32_T c1_loop_ub;
  int32_T c1_i15;
  real_T c1_b_inData_data[100];
  int32_T c1_u_sizes[2];
  int32_T c1_b_loop_ub;
  int32_T c1_i16;
  real_T c1_u_data[100];
  const mxArray *c1_y = NULL;
  SFc1_Median_FilterInstanceStruct *chartInstance;
  chartInstance = (SFc1_Median_FilterInstanceStruct *)chartInstanceVoid;
  c1_mxArrayOutData = NULL;
  c1_b_inData_sizes[0] = 1;
  c1_b_inData_sizes[1] = c1_inData_sizes[1];
  c1_loop_ub = c1_inData_sizes[1] - 1;
  for (c1_i15 = 0; c1_i15 <= c1_loop_ub; c1_i15++) {
    c1_b_inData_data[c1_b_inData_sizes[0] * c1_i15] =
      c1_inData_data[c1_inData_sizes[0] * c1_i15];
  }

  c1_u_sizes[0] = 1;
  c1_u_sizes[1] = c1_b_inData_sizes[1];
  c1_b_loop_ub = c1_b_inData_sizes[1] - 1;
  for (c1_i16 = 0; c1_i16 <= c1_b_loop_ub; c1_i16++) {
    c1_u_data[c1_u_sizes[0] * c1_i16] = c1_b_inData_data[c1_b_inData_sizes[0] *
      c1_i16];
  }

  c1_y = NULL;
  sf_mex_assign(&c1_y, sf_mex_create("y", c1_u_data, 0, 0U, 1U, 0U, 2,
    c1_u_sizes[0], c1_u_sizes[1]), false);
  sf_mex_assign(&c1_mxArrayOutData, c1_y, false);
  return c1_mxArrayOutData;
}

static void c1_e_emlrt_marshallIn(SFc1_Median_FilterInstanceStruct
  *chartInstance, const mxArray *c1_u, const emlrtMsgIdentifier *c1_parentId,
  real_T c1_y_data[], int32_T c1_y_sizes[2])
{
  int32_T c1_i17;
  uint32_T c1_uv0[2];
  int32_T c1_i18;
  static boolean_T c1_bv0[2] = { false, true };

  boolean_T c1_bv1[2];
  int32_T c1_tmp_sizes[2];
  real_T c1_tmp_data[100];
  int32_T c1_y;
  int32_T c1_b_y;
  int32_T c1_loop_ub;
  int32_T c1_i19;
  (void)chartInstance;
  for (c1_i17 = 0; c1_i17 < 2; c1_i17++) {
    c1_uv0[c1_i17] = 1U + 99U * (uint32_T)c1_i17;
  }

  for (c1_i18 = 0; c1_i18 < 2; c1_i18++) {
    c1_bv1[c1_i18] = c1_bv0[c1_i18];
  }

  sf_mex_import_vs(c1_parentId, sf_mex_dup(c1_u), c1_tmp_data, 1, 0, 0U, 1, 0U,
                   2, c1_bv1, c1_uv0, c1_tmp_sizes);
  c1_y_sizes[0] = 1;
  c1_y_sizes[1] = c1_tmp_sizes[1];
  c1_y = c1_y_sizes[0];
  c1_b_y = c1_y_sizes[1];
  c1_loop_ub = c1_tmp_sizes[0] * c1_tmp_sizes[1] - 1;
  for (c1_i19 = 0; c1_i19 <= c1_loop_ub; c1_i19++) {
    c1_y_data[c1_i19] = c1_tmp_data[c1_i19];
  }

  sf_mex_destroy(&c1_u);
}

static void c1_c_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c1_mxArrayInData, const char_T *c1_varName, real_T c1_outData_data[], int32_T
  c1_outData_sizes[2])
{
  const mxArray *c1_test_vector;
  const char_T *c1_identifier;
  emlrtMsgIdentifier c1_thisId;
  int32_T c1_y_sizes[2];
  real_T c1_y_data[100];
  int32_T c1_loop_ub;
  int32_T c1_i20;
  SFc1_Median_FilterInstanceStruct *chartInstance;
  chartInstance = (SFc1_Median_FilterInstanceStruct *)chartInstanceVoid;
  c1_test_vector = sf_mex_dup(c1_mxArrayInData);
  c1_identifier = c1_varName;
  c1_thisId.fIdentifier = c1_identifier;
  c1_thisId.fParent = NULL;
  c1_e_emlrt_marshallIn(chartInstance, sf_mex_dup(c1_test_vector), &c1_thisId,
                        c1_y_data, c1_y_sizes);
  sf_mex_destroy(&c1_test_vector);
  c1_outData_sizes[0] = 1;
  c1_outData_sizes[1] = c1_y_sizes[1];
  c1_loop_ub = c1_y_sizes[1] - 1;
  for (c1_i20 = 0; c1_i20 <= c1_loop_ub; c1_i20++) {
    c1_outData_data[c1_outData_sizes[0] * c1_i20] = c1_y_data[c1_y_sizes[0] *
      c1_i20];
  }

  sf_mex_destroy(&c1_mxArrayInData);
}

const mxArray *sf_c1_Median_Filter_get_eml_resolved_functions_info(void)
{
  const mxArray *c1_nameCaptureInfo = NULL;
  c1_nameCaptureInfo = NULL;
  sf_mex_assign(&c1_nameCaptureInfo, sf_mex_createstruct("structure", 2, 48, 1),
                false);
  c1_info_helper(&c1_nameCaptureInfo);
  sf_mex_emlrtNameCapturePostProcessR2012a(&c1_nameCaptureInfo);
  return c1_nameCaptureInfo;
}

static void c1_info_helper(const mxArray **c1_info)
{
  const mxArray *c1_rhs0 = NULL;
  const mxArray *c1_lhs0 = NULL;
  const mxArray *c1_rhs1 = NULL;
  const mxArray *c1_lhs1 = NULL;
  const mxArray *c1_rhs2 = NULL;
  const mxArray *c1_lhs2 = NULL;
  const mxArray *c1_rhs3 = NULL;
  const mxArray *c1_lhs3 = NULL;
  const mxArray *c1_rhs4 = NULL;
  const mxArray *c1_lhs4 = NULL;
  const mxArray *c1_rhs5 = NULL;
  const mxArray *c1_lhs5 = NULL;
  const mxArray *c1_rhs6 = NULL;
  const mxArray *c1_lhs6 = NULL;
  const mxArray *c1_rhs7 = NULL;
  const mxArray *c1_lhs7 = NULL;
  const mxArray *c1_rhs8 = NULL;
  const mxArray *c1_lhs8 = NULL;
  const mxArray *c1_rhs9 = NULL;
  const mxArray *c1_lhs9 = NULL;
  const mxArray *c1_rhs10 = NULL;
  const mxArray *c1_lhs10 = NULL;
  const mxArray *c1_rhs11 = NULL;
  const mxArray *c1_lhs11 = NULL;
  const mxArray *c1_rhs12 = NULL;
  const mxArray *c1_lhs12 = NULL;
  const mxArray *c1_rhs13 = NULL;
  const mxArray *c1_lhs13 = NULL;
  const mxArray *c1_rhs14 = NULL;
  const mxArray *c1_lhs14 = NULL;
  const mxArray *c1_rhs15 = NULL;
  const mxArray *c1_lhs15 = NULL;
  const mxArray *c1_rhs16 = NULL;
  const mxArray *c1_lhs16 = NULL;
  const mxArray *c1_rhs17 = NULL;
  const mxArray *c1_lhs17 = NULL;
  const mxArray *c1_rhs18 = NULL;
  const mxArray *c1_lhs18 = NULL;
  const mxArray *c1_rhs19 = NULL;
  const mxArray *c1_lhs19 = NULL;
  const mxArray *c1_rhs20 = NULL;
  const mxArray *c1_lhs20 = NULL;
  const mxArray *c1_rhs21 = NULL;
  const mxArray *c1_lhs21 = NULL;
  const mxArray *c1_rhs22 = NULL;
  const mxArray *c1_lhs22 = NULL;
  const mxArray *c1_rhs23 = NULL;
  const mxArray *c1_lhs23 = NULL;
  const mxArray *c1_rhs24 = NULL;
  const mxArray *c1_lhs24 = NULL;
  const mxArray *c1_rhs25 = NULL;
  const mxArray *c1_lhs25 = NULL;
  const mxArray *c1_rhs26 = NULL;
  const mxArray *c1_lhs26 = NULL;
  const mxArray *c1_rhs27 = NULL;
  const mxArray *c1_lhs27 = NULL;
  const mxArray *c1_rhs28 = NULL;
  const mxArray *c1_lhs28 = NULL;
  const mxArray *c1_rhs29 = NULL;
  const mxArray *c1_lhs29 = NULL;
  const mxArray *c1_rhs30 = NULL;
  const mxArray *c1_lhs30 = NULL;
  const mxArray *c1_rhs31 = NULL;
  const mxArray *c1_lhs31 = NULL;
  const mxArray *c1_rhs32 = NULL;
  const mxArray *c1_lhs32 = NULL;
  const mxArray *c1_rhs33 = NULL;
  const mxArray *c1_lhs33 = NULL;
  const mxArray *c1_rhs34 = NULL;
  const mxArray *c1_lhs34 = NULL;
  const mxArray *c1_rhs35 = NULL;
  const mxArray *c1_lhs35 = NULL;
  const mxArray *c1_rhs36 = NULL;
  const mxArray *c1_lhs36 = NULL;
  const mxArray *c1_rhs37 = NULL;
  const mxArray *c1_lhs37 = NULL;
  const mxArray *c1_rhs38 = NULL;
  const mxArray *c1_lhs38 = NULL;
  const mxArray *c1_rhs39 = NULL;
  const mxArray *c1_lhs39 = NULL;
  const mxArray *c1_rhs40 = NULL;
  const mxArray *c1_lhs40 = NULL;
  const mxArray *c1_rhs41 = NULL;
  const mxArray *c1_lhs41 = NULL;
  const mxArray *c1_rhs42 = NULL;
  const mxArray *c1_lhs42 = NULL;
  const mxArray *c1_rhs43 = NULL;
  const mxArray *c1_lhs43 = NULL;
  const mxArray *c1_rhs44 = NULL;
  const mxArray *c1_lhs44 = NULL;
  const mxArray *c1_rhs45 = NULL;
  const mxArray *c1_lhs45 = NULL;
  const mxArray *c1_rhs46 = NULL;
  const mxArray *c1_lhs46 = NULL;
  const mxArray *c1_rhs47 = NULL;
  const mxArray *c1_lhs47 = NULL;
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(""), "context", "context", 0);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("isequal"), "name", "name", 0);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("double"), "dominantType",
                  "dominantType", 0);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/elmat/isequal.m"), "resolved",
                  "resolved", 0);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1286818758U), "fileTimeLo",
                  "fileTimeLo", 0);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 0);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 0);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 0);
  sf_mex_assign(&c1_rhs0, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs0, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs0), "rhs", "rhs", 0);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs0), "lhs", "lhs", 0);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/elmat/isequal.m"), "context",
                  "context", 1);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("eml_isequal_core"), "name",
                  "name", 1);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("double"), "dominantType",
                  "dominantType", 1);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_isequal_core.m"),
                  "resolved", "resolved", 1);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1286818786U), "fileTimeLo",
                  "fileTimeLo", 1);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 1);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 1);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 1);
  sf_mex_assign(&c1_rhs1, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs1, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs1), "rhs", "rhs", 1);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs1), "lhs", "lhs", 1);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(""), "context", "context", 2);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("median"), "name", "name", 2);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("double"), "dominantType",
                  "dominantType", 2);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/datafun/median.m"), "resolved",
                  "resolved", 2);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1363713856U), "fileTimeLo",
                  "fileTimeLo", 2);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 2);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 2);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 2);
  sf_mex_assign(&c1_rhs2, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs2, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs2), "rhs", "rhs", 2);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs2), "lhs", "lhs", 2);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/datafun/median.m"), "context",
                  "context", 3);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "coder.internal.isBuiltInNumeric"), "name", "name", 3);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("double"), "dominantType",
                  "dominantType", 3);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[IXE]$matlabroot$/toolbox/shared/coder/coder/+coder/+internal/isBuiltInNumeric.m"),
                  "resolved", "resolved", 3);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1363714556U), "fileTimeLo",
                  "fileTimeLo", 3);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 3);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 3);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 3);
  sf_mex_assign(&c1_rhs3, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs3, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs3), "rhs", "rhs", 3);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs3), "lhs", "lhs", 3);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/datafun/median.m"), "context",
                  "context", 4);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("isequal"), "name", "name", 4);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("double"), "dominantType",
                  "dominantType", 4);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/elmat/isequal.m"), "resolved",
                  "resolved", 4);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1286818758U), "fileTimeLo",
                  "fileTimeLo", 4);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 4);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 4);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 4);
  sf_mex_assign(&c1_rhs4, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs4, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs4), "rhs", "rhs", 4);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs4), "lhs", "lhs", 4);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/datafun/median.m"), "context",
                  "context", 5);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("eml_const_nonsingleton_dim"),
                  "name", "name", 5);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("double"), "dominantType",
                  "dominantType", 5);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_const_nonsingleton_dim.m"),
                  "resolved", "resolved", 5);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1372582416U), "fileTimeLo",
                  "fileTimeLo", 5);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 5);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 5);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 5);
  sf_mex_assign(&c1_rhs5, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs5, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs5), "rhs", "rhs", 5);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs5), "lhs", "lhs", 5);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_const_nonsingleton_dim.m"),
                  "context", "context", 6);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "coder.internal.constNonSingletonDim"), "name", "name", 6);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("double"), "dominantType",
                  "dominantType", 6);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[IXE]$matlabroot$/toolbox/shared/coder/coder/+coder/+internal/constNonSingletonDim.m"),
                  "resolved", "resolved", 6);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1372583160U), "fileTimeLo",
                  "fileTimeLo", 6);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 6);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 6);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 6);
  sf_mex_assign(&c1_rhs6, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs6, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs6), "rhs", "rhs", 6);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs6), "lhs", "lhs", 6);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/datafun/median.m"), "context",
                  "context", 7);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("eml_scalar_eg"), "name",
                  "name", 7);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("double"), "dominantType",
                  "dominantType", 7);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_scalar_eg.m"), "resolved",
                  "resolved", 7);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1375980688U), "fileTimeLo",
                  "fileTimeLo", 7);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 7);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 7);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 7);
  sf_mex_assign(&c1_rhs7, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs7, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs7), "rhs", "rhs", 7);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs7), "lhs", "lhs", 7);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_scalar_eg.m"), "context",
                  "context", 8);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("coder.internal.scalarEg"),
                  "name", "name", 8);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("double"), "dominantType",
                  "dominantType", 8);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[IXE]$matlabroot$/toolbox/coder/coder/+coder/+internal/scalarEg.p"),
                  "resolved", "resolved", 8);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1389307920U), "fileTimeLo",
                  "fileTimeLo", 8);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 8);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 8);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 8);
  sf_mex_assign(&c1_rhs8, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs8, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs8), "rhs", "rhs", 8);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs8), "lhs", "lhs", 8);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/datafun/median.m"), "context",
                  "context", 9);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("coder.internal.nan"), "name",
                  "name", 9);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("char"), "dominantType",
                  "dominantType", 9);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[IXE]$matlabroot$/toolbox/shared/coder/coder/+coder/+internal/nan.m"),
                  "resolved", "resolved", 9);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1362262032U), "fileTimeLo",
                  "fileTimeLo", 9);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 9);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 9);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 9);
  sf_mex_assign(&c1_rhs9, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs9, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs9), "rhs", "rhs", 9);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs9), "lhs", "lhs", 9);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/datafun/median.m!vectormedian"),
                  "context", "context", 10);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("eml_index_rdivide"), "name",
                  "name", 10);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("double"), "dominantType",
                  "dominantType", 10);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_index_rdivide.m"),
                  "resolved", "resolved", 10);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1372582416U), "fileTimeLo",
                  "fileTimeLo", 10);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 10);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 10);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 10);
  sf_mex_assign(&c1_rhs10, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs10, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs10), "rhs", "rhs",
                  10);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs10), "lhs", "lhs",
                  10);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_index_rdivide.m"),
                  "context", "context", 11);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("coder.internal.indexDivide"),
                  "name", "name", 11);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("double"), "dominantType",
                  "dominantType", 11);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[IXE]$matlabroot$/toolbox/shared/coder/coder/+coder/+internal/indexDivide.m"),
                  "resolved", "resolved", 11);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1372583160U), "fileTimeLo",
                  "fileTimeLo", 11);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 11);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 11);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 11);
  sf_mex_assign(&c1_rhs11, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs11, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs11), "rhs", "rhs",
                  11);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs11), "lhs", "lhs",
                  11);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/datafun/median.m!vectormedian"),
                  "context", "context", 12);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("eml_index_plus"), "name",
                  "name", 12);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("double"), "dominantType",
                  "dominantType", 12);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_index_plus.m"),
                  "resolved", "resolved", 12);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1372582416U), "fileTimeLo",
                  "fileTimeLo", 12);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 12);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 12);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 12);
  sf_mex_assign(&c1_rhs12, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs12, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs12), "rhs", "rhs",
                  12);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs12), "lhs", "lhs",
                  12);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_index_plus.m"), "context",
                  "context", 13);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("coder.internal.indexPlus"),
                  "name", "name", 13);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("double"), "dominantType",
                  "dominantType", 13);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[IXE]$matlabroot$/toolbox/shared/coder/coder/+coder/+internal/indexPlus.m"),
                  "resolved", "resolved", 13);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1372583160U), "fileTimeLo",
                  "fileTimeLo", 13);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 13);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 13);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 13);
  sf_mex_assign(&c1_rhs13, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs13, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs13), "rhs", "rhs",
                  13);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs13), "lhs", "lhs",
                  13);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/datafun/median.m!vectormedian"),
                  "context", "context", 14);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("eml_index_times"), "name",
                  "name", 14);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("double"), "dominantType",
                  "dominantType", 14);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_index_times.m"),
                  "resolved", "resolved", 14);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1372582416U), "fileTimeLo",
                  "fileTimeLo", 14);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 14);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 14);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 14);
  sf_mex_assign(&c1_rhs14, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs14, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs14), "rhs", "rhs",
                  14);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs14), "lhs", "lhs",
                  14);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_index_times.m"),
                  "context", "context", 15);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("coder.internal.indexTimes"),
                  "name", "name", 15);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("double"), "dominantType",
                  "dominantType", 15);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[IXE]$matlabroot$/toolbox/shared/coder/coder/+coder/+internal/indexTimes.m"),
                  "resolved", "resolved", 15);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1372583160U), "fileTimeLo",
                  "fileTimeLo", 15);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 15);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 15);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 15);
  sf_mex_assign(&c1_rhs15, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs15, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs15), "rhs", "rhs",
                  15);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs15), "lhs", "lhs",
                  15);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/datafun/median.m!vectormedian"),
                  "context", "context", 16);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("coder.internal.indexIntRelop"),
                  "name", "name", 16);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(""), "dominantType",
                  "dominantType", 16);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[IXE]$matlabroot$/toolbox/shared/coder/coder/+coder/+internal/indexIntRelop.m"),
                  "resolved", "resolved", 16);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1326728322U), "fileTimeLo",
                  "fileTimeLo", 16);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 16);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 16);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 16);
  sf_mex_assign(&c1_rhs16, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs16, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs16), "rhs", "rhs",
                  16);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs16), "lhs", "lhs",
                  16);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[IXE]$matlabroot$/toolbox/shared/coder/coder/+coder/+internal/indexIntRelop.m!apply_float_relop"),
                  "context", "context", 17);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("eml_switch_helper"), "name",
                  "name", 17);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(""), "dominantType",
                  "dominantType", 17);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_switch_helper.m"),
                  "resolved", "resolved", 17);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1381850300U), "fileTimeLo",
                  "fileTimeLo", 17);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 17);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 17);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 17);
  sf_mex_assign(&c1_rhs17, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs17, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs17), "rhs", "rhs",
                  17);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs17), "lhs", "lhs",
                  17);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[IXE]$matlabroot$/toolbox/shared/coder/coder/+coder/+internal/indexIntRelop.m!float_class_contains_indexIntClass"),
                  "context", "context", 18);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("eml_float_model"), "name",
                  "name", 18);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("char"), "dominantType",
                  "dominantType", 18);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_float_model.m"),
                  "resolved", "resolved", 18);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1326727996U), "fileTimeLo",
                  "fileTimeLo", 18);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 18);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 18);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 18);
  sf_mex_assign(&c1_rhs18, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs18, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs18), "rhs", "rhs",
                  18);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs18), "lhs", "lhs",
                  18);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[IXE]$matlabroot$/toolbox/shared/coder/coder/+coder/+internal/indexIntRelop.m!is_signed_indexIntClass"),
                  "context", "context", 19);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("intmin"), "name", "name", 19);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("char"), "dominantType",
                  "dominantType", 19);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/elmat/intmin.m"), "resolved",
                  "resolved", 19);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1362261882U), "fileTimeLo",
                  "fileTimeLo", 19);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 19);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 19);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 19);
  sf_mex_assign(&c1_rhs19, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs19, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs19), "rhs", "rhs",
                  19);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs19), "lhs", "lhs",
                  19);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/elmat/intmin.m"), "context",
                  "context", 20);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("eml_switch_helper"), "name",
                  "name", 20);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(""), "dominantType",
                  "dominantType", 20);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_switch_helper.m"),
                  "resolved", "resolved", 20);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1381850300U), "fileTimeLo",
                  "fileTimeLo", 20);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 20);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 20);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 20);
  sf_mex_assign(&c1_rhs20, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs20, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs20), "rhs", "rhs",
                  20);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs20), "lhs", "lhs",
                  20);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/datafun/median.m!vectormedian"),
                  "context", "context", 21);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("eml_sort_idx"), "name", "name",
                  21);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("double"), "dominantType",
                  "dominantType", 21);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_sort_idx.m"), "resolved",
                  "resolved", 21);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1305318004U), "fileTimeLo",
                  "fileTimeLo", 21);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 21);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 21);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 21);
  sf_mex_assign(&c1_rhs21, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs21, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs21), "rhs", "rhs",
                  21);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs21), "lhs", "lhs",
                  21);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_sort_idx.m"), "context",
                  "context", 22);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("eml_index_class"), "name",
                  "name", 22);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(""), "dominantType",
                  "dominantType", 22);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_index_class.m"),
                  "resolved", "resolved", 22);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1323170578U), "fileTimeLo",
                  "fileTimeLo", 22);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 22);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 22);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 22);
  sf_mex_assign(&c1_rhs22, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs22, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs22), "rhs", "rhs",
                  22);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs22), "lhs", "lhs",
                  22);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_sort_idx.m"), "context",
                  "context", 23);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("eml_index_plus"), "name",
                  "name", 23);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("coder.internal.indexInt"),
                  "dominantType", "dominantType", 23);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_index_plus.m"),
                  "resolved", "resolved", 23);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1372582416U), "fileTimeLo",
                  "fileTimeLo", 23);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 23);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 23);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 23);
  sf_mex_assign(&c1_rhs23, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs23, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs23), "rhs", "rhs",
                  23);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs23), "lhs", "lhs",
                  23);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_index_plus.m"), "context",
                  "context", 24);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("coder.internal.indexPlus"),
                  "name", "name", 24);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("coder.internal.indexInt"),
                  "dominantType", "dominantType", 24);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[IXE]$matlabroot$/toolbox/shared/coder/coder/+coder/+internal/indexPlus.m"),
                  "resolved", "resolved", 24);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1372583160U), "fileTimeLo",
                  "fileTimeLo", 24);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 24);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 24);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 24);
  sf_mex_assign(&c1_rhs24, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs24, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs24), "rhs", "rhs",
                  24);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs24), "lhs", "lhs",
                  24);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_sort_idx.m"), "context",
                  "context", 25);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "eml_int_forloop_overflow_check"), "name", "name", 25);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(""), "dominantType",
                  "dominantType", 25);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_int_forloop_overflow_check.m"),
                  "resolved", "resolved", 25);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1375980688U), "fileTimeLo",
                  "fileTimeLo", 25);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 25);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 25);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 25);
  sf_mex_assign(&c1_rhs25, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs25, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs25), "rhs", "rhs",
                  25);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs25), "lhs", "lhs",
                  25);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_int_forloop_overflow_check.m!eml_int_forloop_overflow_check_helper"),
                  "context", "context", 26);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("intmax"), "name", "name", 26);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("char"), "dominantType",
                  "dominantType", 26);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/elmat/intmax.m"), "resolved",
                  "resolved", 26);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1362261882U), "fileTimeLo",
                  "fileTimeLo", 26);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 26);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 26);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 26);
  sf_mex_assign(&c1_rhs26, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs26, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs26), "rhs", "rhs",
                  26);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs26), "lhs", "lhs",
                  26);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/elmat/intmax.m"), "context",
                  "context", 27);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("eml_switch_helper"), "name",
                  "name", 27);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(""), "dominantType",
                  "dominantType", 27);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_switch_helper.m"),
                  "resolved", "resolved", 27);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1381850300U), "fileTimeLo",
                  "fileTimeLo", 27);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 27);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 27);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 27);
  sf_mex_assign(&c1_rhs27, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs27, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs27), "rhs", "rhs",
                  27);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs27), "lhs", "lhs",
                  27);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_sort_idx.m"), "context",
                  "context", 28);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("eml_index_minus"), "name",
                  "name", 28);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("double"), "dominantType",
                  "dominantType", 28);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_index_minus.m"),
                  "resolved", "resolved", 28);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1372582416U), "fileTimeLo",
                  "fileTimeLo", 28);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 28);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 28);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 28);
  sf_mex_assign(&c1_rhs28, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs28, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs28), "rhs", "rhs",
                  28);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs28), "lhs", "lhs",
                  28);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_index_minus.m"),
                  "context", "context", 29);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("coder.internal.indexMinus"),
                  "name", "name", 29);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("double"), "dominantType",
                  "dominantType", 29);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[IXE]$matlabroot$/toolbox/shared/coder/coder/+coder/+internal/indexMinus.m"),
                  "resolved", "resolved", 29);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1372583160U), "fileTimeLo",
                  "fileTimeLo", 29);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 29);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 29);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 29);
  sf_mex_assign(&c1_rhs29, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs29, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs29), "rhs", "rhs",
                  29);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs29), "lhs", "lhs",
                  29);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_sort_idx.m"), "context",
                  "context", 30);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("eml_index_plus"), "name",
                  "name", 30);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("double"), "dominantType",
                  "dominantType", 30);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_index_plus.m"),
                  "resolved", "resolved", 30);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1372582416U), "fileTimeLo",
                  "fileTimeLo", 30);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 30);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 30);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 30);
  sf_mex_assign(&c1_rhs30, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs30, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs30), "rhs", "rhs",
                  30);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs30), "lhs", "lhs",
                  30);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_sort_idx.m"), "context",
                  "context", 31);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("eml_sort_le"), "name", "name",
                  31);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("double"), "dominantType",
                  "dominantType", 31);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_sort_le.m"), "resolved",
                  "resolved", 31);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1292190510U), "fileTimeLo",
                  "fileTimeLo", 31);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 31);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 31);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 31);
  sf_mex_assign(&c1_rhs31, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs31, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs31), "rhs", "rhs",
                  31);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs31), "lhs", "lhs",
                  31);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_sort_le.m!eml_sort_ascending_le"),
                  "context", "context", 32);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("eml_relop"), "name", "name",
                  32);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("function_handle"),
                  "dominantType", "dominantType", 32);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_relop.m"), "resolved",
                  "resolved", 32);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1342451182U), "fileTimeLo",
                  "fileTimeLo", 32);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 32);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 32);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 32);
  sf_mex_assign(&c1_rhs32, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs32, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs32), "rhs", "rhs",
                  32);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs32), "lhs", "lhs",
                  32);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_sort_le.m!eml_sort_ascending_le"),
                  "context", "context", 33);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("isnan"), "name", "name", 33);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("double"), "dominantType",
                  "dominantType", 33);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/elmat/isnan.m"), "resolved",
                  "resolved", 33);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1363713858U), "fileTimeLo",
                  "fileTimeLo", 33);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 33);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 33);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 33);
  sf_mex_assign(&c1_rhs33, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs33, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs33), "rhs", "rhs",
                  33);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs33), "lhs", "lhs",
                  33);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/elmat/isnan.m"), "context",
                  "context", 34);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "coder.internal.isBuiltInNumeric"), "name", "name", 34);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("double"), "dominantType",
                  "dominantType", 34);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[IXE]$matlabroot$/toolbox/shared/coder/coder/+coder/+internal/isBuiltInNumeric.m"),
                  "resolved", "resolved", 34);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1363714556U), "fileTimeLo",
                  "fileTimeLo", 34);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 34);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 34);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 34);
  sf_mex_assign(&c1_rhs34, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs34, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs34), "rhs", "rhs",
                  34);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs34), "lhs", "lhs",
                  34);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_sort_idx.m"), "context",
                  "context", 35);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("eml_index_times"), "name",
                  "name", 35);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("double"), "dominantType",
                  "dominantType", 35);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_index_times.m"),
                  "resolved", "resolved", 35);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1372582416U), "fileTimeLo",
                  "fileTimeLo", 35);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 35);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 35);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 35);
  sf_mex_assign(&c1_rhs35, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs35, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs35), "rhs", "rhs",
                  35);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs35), "lhs", "lhs",
                  35);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_sort_idx.m"), "context",
                  "context", 36);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("eml_index_minus"), "name",
                  "name", 36);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("coder.internal.indexInt"),
                  "dominantType", "dominantType", 36);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_index_minus.m"),
                  "resolved", "resolved", 36);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1372582416U), "fileTimeLo",
                  "fileTimeLo", 36);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 36);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 36);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 36);
  sf_mex_assign(&c1_rhs36, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs36, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs36), "rhs", "rhs",
                  36);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs36), "lhs", "lhs",
                  36);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_index_minus.m"),
                  "context", "context", 37);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("coder.internal.indexMinus"),
                  "name", "name", 37);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("coder.internal.indexInt"),
                  "dominantType", "dominantType", 37);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[IXE]$matlabroot$/toolbox/shared/coder/coder/+coder/+internal/indexMinus.m"),
                  "resolved", "resolved", 37);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1372583160U), "fileTimeLo",
                  "fileTimeLo", 37);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 37);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 37);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 37);
  sf_mex_assign(&c1_rhs37, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs37, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs37), "rhs", "rhs",
                  37);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs37), "lhs", "lhs",
                  37);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/datafun/median.m!vectormedian"),
                  "context", "context", 38);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("isnan"), "name", "name", 38);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("double"), "dominantType",
                  "dominantType", 38);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/elmat/isnan.m"), "resolved",
                  "resolved", 38);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1363713858U), "fileTimeLo",
                  "fileTimeLo", 38);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 38);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 38);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 38);
  sf_mex_assign(&c1_rhs38, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs38, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs38), "rhs", "rhs",
                  38);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs38), "lhs", "lhs",
                  38);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/datafun/median.m!meanof"),
                  "context", "context", 39);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("isinf"), "name", "name", 39);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("double"), "dominantType",
                  "dominantType", 39);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/elmat/isinf.m"), "resolved",
                  "resolved", 39);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1363713856U), "fileTimeLo",
                  "fileTimeLo", 39);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 39);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 39);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 39);
  sf_mex_assign(&c1_rhs39, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs39, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs39), "rhs", "rhs",
                  39);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs39), "lhs", "lhs",
                  39);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/elmat/isinf.m"), "context",
                  "context", 40);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "coder.internal.isBuiltInNumeric"), "name", "name", 40);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("double"), "dominantType",
                  "dominantType", 40);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[IXE]$matlabroot$/toolbox/shared/coder/coder/+coder/+internal/isBuiltInNumeric.m"),
                  "resolved", "resolved", 40);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1363714556U), "fileTimeLo",
                  "fileTimeLo", 40);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 40);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 40);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 40);
  sf_mex_assign(&c1_rhs40, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs40, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs40), "rhs", "rhs",
                  40);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs40), "lhs", "lhs",
                  40);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/datafun/median.m!meanof"),
                  "context", "context", 41);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("mrdivide"), "name", "name", 41);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("double"), "dominantType",
                  "dominantType", 41);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/ops/mrdivide.p"), "resolved",
                  "resolved", 41);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1388460096U), "fileTimeLo",
                  "fileTimeLo", 41);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 41);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1370009886U), "mFileTimeLo",
                  "mFileTimeLo", 41);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 41);
  sf_mex_assign(&c1_rhs41, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs41, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs41), "rhs", "rhs",
                  41);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs41), "lhs", "lhs",
                  41);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/ops/mrdivide.p"), "context",
                  "context", 42);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("coder.internal.assert"),
                  "name", "name", 42);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("char"), "dominantType",
                  "dominantType", 42);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[IXE]$matlabroot$/toolbox/shared/coder/coder/+coder/+internal/assert.m"),
                  "resolved", "resolved", 42);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1363714556U), "fileTimeLo",
                  "fileTimeLo", 42);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 42);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 42);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 42);
  sf_mex_assign(&c1_rhs42, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs42, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs42), "rhs", "rhs",
                  42);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs42), "lhs", "lhs",
                  42);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/ops/mrdivide.p"), "context",
                  "context", 43);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("rdivide"), "name", "name", 43);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("double"), "dominantType",
                  "dominantType", 43);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/ops/rdivide.m"), "resolved",
                  "resolved", 43);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1363713880U), "fileTimeLo",
                  "fileTimeLo", 43);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 43);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 43);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 43);
  sf_mex_assign(&c1_rhs43, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs43, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs43), "rhs", "rhs",
                  43);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs43), "lhs", "lhs",
                  43);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/ops/rdivide.m"), "context",
                  "context", 44);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "coder.internal.isBuiltInNumeric"), "name", "name", 44);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("double"), "dominantType",
                  "dominantType", 44);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[IXE]$matlabroot$/toolbox/shared/coder/coder/+coder/+internal/isBuiltInNumeric.m"),
                  "resolved", "resolved", 44);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1363714556U), "fileTimeLo",
                  "fileTimeLo", 44);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 44);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 44);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 44);
  sf_mex_assign(&c1_rhs44, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs44, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs44), "rhs", "rhs",
                  44);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs44), "lhs", "lhs",
                  44);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/ops/rdivide.m"), "context",
                  "context", 45);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("eml_scalexp_compatible"),
                  "name", "name", 45);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("double"), "dominantType",
                  "dominantType", 45);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_scalexp_compatible.m"),
                  "resolved", "resolved", 45);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1286818796U), "fileTimeLo",
                  "fileTimeLo", 45);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 45);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 45);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 45);
  sf_mex_assign(&c1_rhs45, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs45, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs45), "rhs", "rhs",
                  45);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs45), "lhs", "lhs",
                  45);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/ops/rdivide.m"), "context",
                  "context", 46);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("eml_div"), "name", "name", 46);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("double"), "dominantType",
                  "dominantType", 46);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_div.m"), "resolved",
                  "resolved", 46);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1375980688U), "fileTimeLo",
                  "fileTimeLo", 46);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 46);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 46);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 46);
  sf_mex_assign(&c1_rhs46, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs46, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs46), "rhs", "rhs",
                  46);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs46), "lhs", "lhs",
                  46);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_div.m"), "context",
                  "context", 47);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("coder.internal.div"), "name",
                  "name", 47);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut("double"), "dominantType",
                  "dominantType", 47);
  sf_mex_addfield(*c1_info, c1_emlrt_marshallOut(
    "[IXE]$matlabroot$/toolbox/coder/coder/+coder/+internal/div.p"), "resolved",
                  "resolved", 47);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(1389307920U), "fileTimeLo",
                  "fileTimeLo", 47);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 47);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 47);
  sf_mex_addfield(*c1_info, c1_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 47);
  sf_mex_assign(&c1_rhs47, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c1_lhs47, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_rhs47), "rhs", "rhs",
                  47);
  sf_mex_addfield(*c1_info, sf_mex_duplicatearraysafe(&c1_lhs47), "lhs", "lhs",
                  47);
  sf_mex_destroy(&c1_rhs0);
  sf_mex_destroy(&c1_lhs0);
  sf_mex_destroy(&c1_rhs1);
  sf_mex_destroy(&c1_lhs1);
  sf_mex_destroy(&c1_rhs2);
  sf_mex_destroy(&c1_lhs2);
  sf_mex_destroy(&c1_rhs3);
  sf_mex_destroy(&c1_lhs3);
  sf_mex_destroy(&c1_rhs4);
  sf_mex_destroy(&c1_lhs4);
  sf_mex_destroy(&c1_rhs5);
  sf_mex_destroy(&c1_lhs5);
  sf_mex_destroy(&c1_rhs6);
  sf_mex_destroy(&c1_lhs6);
  sf_mex_destroy(&c1_rhs7);
  sf_mex_destroy(&c1_lhs7);
  sf_mex_destroy(&c1_rhs8);
  sf_mex_destroy(&c1_lhs8);
  sf_mex_destroy(&c1_rhs9);
  sf_mex_destroy(&c1_lhs9);
  sf_mex_destroy(&c1_rhs10);
  sf_mex_destroy(&c1_lhs10);
  sf_mex_destroy(&c1_rhs11);
  sf_mex_destroy(&c1_lhs11);
  sf_mex_destroy(&c1_rhs12);
  sf_mex_destroy(&c1_lhs12);
  sf_mex_destroy(&c1_rhs13);
  sf_mex_destroy(&c1_lhs13);
  sf_mex_destroy(&c1_rhs14);
  sf_mex_destroy(&c1_lhs14);
  sf_mex_destroy(&c1_rhs15);
  sf_mex_destroy(&c1_lhs15);
  sf_mex_destroy(&c1_rhs16);
  sf_mex_destroy(&c1_lhs16);
  sf_mex_destroy(&c1_rhs17);
  sf_mex_destroy(&c1_lhs17);
  sf_mex_destroy(&c1_rhs18);
  sf_mex_destroy(&c1_lhs18);
  sf_mex_destroy(&c1_rhs19);
  sf_mex_destroy(&c1_lhs19);
  sf_mex_destroy(&c1_rhs20);
  sf_mex_destroy(&c1_lhs20);
  sf_mex_destroy(&c1_rhs21);
  sf_mex_destroy(&c1_lhs21);
  sf_mex_destroy(&c1_rhs22);
  sf_mex_destroy(&c1_lhs22);
  sf_mex_destroy(&c1_rhs23);
  sf_mex_destroy(&c1_lhs23);
  sf_mex_destroy(&c1_rhs24);
  sf_mex_destroy(&c1_lhs24);
  sf_mex_destroy(&c1_rhs25);
  sf_mex_destroy(&c1_lhs25);
  sf_mex_destroy(&c1_rhs26);
  sf_mex_destroy(&c1_lhs26);
  sf_mex_destroy(&c1_rhs27);
  sf_mex_destroy(&c1_lhs27);
  sf_mex_destroy(&c1_rhs28);
  sf_mex_destroy(&c1_lhs28);
  sf_mex_destroy(&c1_rhs29);
  sf_mex_destroy(&c1_lhs29);
  sf_mex_destroy(&c1_rhs30);
  sf_mex_destroy(&c1_lhs30);
  sf_mex_destroy(&c1_rhs31);
  sf_mex_destroy(&c1_lhs31);
  sf_mex_destroy(&c1_rhs32);
  sf_mex_destroy(&c1_lhs32);
  sf_mex_destroy(&c1_rhs33);
  sf_mex_destroy(&c1_lhs33);
  sf_mex_destroy(&c1_rhs34);
  sf_mex_destroy(&c1_lhs34);
  sf_mex_destroy(&c1_rhs35);
  sf_mex_destroy(&c1_lhs35);
  sf_mex_destroy(&c1_rhs36);
  sf_mex_destroy(&c1_lhs36);
  sf_mex_destroy(&c1_rhs37);
  sf_mex_destroy(&c1_lhs37);
  sf_mex_destroy(&c1_rhs38);
  sf_mex_destroy(&c1_lhs38);
  sf_mex_destroy(&c1_rhs39);
  sf_mex_destroy(&c1_lhs39);
  sf_mex_destroy(&c1_rhs40);
  sf_mex_destroy(&c1_lhs40);
  sf_mex_destroy(&c1_rhs41);
  sf_mex_destroy(&c1_lhs41);
  sf_mex_destroy(&c1_rhs42);
  sf_mex_destroy(&c1_lhs42);
  sf_mex_destroy(&c1_rhs43);
  sf_mex_destroy(&c1_lhs43);
  sf_mex_destroy(&c1_rhs44);
  sf_mex_destroy(&c1_lhs44);
  sf_mex_destroy(&c1_rhs45);
  sf_mex_destroy(&c1_lhs45);
  sf_mex_destroy(&c1_rhs46);
  sf_mex_destroy(&c1_lhs46);
  sf_mex_destroy(&c1_rhs47);
  sf_mex_destroy(&c1_lhs47);
}

static const mxArray *c1_emlrt_marshallOut(const char * c1_u)
{
  const mxArray *c1_y = NULL;
  c1_y = NULL;
  sf_mex_assign(&c1_y, sf_mex_create("y", c1_u, 15, 0U, 0U, 0U, 2, 1, strlen
    (c1_u)), false);
  return c1_y;
}

static const mxArray *c1_b_emlrt_marshallOut(const uint32_T c1_u)
{
  const mxArray *c1_y = NULL;
  c1_y = NULL;
  sf_mex_assign(&c1_y, sf_mex_create("y", &c1_u, 7, 0U, 0U, 0U, 0), false);
  return c1_y;
}

static real_T c1_median(SFc1_Median_FilterInstanceStruct *chartInstance, real_T
  c1_x_data[], int32_T c1_x_sizes)
{
  real_T c1_y;
  real_T c1_vlen;
  real_T c1_a;
  real_T c1_b_a;
  int32_T c1_i21;
  int32_T c1_midm1;
  int32_T c1_c_a;
  int32_T c1_d_a;
  int32_T c1_mid;
  int32_T c1_e_a;
  int32_T c1_f_a;
  int32_T c1_c;
  real_T c1_g_a;
  int32_T c1_b;
  real_T c1_h_a;
  int32_T c1_b_b;
  int32_T c1_idx;
  real_T c1_flt;
  boolean_T c1_evenlength;
  int32_T c1_b_x_sizes;
  int32_T c1_loop_ub;
  int32_T c1_i22;
  real_T c1_b_x_data[100];
  int32_T c1_idx_sizes;
  int32_T c1_idx_data[100];
  real_T c1_x;
  boolean_T c1_c_b;
  real_T c1_i_a;
  real_T c1_d_b;
  real_T c1_b_x;
  boolean_T c1_e_b;
  real_T c1_c_x;
  boolean_T c1_f_b;
  real_T c1_A;
  real_T c1_d_x;
  real_T c1_e_x;
  real_T c1_f_x;
  real_T c1_b_A;
  real_T c1_g_x;
  real_T c1_h_x;
  real_T c1_i_x;
  real_T c1_b_y;
  boolean_T guard1 = false;
  boolean_T guard2 = false;
  boolean_T guard3 = false;
  c1_vlen = (real_T)c1_x_sizes;
  c1_a = c1_vlen;
  c1_b_a = c1_a;
  c1_i21 = (int32_T)c1_b_a;
  c1_midm1 = (c1_i21 + (c1_i21 < 0)) >> 1;
  c1_c_a = c1_midm1;
  c1_d_a = c1_c_a + 1;
  c1_mid = c1_d_a;
  c1_e_a = c1_midm1;
  c1_f_a = c1_e_a;
  c1_c = c1_f_a << 1;
  c1_g_a = c1_vlen;
  c1_b = c1_c;
  c1_h_a = c1_g_a;
  c1_b_b = c1_b;
  c1_idx = c1_b_b;
  c1_flt = c1_h_a;
  c1_evenlength = ((real_T)c1_idx == c1_flt);
  c1_b_x_sizes = c1_x_sizes;
  c1_loop_ub = c1_x_sizes - 1;
  for (c1_i22 = 0; c1_i22 <= c1_loop_ub; c1_i22++) {
    c1_b_x_data[c1_i22] = c1_x_data[c1_i22];
  }

  c1_eml_sort_idx(chartInstance, c1_b_x_data, c1_b_x_sizes, c1_idx_data,
                  &c1_idx_sizes);
  c1_x = c1_x_data[_SFD_EML_ARRAY_BOUNDS_CHECK("",
    c1_idx_data[_SFD_EML_ARRAY_BOUNDS_CHECK("", c1_idx_sizes, 1, c1_idx_sizes, 1,
    0) - 1], 1, c1_x_sizes, 1, 0) - 1];
  c1_c_b = muDoubleScalarIsNaN(c1_x);
  if (c1_c_b) {
    c1_y = c1_x_data[_SFD_EML_ARRAY_BOUNDS_CHECK("",
      c1_idx_data[_SFD_EML_ARRAY_BOUNDS_CHECK("", c1_idx_sizes, 1, c1_idx_sizes,
      1, 0) - 1], 1, c1_x_sizes, 1, 0) - 1];
  } else if (c1_evenlength) {
    c1_i_a = c1_x_data[_SFD_EML_ARRAY_BOUNDS_CHECK("",
      c1_idx_data[_SFD_EML_ARRAY_BOUNDS_CHECK("", c1_midm1, 1, c1_idx_sizes, 1,
      0) - 1], 1, c1_x_sizes, 1, 0) - 1];
    c1_d_b = c1_x_data[_SFD_EML_ARRAY_BOUNDS_CHECK("",
      c1_idx_data[_SFD_EML_ARRAY_BOUNDS_CHECK("", c1_mid, 1, c1_idx_sizes, 1, 0)
      - 1], 1, c1_x_sizes, 1, 0) - 1];
    guard1 = false;
    guard2 = false;
    guard3 = false;
    if (c1_i_a < 0.0) {
      if (c1_d_b >= 0.0) {
        guard2 = true;
      } else {
        guard3 = true;
      }
    } else {
      guard3 = true;
    }

    if (guard3 == true) {
      c1_b_x = c1_i_a;
      c1_e_b = muDoubleScalarIsInf(c1_b_x);
      if (c1_e_b) {
        guard2 = true;
      } else {
        c1_c_x = c1_d_b;
        c1_f_b = muDoubleScalarIsInf(c1_c_x);
        if (c1_f_b) {
          guard1 = true;
        } else {
          c1_b_A = c1_d_b - c1_i_a;
          c1_g_x = c1_b_A;
          c1_h_x = c1_g_x;
          c1_i_x = c1_h_x;
          c1_b_y = c1_i_x / 2.0;
          c1_y = c1_i_a + c1_b_y;
        }
      }
    }

    if (guard2 == true) {
      guard1 = true;
    }

    if (guard1 == true) {
      c1_A = c1_i_a + c1_d_b;
      c1_d_x = c1_A;
      c1_e_x = c1_d_x;
      c1_f_x = c1_e_x;
      c1_y = c1_f_x / 2.0;
    }
  } else {
    c1_y = c1_x_data[_SFD_EML_ARRAY_BOUNDS_CHECK("",
      c1_idx_data[_SFD_EML_ARRAY_BOUNDS_CHECK("", c1_mid, 1, c1_idx_sizes, 1, 0)
      - 1], 1, c1_x_sizes, 1, 0) - 1];
  }

  return c1_y;
}

static void c1_eml_switch_helper(SFc1_Median_FilterInstanceStruct *chartInstance)
{
  (void)chartInstance;
}

static void c1_eml_sort_idx(SFc1_Median_FilterInstanceStruct *chartInstance,
  real_T c1_x_data[], int32_T c1_x_sizes, int32_T c1_idx_data[], int32_T
  *c1_idx_sizes)
{
  int32_T c1_n;
  real_T c1_dv2[2];
  int32_T c1_idx0_sizes;
  int32_T c1_loop_ub;
  int32_T c1_i23;
  int32_T c1_idx0_data[100];
  int32_T c1_a;
  int32_T c1_b_a;
  int32_T c1_np1;
  int32_T c1_b_n;
  int32_T c1_b;
  int32_T c1_b_b;
  int32_T c1_k;
  int32_T c1_b_k;
  int32_T c1_c_a;
  int32_T c1_d_a;
  int32_T c1_i24;
  int32_T c1_c_b;
  int32_T c1_d_b;
  int32_T c1_c_k;
  int32_T c1_e_a;
  int32_T c1_f_a;
  int32_T c1_c;
  int32_T c1_irow1;
  int32_T c1_irow2;
  real_T c1_g_a;
  real_T c1_e_b;
  real_T c1_h_a;
  real_T c1_f_b;
  boolean_T c1_p;
  real_T c1_x;
  boolean_T c1_g_b;
  boolean_T c1_b0;
  boolean_T c1_b_p;
  int32_T c1_i_a;
  int32_T c1_j_a;
  int32_T c1_b_c;
  int32_T c1_k_a;
  int32_T c1_l_a;
  int32_T c1_c_c;
  int32_T c1_b_loop_ub;
  int32_T c1_i25;
  int32_T c1_i;
  int32_T c1_m_a;
  int32_T c1_n_a;
  int32_T c1_i2;
  int32_T c1_j;
  int32_T c1_h_b;
  int32_T c1_i_b;
  int32_T c1_pEnd;
  int32_T c1_c_p;
  int32_T c1_q;
  int32_T c1_o_a;
  int32_T c1_j_b;
  int32_T c1_p_a;
  int32_T c1_k_b;
  int32_T c1_qEnd;
  int32_T c1_q_a;
  int32_T c1_l_b;
  int32_T c1_r_a;
  int32_T c1_m_b;
  int32_T c1_kEnd;
  int32_T c1_b_irow1;
  int32_T c1_b_irow2;
  real_T c1_s_a;
  real_T c1_n_b;
  real_T c1_t_a;
  real_T c1_o_b;
  boolean_T c1_d_p;
  real_T c1_b_x;
  boolean_T c1_p_b;
  boolean_T c1_b1;
  boolean_T c1_e_p;
  int32_T c1_u_a;
  int32_T c1_v_a;
  int32_T c1_w_a;
  int32_T c1_x_a;
  int32_T c1_y_a;
  int32_T c1_ab_a;
  int32_T c1_bb_a;
  int32_T c1_cb_a;
  int32_T c1_db_a;
  int32_T c1_eb_a;
  int32_T c1_fb_a;
  int32_T c1_gb_a;
  int32_T c1_hb_a;
  int32_T c1_ib_a;
  int32_T c1_jb_a;
  int32_T c1_kb_a;
  int32_T c1_b_kEnd;
  int32_T c1_q_b;
  int32_T c1_r_b;
  int32_T c1_d_k;
  int32_T c1_lb_a;
  int32_T c1_s_b;
  int32_T c1_mb_a;
  int32_T c1_t_b;
  int32_T c1_d_c;
  int32_T c1_nb_a;
  int32_T c1_u_b;
  int32_T c1_ob_a;
  int32_T c1_v_b;
  boolean_T guard1 = false;
  boolean_T guard2 = false;
  c1_n = c1_x_sizes;
  c1_dv2[0] = (real_T)c1_x_sizes;
  c1_dv2[1] = 1.0;
  c1_idx0_sizes = (int32_T)c1_dv2[0];
  c1_loop_ub = (int32_T)c1_dv2[0] - 1;
  for (c1_i23 = 0; c1_i23 <= c1_loop_ub; c1_i23++) {
    c1_idx0_data[c1_i23] = 0;
  }

  *c1_idx_sizes = c1_idx0_sizes;
  c1_a = c1_n;
  c1_b_a = c1_a + 1;
  c1_np1 = c1_b_a;
  c1_b_n = c1_n;
  c1_b = c1_b_n;
  c1_b_b = c1_b;
  if (1 > c1_b_b) {
  } else {
    c1_eml_switch_helper(chartInstance);
  }

  for (c1_k = 1; c1_k <= c1_b_n; c1_k++) {
    c1_b_k = c1_k;
    c1_idx_data[_SFD_EML_ARRAY_BOUNDS_CHECK("", c1_b_k, 1, *c1_idx_sizes, 1, 0)
      - 1] = c1_b_k;
  }

  c1_c_a = c1_n;
  c1_d_a = c1_c_a - 1;
  c1_i24 = c1_d_a;
  c1_c_b = c1_i24;
  c1_d_b = c1_c_b;
  if (1 > c1_d_b) {
  } else {
    c1_eml_switch_helper(chartInstance);
  }

  for (c1_c_k = 1; c1_c_k <= c1_i24; c1_c_k += 2) {
    c1_b_k = c1_c_k;
    c1_e_a = c1_b_k;
    c1_f_a = c1_e_a;
    c1_c = c1_f_a;
    c1_irow1 = c1_b_k;
    c1_irow2 = c1_c + 1;
    c1_g_a = c1_x_data[_SFD_EML_ARRAY_BOUNDS_CHECK("", c1_irow1, 1, c1_x_sizes,
      1, 0) - 1];
    c1_e_b = c1_x_data[_SFD_EML_ARRAY_BOUNDS_CHECK("", c1_irow2, 1, c1_x_sizes,
      1, 0) - 1];
    c1_h_a = c1_g_a;
    c1_f_b = c1_e_b;
    c1_p = (c1_h_a <= c1_f_b);
    guard2 = false;
    if (c1_p) {
      guard2 = true;
    } else {
      c1_x = c1_e_b;
      c1_g_b = muDoubleScalarIsNaN(c1_x);
      if (c1_g_b) {
        guard2 = true;
      } else {
        c1_b0 = false;
      }
    }

    if (guard2 == true) {
      c1_b0 = true;
    }

    c1_b_p = c1_b0;
    if (c1_b_p) {
    } else {
      c1_i_a = c1_b_k;
      c1_j_a = c1_i_a;
      c1_b_c = c1_j_a;
      c1_idx_data[_SFD_EML_ARRAY_BOUNDS_CHECK("", c1_b_k, 1, *c1_idx_sizes, 1, 0)
        - 1] = c1_b_c + 1;
      c1_k_a = c1_b_k;
      c1_l_a = c1_k_a;
      c1_c_c = c1_l_a;
      c1_idx_data[_SFD_EML_ARRAY_BOUNDS_CHECK("", c1_c_c + 1, 1, *c1_idx_sizes,
        1, 0) - 1] = c1_b_k;
    }
  }

  c1_idx0_sizes = c1_n;
  c1_b_loop_ub = c1_n - 1;
  for (c1_i25 = 0; c1_i25 <= c1_b_loop_ub; c1_i25++) {
    c1_idx0_data[c1_i25] = 1;
  }

  c1_i = 2;
  while (c1_i < c1_n) {
    c1_m_a = c1_i;
    c1_n_a = c1_m_a;
    c1_i2 = c1_n_a << 1;
    c1_j = 1;
    c1_h_b = c1_i;
    c1_i_b = c1_h_b + 1;
    for (c1_pEnd = c1_i_b; c1_pEnd < c1_np1; c1_pEnd = c1_ob_a + c1_v_b) {
      c1_c_p = c1_j;
      c1_q = c1_pEnd;
      c1_o_a = c1_j;
      c1_j_b = c1_i2;
      c1_p_a = c1_o_a;
      c1_k_b = c1_j_b;
      c1_qEnd = c1_p_a + c1_k_b;
      if (c1_qEnd > c1_np1) {
        c1_qEnd = c1_np1;
      }

      c1_b_k = 1;
      c1_q_a = c1_qEnd;
      c1_l_b = c1_j;
      c1_r_a = c1_q_a;
      c1_m_b = c1_l_b;
      c1_kEnd = c1_r_a - c1_m_b;
      while (c1_b_k <= c1_kEnd) {
        c1_b_irow1 = c1_idx_data[_SFD_EML_ARRAY_BOUNDS_CHECK("", c1_c_p, 1,
          *c1_idx_sizes, 1, 0) - 1];
        c1_b_irow2 = c1_idx_data[_SFD_EML_ARRAY_BOUNDS_CHECK("", c1_q, 1,
          *c1_idx_sizes, 1, 0) - 1];
        c1_s_a = c1_x_data[_SFD_EML_ARRAY_BOUNDS_CHECK("", c1_b_irow1, 1,
          c1_x_sizes, 1, 0) - 1];
        c1_n_b = c1_x_data[_SFD_EML_ARRAY_BOUNDS_CHECK("", c1_b_irow2, 1,
          c1_x_sizes, 1, 0) - 1];
        c1_t_a = c1_s_a;
        c1_o_b = c1_n_b;
        c1_d_p = (c1_t_a <= c1_o_b);
        guard1 = false;
        if (c1_d_p) {
          guard1 = true;
        } else {
          c1_b_x = c1_n_b;
          c1_p_b = muDoubleScalarIsNaN(c1_b_x);
          if (c1_p_b) {
            guard1 = true;
          } else {
            c1_b1 = false;
          }
        }

        if (guard1 == true) {
          c1_b1 = true;
        }

        c1_e_p = c1_b1;
        if (c1_e_p) {
          c1_idx0_data[_SFD_EML_ARRAY_BOUNDS_CHECK("", c1_b_k, 1, c1_idx0_sizes,
            1, 0) - 1] = c1_idx_data[_SFD_EML_ARRAY_BOUNDS_CHECK("", c1_c_p, 1, *
            c1_idx_sizes, 1, 0) - 1];
          c1_u_a = c1_c_p;
          c1_v_a = c1_u_a + 1;
          c1_c_p = c1_v_a;
          if (c1_c_p == c1_pEnd) {
            while (c1_q < c1_qEnd) {
              c1_w_a = c1_b_k;
              c1_x_a = c1_w_a + 1;
              c1_b_k = c1_x_a;
              c1_idx0_data[_SFD_EML_ARRAY_BOUNDS_CHECK("", c1_b_k, 1,
                c1_idx0_sizes, 1, 0) - 1] =
                c1_idx_data[_SFD_EML_ARRAY_BOUNDS_CHECK("", c1_q, 1,
                *c1_idx_sizes, 1, 0) - 1];
              c1_y_a = c1_q;
              c1_ab_a = c1_y_a + 1;
              c1_q = c1_ab_a;
            }
          }
        } else {
          c1_idx0_data[_SFD_EML_ARRAY_BOUNDS_CHECK("", c1_b_k, 1, c1_idx0_sizes,
            1, 0) - 1] = c1_idx_data[_SFD_EML_ARRAY_BOUNDS_CHECK("", c1_q, 1,
            *c1_idx_sizes, 1, 0) - 1];
          c1_bb_a = c1_q;
          c1_cb_a = c1_bb_a + 1;
          c1_q = c1_cb_a;
          if (c1_q == c1_qEnd) {
            while (c1_c_p < c1_pEnd) {
              c1_db_a = c1_b_k;
              c1_eb_a = c1_db_a + 1;
              c1_b_k = c1_eb_a;
              c1_idx0_data[_SFD_EML_ARRAY_BOUNDS_CHECK("", c1_b_k, 1,
                c1_idx0_sizes, 1, 0) - 1] =
                c1_idx_data[_SFD_EML_ARRAY_BOUNDS_CHECK("", c1_c_p, 1,
                *c1_idx_sizes, 1, 0) - 1];
              c1_fb_a = c1_c_p;
              c1_gb_a = c1_fb_a + 1;
              c1_c_p = c1_gb_a;
            }
          }
        }

        c1_hb_a = c1_b_k;
        c1_ib_a = c1_hb_a + 1;
        c1_b_k = c1_ib_a;
      }

      c1_jb_a = c1_j;
      c1_kb_a = c1_jb_a;
      c1_c_p = c1_kb_a;
      c1_b_kEnd = c1_kEnd;
      c1_q_b = c1_b_kEnd;
      c1_r_b = c1_q_b;
      if (1 > c1_r_b) {
      } else {
        c1_eml_switch_helper(chartInstance);
      }

      for (c1_d_k = 1; c1_d_k <= c1_b_kEnd; c1_d_k++) {
        c1_b_k = c1_d_k;
        c1_lb_a = c1_c_p - 1;
        c1_s_b = c1_b_k;
        c1_mb_a = c1_lb_a;
        c1_t_b = c1_s_b;
        c1_d_c = c1_mb_a + c1_t_b;
        c1_idx_data[_SFD_EML_ARRAY_BOUNDS_CHECK("", c1_d_c, 1, *c1_idx_sizes, 1,
          0) - 1] = c1_idx0_data[_SFD_EML_ARRAY_BOUNDS_CHECK("", c1_b_k, 1,
          c1_idx0_sizes, 1, 0) - 1];
      }

      c1_j = c1_qEnd;
      c1_nb_a = c1_j;
      c1_u_b = c1_i;
      c1_ob_a = c1_nb_a;
      c1_v_b = c1_u_b;
    }

    c1_i = c1_i2;
  }
}

static const mxArray *c1_d_sf_marshallOut(void *chartInstanceVoid, void
  *c1_inData)
{
  const mxArray *c1_mxArrayOutData = NULL;
  int32_T c1_u;
  const mxArray *c1_y = NULL;
  SFc1_Median_FilterInstanceStruct *chartInstance;
  chartInstance = (SFc1_Median_FilterInstanceStruct *)chartInstanceVoid;
  c1_mxArrayOutData = NULL;
  c1_u = *(int32_T *)c1_inData;
  c1_y = NULL;
  sf_mex_assign(&c1_y, sf_mex_create("y", &c1_u, 6, 0U, 0U, 0U, 0), false);
  sf_mex_assign(&c1_mxArrayOutData, c1_y, false);
  return c1_mxArrayOutData;
}

static int32_T c1_f_emlrt_marshallIn(SFc1_Median_FilterInstanceStruct
  *chartInstance, const mxArray *c1_u, const emlrtMsgIdentifier *c1_parentId)
{
  int32_T c1_y;
  int32_T c1_i26;
  (void)chartInstance;
  sf_mex_import(c1_parentId, sf_mex_dup(c1_u), &c1_i26, 1, 6, 0U, 0, 0U, 0);
  c1_y = c1_i26;
  sf_mex_destroy(&c1_u);
  return c1_y;
}

static void c1_d_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c1_mxArrayInData, const char_T *c1_varName, void *c1_outData)
{
  const mxArray *c1_b_sfEvent;
  const char_T *c1_identifier;
  emlrtMsgIdentifier c1_thisId;
  int32_T c1_y;
  SFc1_Median_FilterInstanceStruct *chartInstance;
  chartInstance = (SFc1_Median_FilterInstanceStruct *)chartInstanceVoid;
  c1_b_sfEvent = sf_mex_dup(c1_mxArrayInData);
  c1_identifier = c1_varName;
  c1_thisId.fIdentifier = c1_identifier;
  c1_thisId.fParent = NULL;
  c1_y = c1_f_emlrt_marshallIn(chartInstance, sf_mex_dup(c1_b_sfEvent),
    &c1_thisId);
  sf_mex_destroy(&c1_b_sfEvent);
  *(int32_T *)c1_outData = c1_y;
  sf_mex_destroy(&c1_mxArrayInData);
}

static uint8_T c1_g_emlrt_marshallIn(SFc1_Median_FilterInstanceStruct
  *chartInstance, const mxArray *c1_b_is_active_c1_Median_Filter, const char_T
  *c1_identifier)
{
  uint8_T c1_y;
  emlrtMsgIdentifier c1_thisId;
  c1_thisId.fIdentifier = c1_identifier;
  c1_thisId.fParent = NULL;
  c1_y = c1_h_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c1_b_is_active_c1_Median_Filter), &c1_thisId);
  sf_mex_destroy(&c1_b_is_active_c1_Median_Filter);
  return c1_y;
}

static uint8_T c1_h_emlrt_marshallIn(SFc1_Median_FilterInstanceStruct
  *chartInstance, const mxArray *c1_u, const emlrtMsgIdentifier *c1_parentId)
{
  uint8_T c1_y;
  uint8_T c1_u0;
  (void)chartInstance;
  sf_mex_import(c1_parentId, sf_mex_dup(c1_u), &c1_u0, 1, 3, 0U, 0, 0U, 0);
  c1_y = c1_u0;
  sf_mex_destroy(&c1_u);
  return c1_y;
}

static void init_dsm_address_info(SFc1_Median_FilterInstanceStruct
  *chartInstance)
{
  (void)chartInstance;
}

/* SFunction Glue Code */
#ifdef utFree
#undef utFree
#endif

#ifdef utMalloc
#undef utMalloc
#endif

#ifdef __cplusplus

extern "C" void *utMalloc(size_t size);
extern "C" void utFree(void*);

#else

extern void *utMalloc(size_t size);
extern void utFree(void*);

#endif

void sf_c1_Median_Filter_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(2794170232U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(3705196552U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(1272291882U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(2874305635U);
}

mxArray *sf_c1_Median_Filter_get_autoinheritance_info(void)
{
  const char *autoinheritanceFields[] = { "checksum", "inputs", "parameters",
    "outputs", "locals" };

  mxArray *mxAutoinheritanceInfo = mxCreateStructMatrix(1,1,5,
    autoinheritanceFields);

  {
    mxArray *mxChecksum = mxCreateString("rQ0XhHMsyjsJ5u8UIz96e");
    mxSetField(mxAutoinheritanceInfo,0,"checksum",mxChecksum);
  }

  {
    const char *dataFields[] = { "size", "type", "complexity" };

    mxArray *mxData = mxCreateStructMatrix(1,3,3,dataFields);

    {
      mxArray *mxSize = mxCreateDoubleMatrix(1,2,mxREAL);
      double *pr = mxGetPr(mxSize);
      pr[0] = (double)(1);
      pr[1] = (double)(1);
      mxSetField(mxData,0,"size",mxSize);
    }

    {
      const char *typeFields[] = { "base", "fixpt" };

      mxArray *mxType = mxCreateStructMatrix(1,1,2,typeFields);
      mxSetField(mxType,0,"base",mxCreateDoubleScalar(10));
      mxSetField(mxType,0,"fixpt",mxCreateDoubleMatrix(0,0,mxREAL));
      mxSetField(mxData,0,"type",mxType);
    }

    mxSetField(mxData,0,"complexity",mxCreateDoubleScalar(0));

    {
      mxArray *mxSize = mxCreateDoubleMatrix(1,2,mxREAL);
      double *pr = mxGetPr(mxSize);
      pr[0] = (double)(1);
      pr[1] = (double)(100);
      mxSetField(mxData,1,"size",mxSize);
    }

    {
      const char *typeFields[] = { "base", "fixpt" };

      mxArray *mxType = mxCreateStructMatrix(1,1,2,typeFields);
      mxSetField(mxType,0,"base",mxCreateDoubleScalar(10));
      mxSetField(mxType,0,"fixpt",mxCreateDoubleMatrix(0,0,mxREAL));
      mxSetField(mxData,1,"type",mxType);
    }

    mxSetField(mxData,1,"complexity",mxCreateDoubleScalar(0));

    {
      mxArray *mxSize = mxCreateDoubleMatrix(1,2,mxREAL);
      double *pr = mxGetPr(mxSize);
      pr[0] = (double)(1);
      pr[1] = (double)(1);
      mxSetField(mxData,2,"size",mxSize);
    }

    {
      const char *typeFields[] = { "base", "fixpt" };

      mxArray *mxType = mxCreateStructMatrix(1,1,2,typeFields);
      mxSetField(mxType,0,"base",mxCreateDoubleScalar(10));
      mxSetField(mxType,0,"fixpt",mxCreateDoubleMatrix(0,0,mxREAL));
      mxSetField(mxData,2,"type",mxType);
    }

    mxSetField(mxData,2,"complexity",mxCreateDoubleScalar(0));
    mxSetField(mxAutoinheritanceInfo,0,"inputs",mxData);
  }

  {
    mxSetField(mxAutoinheritanceInfo,0,"parameters",mxCreateDoubleMatrix(0,0,
                mxREAL));
  }

  {
    const char *dataFields[] = { "size", "type", "complexity" };

    mxArray *mxData = mxCreateStructMatrix(1,2,3,dataFields);

    {
      mxArray *mxSize = mxCreateDoubleMatrix(1,2,mxREAL);
      double *pr = mxGetPr(mxSize);
      pr[0] = (double)(1);
      pr[1] = (double)(100);
      mxSetField(mxData,0,"size",mxSize);
    }

    {
      const char *typeFields[] = { "base", "fixpt" };

      mxArray *mxType = mxCreateStructMatrix(1,1,2,typeFields);
      mxSetField(mxType,0,"base",mxCreateDoubleScalar(10));
      mxSetField(mxType,0,"fixpt",mxCreateDoubleMatrix(0,0,mxREAL));
      mxSetField(mxData,0,"type",mxType);
    }

    mxSetField(mxData,0,"complexity",mxCreateDoubleScalar(0));

    {
      mxArray *mxSize = mxCreateDoubleMatrix(1,2,mxREAL);
      double *pr = mxGetPr(mxSize);
      pr[0] = (double)(1);
      pr[1] = (double)(1);
      mxSetField(mxData,1,"size",mxSize);
    }

    {
      const char *typeFields[] = { "base", "fixpt" };

      mxArray *mxType = mxCreateStructMatrix(1,1,2,typeFields);
      mxSetField(mxType,0,"base",mxCreateDoubleScalar(10));
      mxSetField(mxType,0,"fixpt",mxCreateDoubleMatrix(0,0,mxREAL));
      mxSetField(mxData,1,"type",mxType);
    }

    mxSetField(mxData,1,"complexity",mxCreateDoubleScalar(0));
    mxSetField(mxAutoinheritanceInfo,0,"outputs",mxData);
  }

  {
    mxSetField(mxAutoinheritanceInfo,0,"locals",mxCreateDoubleMatrix(0,0,mxREAL));
  }

  return(mxAutoinheritanceInfo);
}

mxArray *sf_c1_Median_Filter_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c1_Median_Filter_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c1_Median_Filter(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  const char *infoEncStr[] = {
    "100 S1x3'type','srcId','name','auxInfo'{{M[1],M[9],T\"data_out\",},{M[1],M[5],T\"new_vector\",},{M[8],M[0],T\"is_active_c1_Median_Filter\",}}"
  };

  mxArray *mxVarInfo = sf_mex_decode_encoded_mx_struct_array(infoEncStr, 3, 10);
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c1_Median_Filter_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static void chart_debug_initialization(SimStruct *S, unsigned int
  fullDebuggerInitialization)
{
  if (!sim_mode_is_rtw_gen(S)) {
    SFc1_Median_FilterInstanceStruct *chartInstance;
    ChartRunTimeInfo * crtInfo = (ChartRunTimeInfo *)(ssGetUserData(S));
    ChartInfoStruct * chartInfo = (ChartInfoStruct *)(crtInfo->instanceInfo);
    chartInstance = (SFc1_Median_FilterInstanceStruct *)
      chartInfo->chartInstance;
    if (ssIsFirstInitCond(S) && fullDebuggerInitialization==1) {
      /* do this only if simulation is starting */
      {
        unsigned int chartAlreadyPresent;
        chartAlreadyPresent = sf_debug_initialize_chart
          (sfGlobalDebugInstanceStruct,
           _Median_FilterMachineNumber_,
           1,
           1,
           1,
           0,
           5,
           0,
           0,
           0,
           0,
           0,
           &(chartInstance->chartNumber),
           &(chartInstance->instanceNumber),
           (void *)S);

        /* Each instance must initialize ist own list of scripts */
        init_script_number_translation(_Median_FilterMachineNumber_,
          chartInstance->chartNumber,chartInstance->instanceNumber);
        if (chartAlreadyPresent==0) {
          /* this is the first instance */
          sf_debug_set_chart_disable_implicit_casting
            (sfGlobalDebugInstanceStruct,_Median_FilterMachineNumber_,
             chartInstance->chartNumber,1);
          sf_debug_set_chart_event_thresholds(sfGlobalDebugInstanceStruct,
            _Median_FilterMachineNumber_,
            chartInstance->chartNumber,
            0,
            0,
            0);
          _SFD_SET_DATA_PROPS(0,1,1,0,"data_in");
          _SFD_SET_DATA_PROPS(1,2,0,1,"new_vector");
          _SFD_SET_DATA_PROPS(2,1,1,0,"old_vector");
          _SFD_SET_DATA_PROPS(3,1,1,0,"order");
          _SFD_SET_DATA_PROPS(4,2,0,1,"data_out");
          _SFD_STATE_INFO(0,0,2);
          _SFD_CH_SUBSTATE_COUNT(0);
          _SFD_CH_SUBSTATE_DECOMP(0);
        }

        _SFD_CV_INIT_CHART(0,0,0,0);

        {
          _SFD_CV_INIT_STATE(0,0,0,0,0,0,NULL,NULL);
        }

        _SFD_CV_INIT_TRANS(0,0,NULL,NULL,0,NULL);

        /* Initialization of MATLAB Function Model Coverage */
        _SFD_CV_INIT_EML(0,1,1,1,0,0,0,2,0,0,0);
        _SFD_CV_INIT_EML_FCN(0,0,"eML_blk_kernel",0,-1,486);
        _SFD_CV_INIT_EML_IF(0,1,0,157,181,214,327);
        _SFD_CV_INIT_EML_FOR(0,1,0,256,274,322);
        _SFD_CV_INIT_EML_FOR(0,1,1,390,406,445);
        _SFD_SET_DATA_COMPILED_PROPS(0,SF_DOUBLE,0,NULL,0,0,0,0.0,1.0,0,0,
          (MexFcnForType)c1_sf_marshallOut,(MexInFcnForType)NULL);

        {
          unsigned int dimVector[2];
          dimVector[0]= 1;
          dimVector[1]= 100;
          _SFD_SET_DATA_COMPILED_PROPS(1,SF_DOUBLE,2,&(dimVector[0]),0,0,0,0.0,
            1.0,0,0,(MexFcnForType)c1_b_sf_marshallOut,(MexInFcnForType)
            c1_b_sf_marshallIn);
        }

        {
          unsigned int dimVector[2];
          dimVector[0]= 1;
          dimVector[1]= 100;
          _SFD_SET_DATA_COMPILED_PROPS(2,SF_DOUBLE,2,&(dimVector[0]),0,0,0,0.0,
            1.0,0,0,(MexFcnForType)c1_b_sf_marshallOut,(MexInFcnForType)NULL);
        }

        _SFD_SET_DATA_COMPILED_PROPS(3,SF_DOUBLE,0,NULL,0,0,0,0.0,1.0,0,0,
          (MexFcnForType)c1_sf_marshallOut,(MexInFcnForType)NULL);
        _SFD_SET_DATA_COMPILED_PROPS(4,SF_DOUBLE,0,NULL,0,0,0,0.0,1.0,0,0,
          (MexFcnForType)c1_sf_marshallOut,(MexInFcnForType)c1_sf_marshallIn);

        {
          real_T *c1_data_in;
          real_T *c1_order;
          real_T *c1_data_out;
          real_T (*c1_new_vector)[100];
          real_T (*c1_old_vector)[100];
          c1_data_out = (real_T *)ssGetOutputPortSignal(chartInstance->S, 2);
          c1_order = (real_T *)ssGetInputPortSignal(chartInstance->S, 2);
          c1_old_vector = (real_T (*)[100])ssGetInputPortSignal(chartInstance->S,
            1);
          c1_new_vector = (real_T (*)[100])ssGetOutputPortSignal
            (chartInstance->S, 1);
          c1_data_in = (real_T *)ssGetInputPortSignal(chartInstance->S, 0);
          _SFD_SET_DATA_VALUE_PTR(0U, c1_data_in);
          _SFD_SET_DATA_VALUE_PTR(1U, *c1_new_vector);
          _SFD_SET_DATA_VALUE_PTR(2U, *c1_old_vector);
          _SFD_SET_DATA_VALUE_PTR(3U, c1_order);
          _SFD_SET_DATA_VALUE_PTR(4U, c1_data_out);
        }
      }
    } else {
      sf_debug_reset_current_state_configuration(sfGlobalDebugInstanceStruct,
        _Median_FilterMachineNumber_,chartInstance->chartNumber,
        chartInstance->instanceNumber);
    }
  }
}

static const char* sf_get_instance_specialization(void)
{
  return "rEYy92pGGacpCsCe1SJmUD";
}

static void sf_opaque_initialize_c1_Median_Filter(void *chartInstanceVar)
{
  chart_debug_initialization(((SFc1_Median_FilterInstanceStruct*)
    chartInstanceVar)->S,0);
  initialize_params_c1_Median_Filter((SFc1_Median_FilterInstanceStruct*)
    chartInstanceVar);
  initialize_c1_Median_Filter((SFc1_Median_FilterInstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_enable_c1_Median_Filter(void *chartInstanceVar)
{
  enable_c1_Median_Filter((SFc1_Median_FilterInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c1_Median_Filter(void *chartInstanceVar)
{
  disable_c1_Median_Filter((SFc1_Median_FilterInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c1_Median_Filter(void *chartInstanceVar)
{
  sf_gateway_c1_Median_Filter((SFc1_Median_FilterInstanceStruct*)
    chartInstanceVar);
}

extern const mxArray* sf_internal_get_sim_state_c1_Median_Filter(SimStruct* S)
{
  ChartRunTimeInfo * crtInfo = (ChartRunTimeInfo *)(ssGetUserData(S));
  ChartInfoStruct * chartInfo = (ChartInfoStruct *)(crtInfo->instanceInfo);
  mxArray *plhs[1] = { NULL };

  mxArray *prhs[4];
  int mxError = 0;
  prhs[0] = mxCreateString("chart_simctx_raw2high");
  prhs[1] = mxCreateDoubleScalar(ssGetSFuncBlockHandle(S));
  prhs[2] = (mxArray*) get_sim_state_c1_Median_Filter
    ((SFc1_Median_FilterInstanceStruct*)chartInfo->chartInstance);/* raw sim ctx */
  prhs[3] = (mxArray*) sf_get_sim_state_info_c1_Median_Filter();/* state var info */
  mxError = sf_mex_call_matlab(1, plhs, 4, prhs, "sfprivate");
  mxDestroyArray(prhs[0]);
  mxDestroyArray(prhs[1]);
  mxDestroyArray(prhs[2]);
  mxDestroyArray(prhs[3]);
  if (mxError || plhs[0] == NULL) {
    sf_mex_error_message("Stateflow Internal Error: \nError calling 'chart_simctx_raw2high'.\n");
  }

  return plhs[0];
}

extern void sf_internal_set_sim_state_c1_Median_Filter(SimStruct* S, const
  mxArray *st)
{
  ChartRunTimeInfo * crtInfo = (ChartRunTimeInfo *)(ssGetUserData(S));
  ChartInfoStruct * chartInfo = (ChartInfoStruct *)(crtInfo->instanceInfo);
  mxArray *plhs[1] = { NULL };

  mxArray *prhs[3];
  int mxError = 0;
  prhs[0] = mxCreateString("chart_simctx_high2raw");
  prhs[1] = mxDuplicateArray(st);      /* high level simctx */
  prhs[2] = (mxArray*) sf_get_sim_state_info_c1_Median_Filter();/* state var info */
  mxError = sf_mex_call_matlab(1, plhs, 3, prhs, "sfprivate");
  mxDestroyArray(prhs[0]);
  mxDestroyArray(prhs[1]);
  mxDestroyArray(prhs[2]);
  if (mxError || plhs[0] == NULL) {
    sf_mex_error_message("Stateflow Internal Error: \nError calling 'chart_simctx_high2raw'.\n");
  }

  set_sim_state_c1_Median_Filter((SFc1_Median_FilterInstanceStruct*)
    chartInfo->chartInstance, mxDuplicateArray(plhs[0]));
  mxDestroyArray(plhs[0]);
}

static const mxArray* sf_opaque_get_sim_state_c1_Median_Filter(SimStruct* S)
{
  return sf_internal_get_sim_state_c1_Median_Filter(S);
}

static void sf_opaque_set_sim_state_c1_Median_Filter(SimStruct* S, const mxArray
  *st)
{
  sf_internal_set_sim_state_c1_Median_Filter(S, st);
}

static void sf_opaque_terminate_c1_Median_Filter(void *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc1_Median_FilterInstanceStruct*) chartInstanceVar)->S;
    ChartRunTimeInfo * crtInfo = (ChartRunTimeInfo *)(ssGetUserData(S));
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_Median_Filter_optimization_info();
    }

    finalize_c1_Median_Filter((SFc1_Median_FilterInstanceStruct*)
      chartInstanceVar);
    utFree((void *)chartInstanceVar);
    if (crtInfo != NULL) {
      utFree((void *)crtInfo);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc1_Median_Filter((SFc1_Median_FilterInstanceStruct*)
    chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c1_Median_Filter(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  if (sf_machine_global_initializer_called()) {
    ChartRunTimeInfo * crtInfo = (ChartRunTimeInfo *)(ssGetUserData(S));
    ChartInfoStruct * chartInfo = (ChartInfoStruct *)(crtInfo->instanceInfo);
    initialize_params_c1_Median_Filter((SFc1_Median_FilterInstanceStruct*)
      (chartInfo->chartInstance));
  }
}

static void mdlSetWorkWidths_c1_Median_Filter(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
    mxArray *infoStruct = load_Median_Filter_optimization_info();
    int_T chartIsInlinable =
      (int_T)sf_is_chart_inlinable(sf_get_instance_specialization(),infoStruct,1);
    ssSetStateflowIsInlinable(S,chartIsInlinable);
    ssSetRTWCG(S,sf_rtw_info_uint_prop(sf_get_instance_specialization(),
                infoStruct,1,"RTWCG"));
    ssSetEnableFcnIsTrivial(S,1);
    ssSetDisableFcnIsTrivial(S,1);
    ssSetNotMultipleInlinable(S,sf_rtw_info_uint_prop
      (sf_get_instance_specialization(),infoStruct,1,
       "gatewayCannotBeInlinedMultipleTimes"));
    sf_update_buildInfo(sf_get_instance_specialization(),infoStruct,1);
    if (chartIsInlinable) {
      ssSetInputPortOptimOpts(S, 0, SS_REUSABLE_AND_LOCAL);
      ssSetInputPortOptimOpts(S, 1, SS_REUSABLE_AND_LOCAL);
      ssSetInputPortOptimOpts(S, 2, SS_REUSABLE_AND_LOCAL);
      sf_mark_chart_expressionable_inputs(S,sf_get_instance_specialization(),
        infoStruct,1,3);
      sf_mark_chart_reusable_outputs(S,sf_get_instance_specialization(),
        infoStruct,1,2);
    }

    {
      unsigned int outPortIdx;
      for (outPortIdx=1; outPortIdx<=2; ++outPortIdx) {
        ssSetOutputPortOptimizeInIR(S, outPortIdx, 1U);
      }
    }

    {
      unsigned int inPortIdx;
      for (inPortIdx=0; inPortIdx < 3; ++inPortIdx) {
        ssSetInputPortOptimizeInIR(S, inPortIdx, 1U);
      }
    }

    sf_set_rtw_dwork_info(S,sf_get_instance_specialization(),infoStruct,1);
    ssSetHasSubFunctions(S,!(chartIsInlinable));
  } else {
  }

  ssSetOptions(S,ssGetOptions(S)|SS_OPTION_WORKS_WITH_CODE_REUSE);
  ssSetChecksum0(S,(4091182297U));
  ssSetChecksum1(S,(3261097400U));
  ssSetChecksum2(S,(3872504911U));
  ssSetChecksum3(S,(2233033967U));
  ssSetmdlDerivatives(S, NULL);
  ssSetExplicitFCSSCtrl(S,1);
  ssSupportsMultipleExecInstances(S,1);
}

static void mdlRTW_c1_Median_Filter(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlStart_c1_Median_Filter(SimStruct *S)
{
  SFc1_Median_FilterInstanceStruct *chartInstance;
  ChartRunTimeInfo * crtInfo = (ChartRunTimeInfo *)utMalloc(sizeof
    (ChartRunTimeInfo));
  chartInstance = (SFc1_Median_FilterInstanceStruct *)utMalloc(sizeof
    (SFc1_Median_FilterInstanceStruct));
  memset(chartInstance, 0, sizeof(SFc1_Median_FilterInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway = sf_opaque_gateway_c1_Median_Filter;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c1_Median_Filter;
  chartInstance->chartInfo.terminateChart = sf_opaque_terminate_c1_Median_Filter;
  chartInstance->chartInfo.enableChart = sf_opaque_enable_c1_Median_Filter;
  chartInstance->chartInfo.disableChart = sf_opaque_disable_c1_Median_Filter;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c1_Median_Filter;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c1_Median_Filter;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c1_Median_Filter;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c1_Median_Filter;
  chartInstance->chartInfo.mdlStart = mdlStart_c1_Median_Filter;
  chartInstance->chartInfo.mdlSetWorkWidths = mdlSetWorkWidths_c1_Median_Filter;
  chartInstance->chartInfo.extModeExec = NULL;
  chartInstance->chartInfo.restoreLastMajorStepConfiguration = NULL;
  chartInstance->chartInfo.restoreBeforeLastMajorStepConfiguration = NULL;
  chartInstance->chartInfo.storeCurrentConfiguration = NULL;
  chartInstance->chartInfo.debugInstance = sfGlobalDebugInstanceStruct;
  chartInstance->S = S;
  crtInfo->instanceInfo = (&(chartInstance->chartInfo));
  crtInfo->isJITEnabled = false;
  ssSetUserData(S,(void *)(crtInfo));  /* register the chart instance with simstruct */
  init_dsm_address_info(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  sf_opaque_init_subchart_simstructs(chartInstance->chartInfo.chartInstance);
  chart_debug_initialization(S,1);
}

void c1_Median_Filter_method_dispatcher(SimStruct *S, int_T method, void *data)
{
  switch (method) {
   case SS_CALL_MDL_START:
    mdlStart_c1_Median_Filter(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c1_Median_Filter(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c1_Median_Filter(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c1_Median_Filter_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
