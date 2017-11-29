function [x, k] = sor(n, val, col, rowstart, d, b, w, tol, maxits)
    x = zeros(n, 1);
    k = 0;
    converged = false;

     while (~converged) && (k <= maxits)
         normx = 0.0;
         normdx = 0.0;
         for i = 1:n
             sum = 0.0;
             for j = rowstart(i):rowstart(i + 1) - 1
                 sum = sum + val(j) * x(col(j));
             end
             dx = w * (b(i) - sum) / d(i, i);
             x(i) = x(i) + w * ((b(i) - sum) / d(i, i));
             normdx = max(normdx, abs(dx));
             normx = max(normx, abs(x(i)));
         end
         converged = normdx <= tol + 4.0*eps*normx;
         k = k + 1;
    end

end