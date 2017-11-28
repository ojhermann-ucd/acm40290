function [ x, k ] = jacobi( A, b, tol )
    
    % matrix modifications
    [L, U, P] = lu(A);
    M = diag(diag(P*A));
    N = M - P*A;
    
    % initial x
    xPrior = [0; 0; 0; 0; 0; 0;];
    x = M \ (N * xPrior + b);
    
    % iteration
    k = 0;
    while tol + eps(norm(x)) < norm(x - xPrior)
        xPrior = x;
        x = M \ (N * xPrior + b);
        k = k + 1;
    end
    
    % return
    return
    
end

