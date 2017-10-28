function [root, flag, iters] = Secant(X1, X2, Xtol, Maxits)


% generate the functions
f = @FUN;


% PRE-ITERATION CHECKS

% make sure X1 != X2 as it leads to divsion by zero
if X1 == X2
    root = X1;
    flag = -2;
    iters = 0;
    return
end

% make sure X inputs are not Inf
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

% check functions
F1 = f(X1);
if F1 == Inf % connot evaluate Inf
    root = X1;
    flag = -2;
    iters = 0;
    return
elseif F1 == 0 % lucky guess
    root = X1;
    flag = 1;
    iters = 0;
    return
else
    % intentinal blank
end
% check functions
F2 = f(X2);
if F2 == Inf % connot evaluate Inf
    root = X1;
    flag = -2;
    iters = 0;
    return
elseif F2 == 0 % lucky guess
    root = X1;
    flag = 1;
    iters = 0;
    return
else
    % intentinal blank
end


end
