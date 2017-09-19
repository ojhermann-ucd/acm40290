function p = approx_pi(n)
	current = 0;
	estimate = 0;
	while current <= n
		estimate = estimate + the_sum(current);
		current = current + 1;
	end
	p = estimate * 4;
end