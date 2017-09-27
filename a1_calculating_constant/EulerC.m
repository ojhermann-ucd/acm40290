function value = EulerC(n)
	current = 1;
	estimate = 0;
	while current <= n
		estimate = estimate + sum_element(current);
		current = current + 1;
	end
	value = vpa(single(estimate - log(n)));
end

function s = sum_element(n)
	s = 1 / n;
end