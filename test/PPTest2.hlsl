
// HLSL Translator: Preprocessor Test 2
// 07/11/2016


#define F1(X, Y) /*<F1>*/ (X)*(Y) /*</F1>*/
#define F2(X, Y) /*<F2>*/ X*Y /*</F2>*/

#define F3(X, Y) /*<F3>*/ F1((X),Y)+F2(X, Y) /*</F3>*/

//#define F3(X, Y) \
//	F1(X, Y) + F2(X, Y) /*F3*/

#define V1 1+2

#if 5 > V1*3

F1 ( 1 , 2 )
F1 (1,2+3)
F3 (F1(1,2),2+3);

#endif

#ifdef _0
F1(3,4,5)
F1 ( 6 )
F1
#endif
