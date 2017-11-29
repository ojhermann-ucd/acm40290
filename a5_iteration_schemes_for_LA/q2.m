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

% find best w
bestK = 0;
bestW = 0;
currentValue = realmax;
bestKHolder = [];
bestWHolder = [];
for w = 0.5:0.01:1.95
    % sor
    tol = 4 * eps;
    maxits = 100000;
    [x, k] = f3(n, val, col, rowstart, d, b, w, tol, maxits);
    
    compValue = abs(norm(x) - norm(mVersion));
    if compValue < currentValue
        currentValue = compValue;
        bestK = k;
        bestW = w;
        bestKHolder = [k];
        bestWHolder = [w];
    elseif compValue == currentValue
        bestKHolder = [bestKHolder, k];
        bestWHolder = [bestWHolder, w];
    else
        % intentional blank
    end
end
disp("Minimum Difference in Norms");
disp(compValue);
disp("W Values");
disp(bestWHolder);
disp("Iteration Count Values");
disp(bestKHolder);

disp("We cans see the most accurate value for the least iterations is W = 1.35 for 36 iterations.");
disp("However, given the magnitude of the differences in norms, it's likely roundoff and othe errors are at play.");
disp("So, these are all pretty good.");