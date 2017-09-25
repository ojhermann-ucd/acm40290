from datetime import datetime

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
		current += (sum_element(n) * 4)
		n += 1
		change = (prior != current)
	return [n - 1, format(prior, ".32f")]


if __name__ == "__main__":
	output = approximation_of_pi()
	with open("max_accuracy_pi1.txt", "a") as source:
		source.write(str(datetime.now()) + "\n")
		source.write("n = {}, pi = {}".format(output[0], output[1]))
		source.write("")