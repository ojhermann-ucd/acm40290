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
	change = True
	while change:
		prior = current
		current *= (2 * product_element(n))
		n += 1
		change = (current != prior)
		print("Just tried {}".format(n - 1))
		print(current)
	return format(n - 1, ".32f")

# print(approximation_of_pi())

if 3 == float("Inf"):
	print("y")
else:
	print("n")