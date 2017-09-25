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


# comp_fnc
def comp_fnc(powers, external, values):
	index = 0
	return_array = list()
	for v in values:
		if v > external:
			return_array.append(("over estimates by", powers[index], v - external))
		elif v < external:
			return_array.append(("under estimates by", powers[index], external - v))
		else:
			return_array.append(("provides the same estimate within", powers[index], external - v))
		index += 1
	return return_array


# PI
print("")
pi_difference = matlab_pi - acm40290_pi
print("matlab_pi is {} and acm40290_pi is {}".format(format(matlab_pi, ".32f"), format(acm40290_pi, ".32f")))
print("Their difference is {}, so we will treat them as equal".format(format(pi_difference, ".32f")))

print("")
for item in comp_fnc(powers, matlab_pi, Pi1):
	print("Pi1(n) for n = 10^{} {} {} when compared to matlab_pi".format(item[1], item[0], format(item[2], ".32f")))

print("")
for item in comp_fnc(powers, matlab_pi, Pi2):
	print("Pi2(n) for n = 10^{} {} {} when compared to matlab_pi".format(item[1], item[0], format(item[2], ".32f")))


# e
print("")
print("matlab_e is {}".format(format(matlab_e, ".32f")))
for item in comp_fnc(powers, matlab_e, EulerN):
	print("EulerN(n) for n = 10^{} {} {} when compared to matlab_e".format(item[1], item[0], format(item[2], ".32f")))
print("")
print("acm40290_e is {}".format(format(acm40290_e, ".32f")))
for item in comp_fnc(powers, acm40290_e, EulerN):
	print("EulerN(n) for n = 10^{} {} {} when compared to matlab_e".format(item[1], item[0], format(item[2], ".32f")))
