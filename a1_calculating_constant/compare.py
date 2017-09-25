# values

powers = [1, 3, 6, 9]

Pi1 = [
	3.0961615264636410671528210514225,
	3.1410931531214445477928620675812,
	3.1415921535904018924156844150275,
	3.1415926445762156760110883624293,
]

Pi2 = [
	3.0677038066434976215646202035714,
	3.1408077460303815975350971712032,
	3.1415918681917531785074970684946,
	3.1415925577422174619357519986806,
]

EulerN = [
	2.7182818011463845131459038384492,
	2.7182818284590455348848081484903,
]

EulerC = [
	0.62638316097420787542660036706366,
	0.57771558156820645990592311136425,
	0.57721616490071525618077430408448,
	0.57721566540213942175796546507627,
]

matlab_pi = 3.1415926535897932384626433832795

acm40290_pi = 3.1415926535897932384626433832795

matlab_e = 2.7182818284590455348848081484903

acm40290_e =  2.7182818284590452353602874713527

acm40290_constant = 0.57721566490153286060651209008240


# relative error
def absolute_error(approx, actual):
	return abs(actual - approx)

def relative_error(approx, actual):
	return abs(1 - approx/actual)


# PI
print("")
print("The given values of Pi")
pi_difference = matlab_pi - acm40290_pi
print("matlab_pi = {}".format(format(matlab_pi, ".32f")))
print("acm40290_pi = {}".format(format(acm40290_pi, ".32f")))
print("matlab_pi - acm40290_pi = {}".format(format(pi_difference, ".32f")))
print("We will consider matlab_pi = acm40290_pi")

print("")
print("The values of Pi1(n) are:")
index = 0
for item in Pi1:
	n_value = powers[index]
	value = format(item, ".32f")
	message = "Pi1(10^{}) = {}".format(n_value, value)
	index += 1
	print(message)

print("")
print("Relative Error of Pi1(n) compared to matlab_pi")
index = 0
for item in Pi1:
	n_value = powers[index]
	r_error = format(relative_error(item, matlab_pi), ".32f")
	message = "Pi1(10^{}) has relative error of {}".format(n_value, r_error)
	index += 1
	print(message)

print("")
print("The values of Pi2(n) are:")
index = 0
for item in Pi2:
	n_value = powers[index]
	value = format(item, ".32f")
	message = "Pi2(10^{}) = {}".format(n_value, value)
	index += 1
	print(message)

print("")
print("Relative Error of Pi2(n) compared to matlab_pi")
index = 0
for item in Pi2:
	n_value = powers[index]
	r_error = format(relative_error(item, matlab_pi), ".32f")
	message = "Pi1(10^{}) has relative error of {}".format(n_value, r_error)
	index += 1
	print(message)

# EulerN
print("")
print("")
print("The given values of e")
print("matlab_e = {}".format(format(matlab_e, ".32f")))
print("acm40290_e = {}".format(format(acm40290_e, ".32f")))

print("")
print("The values of EulerN(n)")
index = 0
for item in EulerN:
	n_value = powers[index]
	value = format(item, ".32f")
	message = "EulerN(10^{}) = {}".format(n_value, value)
	index += 1
	print(message)

print("")
print("Relative Error of EulerN(n) compared to matlab_e")
index = 0
for item in EulerN:
	n_value = powers[index]
	r_error = format(relative_error(item, matlab_e), ".32f")
	message = "EulerN(10^{}) has relative error of {}".format(n_value, r_error)
	index += 1
	print(message)

print("")
print("Relative Error of EulerN(n) compared to acm40290_e")
index = 0
for item in EulerN:
	n_value = powers[index]
	r_error = format(relative_error(item, acm40290_e), ".32f")
	message = "EulerN(10^{}) has relative error of {}".format(n_value, r_error)
	index += 1
	print(message)

print("")
print("See report explaining the value of EulerN(10^3) and the absence of EulerN(10^6) and EulerN(10^9)")


#EulerC
print("")
print("")
print("The given value of Euler's constant")
print("acm40290_constant = {}".format(format(acm40290_constant, ".32f")))

print("")
print("The values of EulerC(n)")
index = 0
for item in EulerC:
	n_value = powers[index]
	value = format(item, ".32f")
	message = "EulerN(10^{}) = {}".format(n_value, value)
	index += 1
	print(message)

print("")
print("Relative Error of EulerC(n) compared to acm40290_constant")
index = 0
for item in EulerC:
	n_value = powers[index]
	r_error = format(relative_error(item, acm40290_constant), ".32f")
	message = "EulerC(10^{}) has relative error of {}".format(n_value, r_error)
	index += 1
	print(message)


# comparing Pi estimates
print("")
print("")
print("Relative Error of Pi1(n) as % of Relative Error of Pi2(n)")
index = 0
for item in Pi1:
	n_value = powers[index]
	value = format(relative_error(Pi1[index], matlab_pi) / relative_error(Pi2[index], matlab_pi), ".32f")
	message = "For 10^{}, the relative error of Pi1(n) is {} of the relative error of Pi2(n)".format(n_value, value)
	print(message)
	index += 1
print("")
print("3a: Are the two methods for computing pi equal?")
print("No, the two methods are not equal.")
print("Pi1(n) has a lower relative error than Pi2(n), which, ceteris paribus, suggests that Pi1(n) is better than Pi2(n)")

print("")
print("However, the sum components of Pi1(n) are ill-conditioned as cond(Pi1(n)) = 2 as n approaches infinity")
print("The product components of Pi2(n) are well-conditioned for large n, with cond(Pi2(n)) = 1 as n approaches infinity")
print("But because the initial product component of Pi2(n) is 4/3, Pi2(n) is also ill-conditioned.")

print("")
print("On the whole, it seems that Pi1(n) is a better method thatn Pi2(n)")

print("")

# def test_function(x):
# 	top = 8 * (4 * x + 2)
# 	bottom = (4 * x + 1) * (4 * x + 3)
# 	return x * top / bottom

# for i in range(0, 1000000):
# 	print(test_function(i))

# def test_fuction(x):
# 	top = 4 * x**2
# 	bottom = top - 1
# 	return top / bottom

# for i in range(0, 10):
# 	print(test_fuction(i))