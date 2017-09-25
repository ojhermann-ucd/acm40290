from datetime import datetime

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
		current *= (product_element(n))
		n += 1
		change = (2*prior != 2*current)
	return [n - 1, format(prior*2, ".32f")]


if __name__ == "__main__":
	output = approximation_of_pi()
	with open("max_accuracy_pi2.txt", "a") as source:
		source.write(str(datetime.now()) + "\n")
		source.write("n = {}, pi = {}".format(output[0], output[1]))
		source.write("")