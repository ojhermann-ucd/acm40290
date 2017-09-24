def product_element_1(n):
	return (2*n) / (2*n - 1)

def product_element_2(n):
	return (2*n) / (2*n + 1)

def product_element(n):
	return product_element_1(n) * product_element_2(n)

def approximation_of_pi():
	prior = 1
	current = 1
	n = 0
	change = True
	while change is True:
		prior = current
		current *= sum_element(n)
		n += 1
		change = (current != prior)
		print("Just tried {}".format(n - 1))
	return n - 1

approximation_of_pi()