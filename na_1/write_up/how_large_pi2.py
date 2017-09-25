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
		over_flow = (2*n == float("Inf"))
		if over_flow:
			pass
		else:
			prior = current
			current *= (product_element(n))
			n += 1
			print([n - 1, format(prior*2, ".32f")])
	return [n - 1, format(prior*2, ".32f")]

print(approximation_of_pi())