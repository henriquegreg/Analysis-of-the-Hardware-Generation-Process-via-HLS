#include <stdio.h>

void factorial_sqrt(int n, int *res);

int main() {
    // Test cases:
    // n=3 -> fact=6 -> sqrt_int(6) = 2
    // n=4 -> fact=24 -> sqrt_int(24) = 4
    // n=5 -> fact=120 -> sqrt_int(120) = 10
    int input_values[] = {3, 4, 5};
    int expected_values[] = {2, 4, 10};
    int res;
    int errors = 0;

    printf("--- Starting test: factorial_sqrt ---\n");
    for (int i = 0; i < 3; i++) {
        factorial_sqrt(input_values[i], &res);
        
        if (res != expected_values[i]) {
            printf("[FAIL] n: %d | Expected: %d | Got: %d\n", 
                   input_values[i], expected_values[i], res);
            errors++;
        } else {
            printf("[OK] n: %d | Factorial Square Root: %d\n", input_values[i], res);
        }
    }

    if (errors == 0) printf("All tests passed successfully!\n");
    
    return errors;
}