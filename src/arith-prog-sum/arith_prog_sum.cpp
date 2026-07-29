void arith_prog_sum(int a1, int r, int n, int *sum) {

    *sum = 0;
    int currentTerm = a1;

    for (int i = 0; i < n; ++i) {
        *sum += currentTerm;
        currentTerm += r;
    }
}
