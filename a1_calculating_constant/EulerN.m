function value = EulerN(n)
	current = 0;
	estimate = 0;
	while current <= n
		estimate = estimate + sum_element(current);
		current = current + 1;
	end
	value = vpa(single(estimate));
end

function s = sum_element(n)
	s = 1 / factorial(n);
end

% function f = factorial(n)
% 	f = 1;
%	while n > 1
%		f = f * n;
%		n = n - 1;
%	end
% end