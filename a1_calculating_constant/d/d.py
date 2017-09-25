from math import log

def sum_element(n):
	return 1 / n

def approximation_of_e_constant(limit):
	n = 1
	estimate = 0
	while n < limit + 1:
		estimate += sum_element(n)
		n += 1
	return estimate - log(n - 1)

for i in [1, 3, 6, 9]:
	print(approximation_of_e_constant(10**i))