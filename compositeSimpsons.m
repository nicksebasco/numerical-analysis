function area = compositeSimpsons( f,interval,n )
%{
 INPUT:  f=function; interval=[a,b]; n=# of subintervals
 FUNCTIONALITY:  Approximate integral of f along interval=[a,b] using the 
 composite simpson's rule.
 THEORY:  The composite simpson's rule approximates the area under f, by
 forming n 2-lagrange polynomials  which approximate f, then summing the 
 component areas approximated by taking the integrals of each polynomial.
 EQUATION:  h/3[ f(a) + 2*sum(f(x2j)) +4*sum(f(x2j-1)) + f(b) ] - Error; where xj = a+jh.
 ERROR =  h^4 * f''''(u) * (b-a)/180
%}

h =(interval(2)-interval(1))/n;
XI0 = f(interval(1)) + f(interval(2)); XI1 = 0; XI2 = 0;

for i = 1:n-1
    X = interval(1)+i*h;
    if mod(i,2) == 0
        XI2 = XI2 + f(X);
    else
        XI1 = XI1 + f(X);
    end
end

area = (XI0 + 2*XI2 + 4*XI1) * h/3;
end
