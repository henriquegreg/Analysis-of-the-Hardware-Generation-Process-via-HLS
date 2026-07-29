#include <stdio.h>

// Function prototype
void sqrt_hls(int a, int* res);

int main() {
    int input_values[] = {4, 9, 15, 16, 120};
    int expected_values[] = {2, 3, 3, 4, 10};
    int res;
    int errors = 0;

    printf("--- Starting test: sqrt_hls ---\n");
    for (int i = 0; i < 5; i++) {
        sqrt_hls(input_values[i], &res);
        
        if (res != expected_values[i]) {
            printf("[FAIL] Input: %d | Expected: %d | Got: %d\n", 
                   input_values[i], expected_values[i], res);
            errors++;
        } else {
            printf("[OK] Input: %d | Integer Square Root: %d\n", input_values[i], res);
        }
    }

    if (errors == 0) printf("All tests passed successfully!\n");
    
    return errors;
}