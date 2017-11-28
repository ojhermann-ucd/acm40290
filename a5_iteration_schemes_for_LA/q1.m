% inputs
A = [
    3 12 0 -1 0 0;
    4 0 31 1 0 0;
    2 1 0 0 17 -3;
    27 2 0 0 0 1;
    0 0 0 -1 1 11;
    0 0 0 24 -1 0;
    ];

b = [
    39;
    117;
    12;
    98;
    14;
    55;
    ];

tol = 0.001 * eps;

% run the function
f = @jacobi ;
disp(f(A,b, tol));