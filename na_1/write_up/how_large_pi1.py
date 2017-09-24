# Pi1(n)

def sum_element_1(n):
	return 1 / (4*n + 1)

def sum_element_2(n):
	return 1 / (4*n + 3)

def sum_element(n):
	return sum_element_1(n) - sum_element_2(n)

def approximation_of_pi():
	n = 0
	prior = 0
	current = 0
	change = True
	while change:
		prior = current
		current += (4 * sum_element(n))
		n += 1
		change = (current != prior)
	return format(n - 1, ".32f")

print(approximation_of_pi())