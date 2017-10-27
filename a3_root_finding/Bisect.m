%{
	[root, flat, iters] = Bisect(x1, x2, x_tol, interMax)

	iterJ = 0;
	while iterJ < iterMax:

		% flag=2 checks
		if (x1 == Inf) | (x2 == Inf) | (f(x1) == Inf) | (f(x2) == Inf)
			return NaN, flag=-2, iters=IterJ
		
		% necessary calculations
		m = min(x1, x2) + (max(x1, x2) - min(x1, x2)) / 2; % trying to keep magnitude of m as small as possible
		iterJ = iterJ + 1; % increment the counter of iterations
		
		if m < x_tol
			return f(m), flag=0, iters=iterJ;

		else if f(m) == 0
			return f(m), flag=1, iters=iterJ;

		else
			if sign(f(x1)) == sign(f(m)):
				x1 <-- m
			else:
				x2 <-- m

	return f(m), flag=-1, iters=iterJ

%}