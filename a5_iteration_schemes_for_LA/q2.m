% n
n = 5;

% A
f1 = @tridiag;
A = f1(n);

% b
b = ones(n, 1);

% denseMatrix
f2 = @denseMatrix;
[ val, col, rowstart, d ] = f2(A);

% sor
f3 = @sor;

% Matlab
S = sparse(A);
[mVersion, flag] = pcg(S, b);

for w = 0.95
    % sor
    tol = 4 * eps;
    maxits = 100000;
    [x, k] = f3(n, val, col, rowstart, d, b, w, tol, maxits);
end