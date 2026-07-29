#include <stdio.h>

void factorial(int a, int *out);

int main() {
    int input_values[] = {1, 3, 5, 7};
    int expected_values[] = {1, 6, 120, 5040};
    int out;
    int errors = 0;

    printf("--- Starting test: factorial ---\n");
    for (int i = 0; i < 4; i++) {
        factorial(input_values[i], &out);
        
        if (out != expected_values[i]) {
            printf("[FAIL] Input: %d | Expected: %d | Got: %d\n", 
                   input_values[i], expected_values[i], out);
            errors++;
        } else {
            printf("[OK] Input: %d | Result: %d\n", input_values[i], out);
        }
    }

    if (errors == 0) printf("All tests passed successfully!\n");
    
    return errors; 
}