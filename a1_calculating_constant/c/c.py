# def factorial(n, value):
# 	if n == 1 or n == 0:
# 		return value
# 	else:
# 		value *= n
# 		return factorial(n -1, value)

def factorial(n):
	f = 1
	while n > 1:
		f *= n
		n -= 1
	return f

def sum_element(n):
	return 1 / factorial(n)

def approximation_of_e(limit):
	n = 0
	estimate = 0
	while n < limit + 1:
		estimate += sum_element(n)
		n += 1
	return estimate

for i in [1, 3, 6, 9]:
	print(approximation_of_e(10**i))