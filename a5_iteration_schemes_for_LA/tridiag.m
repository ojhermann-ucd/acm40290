function [ M ] = tridiag( n )
    nOnes = ones(n, 1);
    M = diag(2 * nOnes, 0) - diag(nOnes(1:n-1), -1) - diag(nOnes(1:n-1), 1);
end

