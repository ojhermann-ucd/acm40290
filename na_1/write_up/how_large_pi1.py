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
	over_flow = False
	while not over_flow:
		over_flow = (4*n == float("Inf"))
		if over_flow:
			pass
		else:
			prior = current
			current += (sum_element(n) * 4)
			n += 1
			print([n - 1, format(prior, ".32f")])
	return [n - 1, format(prior, ".32f")]

print(approximation_of_pi())