def product_element_1(n):
	return (2*n) / (2*n - 1)

def product_element_2(n):
	return (2*n) / (2*n + 1)

def product_element(n):
	return product_element_1(n) * product_element_2(n)

def approximation_of_pi(limit):
	n = 1
	estimate = 1
	while n < limit + 1:
		estimate *= product_element(n)
		n += 1
	return 2 * estimate

for i in [1, 3, 6, 9]:
	print(approximation_of_pi(10**i))