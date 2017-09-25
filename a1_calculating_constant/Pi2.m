function p = Pi2(n)
	current = 1;
	estimate = 1;
	while current <= n
		estimate = estimate * product_element(current);
		current = current + 1;
	end
	p = vpa(estimate * 2);
end

function p = product_element(n)
	numerator = 2 * n;
	denominator_1 = numerator - 1;
	denominator_2 = numerator + 1;
	p1 = numerator / denominator_1;
	p2 = numerator / denominator_2;
	p = p1 * p2;
end