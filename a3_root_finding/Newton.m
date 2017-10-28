function [root, flag, iters] = Newton(Xp, Xtol, Maxits)


% generate the functions
f = @FUN;
df = @DFUN;


% PRE-ITERATION CHECKS

% make sure Xp is not Inf
if Xp == Inf
    root = Xp;
    flag = -2;
    iters = 0;
    return
end

% check function
F = f(Xp); % making this global is efficient
if F == Inf % cannot evaluate f = Inf
    root = Xp;
    flag = -2;
    iters = 0;
    return
elseif F == 0 % lucky guess
    root = Xp;
    flag = 1;
    iters = 0;
    return
else
    % intentional blank
end

% check derivative
dF = df(Xp); % making this global is efficient
if dF == Inf || dF == 0 % cannot evaluate if derivative is Inf or Zero
    root = Xp;
    flag = -2;
    iters = 0;
    return
end


% ITERATION
iterJ = 1;
while iterJ < Maxits + 1
    
    % x sequence convergence test
    Xq = Xp - F/dF;
    if abs(Xp - Xq) < (Xtol + eps * abs(Xp))
        root = Xp;
        flag = 0;
        iters = iterJ - 1;
        return
    end
    
    % f tests
    F = f(Xq);
    if F == 0 % f-value is zero
        root = Xq;
        flag = 1;
        iters = iterJ;
        return
    elseif F == Inf % we cannot proceed
        root = Xq;
        flag = -2;
        iters = iterJ;
        return
    else
        % intentional blank
    end
    
    % df == Zero or Inf test
    dF = df(Xq);
    if dF == Inf || dF == 0
        root = Xq;
        flag = -2;
        iters = iterJ;
        return
    end
    
    % move on to the next iteration
    Xp = Xq;
    iterJ = iterJ + 1;
end

% POST-ITERATION
% flag = -1
root = Xp;
flag = -1;
iters = iterJ;
return

end