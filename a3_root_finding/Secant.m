function [root, flag, iters] = Secant(X1, X2, Xtol, Maxits)


% generate the functions
f = @FUN;


% PRE-ITERATION CHECKS

% infinite x values
if X1 == Inf
    root = X1;
    flag = -2;
    iters = 0;
    return
elseif X2 == Inf
    root = X2;
    flag = -2;
    iters = 0;
    return
else
    % intentional blank
end

% check premature x-sequence convergence
if abs(X2 - X1) < (Xtol + eps * abs(X2)) % this would result in a garbage numerator, but possible f=0 (no need to chevk f-value)
    root = X2;
    flag = 0;
    iters = 0;
    return
end

% f-value checks
F1 = f(X1);
F2 = f(X2);
if F1 == Inf
    root = X1;
    flag = -2;
    iters = 0;
    return
elseif F2 == Inf
    root = X2;
    flag = -2;
    iters = 0;
    return
elseif (F1 - F2) <= eps % going with high precision when evaluating F1 == F2, which would break denominator
    root = X2;
    flag = -2;
    iters = 0;
    return
else
    % intentional blank
end


% ITERATION

iterJ = 1;
while iterJ < Maxits + 1
    
    % get the value of the next X
    X3 = X2 - F2 * (X2 - X1) / (F2 - F1);
    
    % x-sequence convergence check
    if abs(X3 - X2) < (Xtol + eps * abs(X3))
        root = X2;
        flag = 0;
        iters = iterJ -1;
        return
    end
    
    % f-value check
    F1 = F2;
    F2 = f(X3);
    if F2 == Inf
        root = X3;
        flag = -2;
        iters = iterJ;
        return
    elseif F2 == 0
        root = X3;
        flag = -2;
        iters = iterJ;
        return
    else
        % intentional blank
    end
    
    % admin
    X1 = X2;
    X2 = X3;
    iterJ = iterJ + 1;
    
end


% POST-ITERATION
% flag = -1
root = m;
flag = -1;
iters = iterJ;
return


end
