def sum_element_1(n):
	return 1 / (4*n + 1)

def sum_element_2(n):
	return 1 / (4*n + 3)

def sum_element(n):
	return sum_element_1(n) - sum_element_2(n)

def approximation_of_pi(limit):
	estimate = 0
	n = 0
	while n <= limit:
		estimate += sum_element(n)
		n += 1
	return estimate * 4


for i in [1, 3, 6, 9]:
	print(approximation_of_pi(10**i))