function area = compositeTrapezoid( f,interval,n )
%{
 INPUT:  f=function; interval=[a,b]; n=# of subintervals
 FUNCTIONALITY:  Approximate integral of f along interval=[a,b] using the 
 composite trapezoid rule.
 THEORY:  The composite trapezoid rule approximates the area under f, by
 forming n linear lagrange polynomials  which approximate f, then summing the 
 component areas approximated by taking the integrals of each polynomial.
 EQUATION:  h/2[ f(a) + 2*sum(f(xj)) + f(b) ] - Error; where xj = a+jh.
 ERROR =  h^2 * f''(u) * (b-a)/12
%}
h =(interval(2)-interval(1))/n;
sum = 0;
for i = interval(1)+h:h:interval(2)-h
    sum = sum + f(i);
end
area = h/2*( f(interval(1)) + 2*sum + f(interval(2)) );
end

