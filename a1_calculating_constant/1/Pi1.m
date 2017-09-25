% a while based implementation of the requested function
function p = Pi1(n)
	current = 0;
	estimate = 0;
	while current <= n
		estimate = estimate + the_sum(current);
		current = current + 1;
	end
	p = vpa(estimate * 4);
end

% the sum component for each n
function s = the_sum(n)
	s1 = sum_element(n, 1);
	s2 = sum_element(n, 3);
	s = s1 - s2;
end

% atomic component of the denominator
function s = sum_element(n, increment)
	denom_1 = 4 * n;
	denom_2 = increment;
	denom = denom_1 + denom_2;
	s = 1 / denom;
end