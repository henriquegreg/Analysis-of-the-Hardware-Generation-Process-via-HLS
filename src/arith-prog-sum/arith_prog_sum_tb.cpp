#include <stdio.h>

// Function prototype
void arith_prog_sum(int a1, int r, int n, int *soma);

// Structure to facilitate testing with multiple variables
typedef struct {
    int a1;
    int r;
    int n;
    int expected;
} TestCase;

int main() {
    TestCase tests[] = {
        {1, 1, 5, 15},   // 1 + 2 + 3 + 4 + 5 = 15
        {0, 2, 4, 12},   // 0 + 2 + 4 + 6 = 12
        {10, -2, 3, 24}  // 10 + 8 + 6 = 24
    };
    int num_tests = sizeof(tests) / sizeof(tests[0]);
    int sum_result;
    int errors = 0;

    printf("--- Starting test: soma_pa ---\n");
    for (int i = 0; i < num_tests; i++) {
        soma_pa(tests[i].a1, tests[i].r, tests[i].n, &sum_result);
        
        if (sum_result != tests[i].expected) {
            printf("[FAIL] a1=%d, r=%d, n=%d | Expected: %d | Got: %d\n", 
                   tests[i].a1, tests[i].r, tests[i].n, tests[i].expected, sum_result);
            errors++;
        } else {
            printf("[OK] a1=%d, r=%d, n=%d | Sum: %d\n", 
                   tests[i].a1, tests[i].r, tests[i].n, sum_result);
        }
    }

    if (errors == 0) printf("All tests passed successfully!\n");
    
    return errors;
}