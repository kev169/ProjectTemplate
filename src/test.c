/*Sample of tests in C code*/
#include <assert.h>
#include <stdbool.h>

#ifdef TESTING
static void test_testfunc_1(void) {
    //call init function;
    //Then call function your testing, and what your expecting.
    assert( func_1() == 0 && "testfunc_1()");
}

int main(void){
    test_testfunc_1();
}

#endif
