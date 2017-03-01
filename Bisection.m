function Bisection(f,a,b)
    %{
    Bisection Root Finding Algorithm:
    
    theory:
    let f, be a continuous function defined on [a,b] with 
    sign(f(a)) =/= sign(f(b)); the intermediate value theorem implies
    that for some p in (a,b) f(p) = 0.  

    procedure:
    1. a0 = a, b0 = b, p0 = (a0 + b0)/2
    2. If f(p0) = 0; root has been found. ( or if f(p0)<TOL, where TOL is
    some user specified tolerance. )
    3. if f(p0) =/= 0; then sign(f(p0)) = ( sign(f(a0)) or sign(f(b0)) )
    => From the intermediate value theorem we know that we need to keep an 
    interval such that sign(f(a0)) =/= sign(f(b0)) to ensure that a root
    will always lie within the interval.
    
    assume f(a0) < 0 and f(b0) > 0:

    case 1 f(p0) < 0:
    a0 = p0;
    [a,b] = [p0,b0];

    case 2 f(p0) > 0:
    b0 = p0;
    [a,b] = [a0,p0]
    
    4. Repeat steps 1-3 until f(p0) = 0, or f(p0) falls within accepted 
    tolerance.
    
    convergence:
    linear
    %}

    iv   = 1;   % iteration start
    n0  = 100;  % max iterations
    a0  = a;    % Left  endpoint
    b0  = b;    % Right endpoint
    TOL = 1e-8; % error tolerance
    fd  = 0;    % Root found? 
    p0 =  0;    % Root value
    
    format long
    
    if f(a)*f(b) > 0
        error('The bisection method is not valid for this interval.')
    else
        % initialize starting point p.
        p = (a0+b0)/2;
        while iv < n0
            % iteration data
            iteration = [iv p f(p)]
            % check if root was found.
            if f(p) == 0 || abs(f(p)) < TOL
                fd = 1;
                p0 = p; 
                break
            else
                if f(p)*f(a) < 0 
                    b0 = p;
                else
                    a0 = p;
                end    
            end
            % increment iteration count and bisect new interval.
            iv = iv + 1;
            p = (a0+b0)/2;
        end 
        
        if fd
            fprintf('Root found @ p = %d\n',p0)
        else
            fprintf('Process failed after %d operations\n',n0)
        end
            
    end
end

