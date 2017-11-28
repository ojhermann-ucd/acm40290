% n
n = 1000;

% A
f1 = @tridiag;
A = f1(n);

% b
b = ones(n, 1);

% x
x = zeros(n, 1);

% max_it
max_it = 1000;

% tol
tol = 4 * eps;

f = @otto;
[ x, err, iter, flag ] = otto(A, x, b, w, max_it, tol)
disp(x);