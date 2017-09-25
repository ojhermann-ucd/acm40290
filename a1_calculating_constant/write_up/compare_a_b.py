# fixed values
function_inputs = [10**x for x in (1, 3, 6, 9)]

pi_1_outputs = (
	3.0961615264636410671528210514225, 
	3.1410931531214445477928620675812, 
	3.1415921535904018924156844150275, 
	3.1415926445762156760110883624293
	)

pi_2_outputs = (
	3.0677038066434976215646202035714,
	3.1408077460303815975350971712032,
	3.1415918681917531785074970684946,
	3.1415925577422174619357519986806,
	)

matlab_pi = 3.1415926535897932384626433832795

acm40290_pi = 3.1415926535897932384626433832795


print("")
print("The difference between the matlab_pi and acm40290_pi is {}".format(matlab_pi - acm40290_pi, ".32f"))

pi_1_differences = [matlab_pi - pi for pi in pi_1_outputs]
print("")
print("Pi1(n) - matlab_pi: {}".format(pi_1_differences, ".32f"))

pi_2_differences = [matlab_pi - pi for pi in pi_2_outputs]
print("")
print("Pi2(n) - matlab_pi: {}".format(pi_2_differences, ".32f"))

comp_dict = dict()
for j in range(len(pi_2_differences)):
	pi1, pi2 = pi_1_differences[j], pi_2_differences[j]
	if pi1 > pi2:
		comp_dict[function_inputs[j]] = ("Pi2(n)", pi2, pi2/pi1)
	else:
		comp_dict[function_inputs[j]] = ("Pi1(n)", pi1, pi1/pi2)
print("")
for n in comp_dict:
	print("For n={}, {} is {} from matlab_pi and {}% of the other estimate ".format(n, comp_dict[n][0], comp_dict[n][1], comp_dict[n][2]))


"""
Pi1(n) is more accurate than Pi2(n) for the given values?

But also care about efficiency:
- which one overflows first?
- which can generate the most accurate estimate of pi?
"""