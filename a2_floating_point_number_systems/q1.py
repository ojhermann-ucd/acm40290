def mach_eps():

	# instantiate machine epsilon
	me = 1.0

	# while loop to determine me
	while (1.0 + me) > 1.0:
		me /= 2

	# return by converting from e/2
	return me * 2

print(mach_eps())