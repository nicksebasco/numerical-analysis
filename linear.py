"""
Straight line, Slope m is known, one point P1 is known, length P1P2 is known,
how to get P2?
"""
from math import sin,  atan
from random import randint

x     = lambda y2, m, x1, y1: (y2 - y1)/float(m) + x1
y     = lambda l, m, y1: l*sin( atan(m)  ) + y1
slope = lambda x1,y1,x2,y2: (y2-y1)/float(x2-x1)
dist  = lambda x1,y1,x2,y2: ( (y2-y1)**2 + (x2-x1)**2  )**(0.5)

# p2 ( x2 > x1, y2 > y1 or x2 > x1, y2 < y1 )
p1 =  [randint(1,1000),randint(1,1000)]  #[1,5.5]
p2 =  [randint(p1[0],1001),randint(0,p1[1])] #[12,23]

# calculate distance between p1 & p2 (L), also calculate slope (m)
L = dist(p1[0],p1[1],p2[0],p2[1])
m = slope(p1[0],p1[1],p2[0],p2[1])

#  now see if our functions for x & y yield p2
y2 = y(L,m,p1[1])
p_theoretical = [ x(y2,m,p1[0],p1[1]),y2  ]
TOL = 1e-6
print "p1: ",p1 , "p2 actual: ",p2, "p2 therory: ",p_theoretical
print "p2 theory = p2 actual" if abs(p_theoretical[1] - p2[1]) <= TOL else "NOT EQUAL"
