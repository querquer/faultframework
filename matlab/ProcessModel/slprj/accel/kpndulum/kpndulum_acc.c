#include "__cf_kpndulum.h"
#include <math.h>
#include "kpndulum_acc.h"
#include "kpndulum_acc_private.h"
#include <stdio.h>
#include "simstruc.h"
#include "fixedpoint.h"
#define CodeFormat S-Function
#define AccDefine1 Accelerator_S-Function
static void mdlOutputs ( SimStruct * S , int_T tid ) { real_T ah3ew2ey2z ;
n3qi1whofz * _rtB ; loikxjbxjg * _rtP ; ew10rzwqr2 * _rtDW ; _rtDW = ( (
ew10rzwqr2 * ) ssGetRootDWork ( S ) ) ; _rtP = ( ( loikxjbxjg * )
ssGetDefaultParam ( S ) ) ; _rtB = ( ( n3qi1whofz * ) _ssGetBlockIO ( S ) ) ;
_rtB -> jfplxv0osb = ( ( f1xhd02yjc * ) ssGetContStates ( S ) ) -> lbvv2514cn
; ssCallAccelRunBlock ( S , 0 , 1 , SS_CALL_MDL_OUTPUTS ) ; ah3ew2ey2z = _rtP
-> P_1 * muDoubleScalarSin ( _rtB -> jfplxv0osb ) ; _rtB -> e00jqhdvw5 = ( (
f1xhd02yjc * ) ssGetContStates ( S ) ) -> mftsy0mude ; _rtB -> dfbrmwwbf3 = (
muDoubleScalarSin ( _rtP -> P_5 * ssGetT ( S ) ) * _rtP -> P_4 * _rtP -> P_6
+ ah3ew2ey2z ) + _rtP -> P_3 * _rtB -> e00jqhdvw5 ; UNUSED_PARAMETER ( tid )
; }
#define MDL_UPDATE
static void mdlUpdate ( SimStruct * S , int_T tid ) { n3qi1whofz * _rtB ;
loikxjbxjg * _rtP ; _rtP = ( ( loikxjbxjg * ) ssGetDefaultParam ( S ) ) ;
_rtB = ( ( n3qi1whofz * ) _ssGetBlockIO ( S ) ) ; UNUSED_PARAMETER ( tid ) ;
}
#define MDL_DERIVATIVES
static void mdlDerivatives ( SimStruct * S ) { n3qi1whofz * _rtB ; loikxjbxjg
* _rtP ; _rtP = ( ( loikxjbxjg * ) ssGetDefaultParam ( S ) ) ; _rtB = ( (
n3qi1whofz * ) _ssGetBlockIO ( S ) ) ; { ( ( pqmvzr1kvu * ) ssGetdX ( S ) )
-> lbvv2514cn = _rtB -> e00jqhdvw5 ; } { ( ( pqmvzr1kvu * ) ssGetdX ( S ) )
-> mftsy0mude = _rtB -> dfbrmwwbf3 ; } } static void mdlInitializeSizes (
SimStruct * S ) { ssSetChecksumVal ( S , 0 , 471723870U ) ; ssSetChecksumVal
( S , 1 , 2893124609U ) ; ssSetChecksumVal ( S , 2 , 3081617195U ) ;
ssSetChecksumVal ( S , 3 , 2091025475U ) ; { mxArray * slVerStructMat = NULL
; mxArray * slStrMat = mxCreateString ( "simulink" ) ; char slVerChar [ 10 ]
; int status = mexCallMATLAB ( 1 , & slVerStructMat , 1 , & slStrMat , "ver"
) ; if ( status == 0 ) { mxArray * slVerMat = mxGetField ( slVerStructMat , 0
, "Version" ) ; if ( slVerMat == NULL ) { status = 1 ; } else { status =
mxGetString ( slVerMat , slVerChar , 10 ) ; } } mxDestroyArray ( slStrMat ) ;
mxDestroyArray ( slVerStructMat ) ; if ( ( status == 1 ) || ( strcmp (
slVerChar , "8.3" ) != 0 ) ) { return ; } } ssSetOptions ( S ,
SS_OPTION_EXCEPTION_FREE_CODE ) ; if ( ssGetSizeofDWork ( S ) != sizeof (
ew10rzwqr2 ) ) { ssSetErrorStatus ( S ,
"Unexpected error: Internal DWork sizes do "
"not match for accelerator mex file." ) ; } if ( ssGetSizeofGlobalBlockIO ( S
) != sizeof ( n3qi1whofz ) ) { ssSetErrorStatus ( S ,
"Unexpected error: Internal BlockIO sizes do "
"not match for accelerator mex file." ) ; } { int ssSizeofParams ;
ssGetSizeofParams ( S , & ssSizeofParams ) ; if ( ssSizeofParams != sizeof (
loikxjbxjg ) ) { static char msg [ 256 ] ; sprintf ( msg ,
"Unexpected error: Internal Parameters sizes do "
"not match for accelerator mex file." ) ; } } _ssSetDefaultParam ( S , (
real_T * ) & o2iu0a2jke ) ; } static void mdlInitializeSampleTimes (
SimStruct * S ) { } static void mdlTerminate ( SimStruct * S ) { }
#include "simulink.c"
