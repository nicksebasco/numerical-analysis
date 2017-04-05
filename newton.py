from sympy import *
"""
Newton's Algorithm
	1.Theory
	2.Procedure
		a. input >> some single variable function f, the free variable x, some intial guess for f(x)=0 x0, TOL= the error threshold.
		b. find derivative of f (lots of different ways to do this, newtonA will abstract this using the sympy library )
		c. recursively calculate x1 until abs(x1-x0)<=TOL or max iteration lumit exceeded (possible divergence detected).
	3.Convergence
"""
def newton(f,var,x0,TOL):
	N0,N  = 1000,1000
	fprime = f.diff(var)
	func = lambdify(var,f)
	funcprime = lambdify(var,fprime)
	root = None
	while N > 0:
		N = N - 1
		x1 = x0 - func(x0)/float(funcprime(x0))
		print N0-N, x0, x1
		if abs(x0-x1) <= TOL:
			root = x1
			break
		x0 = x1
	return {"root":root,"iterations":N0-N}

if __name__ == "__main__":
	x = Symbol('x')
	x0 = 500000
	f  = 5*x**4-2.22+x/17-2*x**3
	TOL = 1e-100
	print newton(f,x,x0,TOL)
