function [root, flag, iters] = Bisect(Xlo, Xhi, Xtol, Maxits)

% generate the function
f = @FUN;

% PRE-ITERATION
% cannot have no space between starting values
if Xlo == Xhi 
    root = 0;
    flag = -2;
    iters = 0;
    return
end

% cannot evaluate x=Inf
if (Xlo == Inf) || (Xhi == Inf) 
    root = Inf;
    flag = -2;
    iters = 0;
    return
end

% flo = f(Xlo)
flo = f(Xlo);
if flo == Inf % cannot progress from f=Inf
    root = Xlo;
    flag = -2;
    iters = 0;
    return
elseif flo == 0 % lucky guess
    root = Xlo;
    flag = 1;
    iters = 0;
    return
else
    % do nothing intentional
end

% fhi = f(Xhi)
fhi = f(Xhi);
if fhi == Inf % cannot progress from f=Inf
    root = Xhi;
    flag = -2;
    iters = 0;
    return
elseif fhi == 0 % lucky guess
    root = Xhi;
    flag = 1;
    iters = 0;
    return
else
    % do nothing intentional
end


% ITERATION
iterJ = 1;
m = 0;
while iterJ < Maxits + 1
    % m value
    m = Xlo + ((Xhi - Xlo) / 2);
    
    % check x-sequence convergence
    if abs(Xlo - Xhi) < (Xtol + eps * abs(Xlo))
        root = m;
        flag = 0;
        iters = iterJ;
        return
    end
    
    % check f-value is zero
    fm = f(m); % adding because cheaper to save number than run calc more than once; worst case the value is used more than once and function calc is non trivial expense
    if fm == 0
        root = m;
        flag = 1;
        iters = iterJ;
        return
    end
    
    % modify Xlo and Xhi
    flo = f(Xlo); % adding because cheaper to save number than run calc more than once; used twice in each loop
    if flo == Inf % can't progress with an infinite value
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


%{
	[root, flat, iters] = Bisect(Xlo, Xhi, Xtol, Maxits)

	% ONCE ONLY CHECKS
	% initial entry flag=-2 check
	if ((Xlo == Xhi) | (Xlo == Inf) | (Xhi == Inf) | (f(Xlo) == Inf) | (f(Xhi) == Inf))
		return NaN, flag=-2, 0
	% lucky guess checks
	if f(Xlo) == 0
		return Xlo, flag=1, 0
	if f(Xhi) == 0
		return Xhi, flag=1, 0
	% ITERATIONS
	iterJ = 0;
	while iterJ < iterMax:
		
		% check x-sequence convergence
		m = Xlo + ((Xhi - Xlo) / 2);
		if m < Xtol
			return m, flag=0, iters=iterJ+1;

		% check fm_value is zero
		fm_value = f(m); % adding because cheaper to save number than run calc more than once; worst case the value is used more than once and function calc is non trivial expense
		if fm_value == 0
			return m, flag=1, iters=iterJ+1;

		% modify Xlo and Xhi
		f1_value = f(Xlo); % adding because cheaper to save number than run calc more than once; used twice
		if sign(f1_value) == sign(fm_value)
			Xlo <-- m
		else
			Xhi <-- m

		% flag=-2 checks
		if (Xlo == Inf) | (Xhi == Inf) | (f1_value == Inf) | (f(Xhi) == Inf)
			return NaN, flag=-2, iters=IterJ

		% increment interJ
		interJ = interJ + 1;

	return m, flag=-1, iters=iterJ

%}