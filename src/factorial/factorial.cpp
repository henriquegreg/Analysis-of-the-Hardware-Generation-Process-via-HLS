void factorial(int a, int *out){
    OUT_INITIALIZATION:
        *out = 1;

    FOR_LOOP:
    for(int i = 1; i <= a; ++i) {
        OUT_PRODUCT:
            *out *= i;
    }
}
