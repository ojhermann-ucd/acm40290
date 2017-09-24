# Pi1(n)

def sum_element_1(n):
	return 1 / (4*n + 1)

def sum_element_2(n):
	return 1 / (4*n + 3)

def sum_element(n):
	return sum_element_1(n) - sum_element_2(n)

def approximation_of_pi():
	prior = 0
	current = 0
	n = 0
	change = True
	while change is True:
		prior = current
		current += sum_element(n)
		n += 1
		change = (current != prior)
		print("Just tried {}".format(n - 1))
	return n - 1

approximation_of_pi()