function [root, flag, iters] = ModFzero(X1, X2, Xtol, Maxits)


% no values given
if isempty(X1) && isempty(X2)
    root = X1;
    flag = -2;
    iters = 0;
    return
end

% only X2
if isempty(X1)
    % define the problem
    problem.objective = @FUN;
    problem.X0 = X2;
    problem.solver = 'fzero';
    problem.options.TolX = (Xtol + eps * abs(X2));
    problem.options.MaxIter = Maxits;
    % generate the output
    [x, exitflag, output] = fzero(problem);
    % assign values to my output
    root = x;
    flag = exitflag;
    iters = output.iteration;
    return
end

% only X1
if isempty(X2) 
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
end

% both given
X3 = min(abs(X1), abs(X2));
% define the problem
problem.objective = @FUN;
problem.X0 = X3;
problem.solver = 'fzero';
problem.options.TolX = (Xtol + eps * abs(X3));
problem.options.MaxIter = Maxits;
% generate the output
[x, exitflag, output] = fzero(problem);
% assign values to my output
root = x;
flag = exitflag;
iters = output;
return

end


