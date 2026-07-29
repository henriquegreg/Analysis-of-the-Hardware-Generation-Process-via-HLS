void sqrt_hls(int a, int* res){
    int square = 1;
    int delta = 3;
    while (square <= a){
        square += delta;
        delta += 2;
    }
    *res = (delta/2 - 1);
}