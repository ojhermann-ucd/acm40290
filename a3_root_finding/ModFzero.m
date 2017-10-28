function [root, flag, iters] = ModFzero(X1, X2, Xtol, Maxits)


% no values given
if isempty(X1) && isempty(X2)
    root = X1;
    flag = -2;
    iters = 0;
    return
end

% only one value given
if isempty(X1)
    % manage the variable
    X1 = X2;
    % define the problem
    problem.objective = @FUN;
    problem.X0 = X1;
    problem.solver = 'fzero';
    problem.options.TolX = (Xtol + eps * abs(X1));
    problem.options.MaxIter = Maxits;
    % generate the output
    [x, exitflag, output] = fzero(problem);
    % assign values to my output
    root = x;
    flag = exitflag;
    iters = output.iteration;
    return
    
else
    X2 = X1;
end

end


