void factorial_sqrt(int n, int *res);
void sqrt_hls(int a, int *res);
void factorial(int a, int *out);

void factorial_sqrt(int n, int *res) {

    int factorial_result;

    factorial(n, &factorial_result);

    sqrt_hls(factorial_result, res);

}

void factorial(int a, int *out){
    OUT_INITIALIZATION:
        *out = 1;

    FOR_LOOP:
    for(int i = 1; i <= a; ++i) {
        OUT_PRODUCT:
            *out *= i;
    }
}

void sqrt_hls(int a, int* res){
    int square = 1;
    int delta = 3;
    while (square <= a){
        square += delta;
        delta += 2;
    }
    *res = (delta/2 - 1);
}