function [root, flag, iters] = Bisect(Xlo, Xhi, Xtol, Maxits)

% generate the function
f = @FUN;


% PRE-ITERATION

% cannot evaluate x = Inf
if (Xlo == Inf) || (Xhi == Inf) 
    root = Inf;
    flag = -2;
    iters = 0;
    return
end

% Xlo == Xhi
if Xlo == Xhi
    if f(Xlo) == 0 % lucky guess
        root = Xlo;
        flag = 1;
        iters = 0;
        return
    else % algorithm will evaluate the same spot repeatedly b/c X1 + X2 / 2 = 2X1/2 = X1 = X2
        root = Xlo; 
        flag = -2;
        iters = 0;
        return
    end
end


% ITERATION
iterJ = 1;
while iterJ < Maxits + 1
    
    % check x-sequence convergence
    if abs(Xlo - Xhi) < (Xtol + eps * abs(Xlo))
        root = Xlo;
        flag = 0;
        iters = iterJ - 1;
        return
    end
    
    % check f-value is zero
    m = Xlo + ((Xhi - Xlo) / 2);
    fm = f(m); % adding because cheaper to save number than run calc more than once; worst case the value is used more than once and function calc is non trivial expense
    if fm == 0
        root = m;
        flag = 1;
        iters = iterJ;
        return
    end
    
    % modify Xlo and Xhi
    flo = f(Xlo); % adding because cheaper to save number than run calc more than once; used twice in each loop
    if flo == Inf % can't progress with an infinite value b/c will not be useable for future comparisons
        root = m;
        flag = -2;
        iters = iterJ;
        return
    elseif sign(flo) == sign(fm)
        Xlo = m;
    else
        Xhi = m;
    end
    
    % increment iterJ
    iterJ = iterJ + 1;
end


% POST-ITERATION
% flag = -1
root = m;
flag = -1;
iters = iterJ;
return

end