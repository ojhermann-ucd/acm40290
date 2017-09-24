# Pi2(n)

def product_element_1(n):
	return (2*n) / (2*n - 1)

def product_element_2(n):
	return (2*n) / (2*n + 1)

def product_element(n):
	return product_element_1(n) * product_element_2(n)

def approximation_of_pi():
	n = 1
	prior = 1
	current = 1
	over_flow = False
	while not over_flow:
		prior = current
		current *= (product_element(n))
		n += 1
		over_flow = (current*2 == float("Inf"))
	return [n - 1, format(prior*2, ".32f")]

print(approximation_of_pi())