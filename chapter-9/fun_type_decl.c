typedef double(proc)(int);

proc myproc;

double myproc(int x) {
    return 42.0 + x;
}