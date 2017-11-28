for w = 0.5:.05:1.95
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
%     w = 1.4;
    tol = 4 * eps;
    maxits = 5;
    [x] = sor(n, val, col, rowstart, d, b, w, tol, maxits);
    disp(x);
end

S = sparse(A);
disp(pcg(S, b));