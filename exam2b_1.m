% Exam 2b Question (1a)
p = -2*pi; % actual value, when definite integral is evaluated.
n = arrayfun(@(x) 10^x,1:6); % n-values (sub intervals used by composite trapezoid rule.)
f = @(x) x*x*cos(x);
interval = [0,pi]; % [a,b]
dataStore = []; % holds output table data.
approximated = zeros(numel(n)); % approximation of p at each h.
hvalues = zeros(numel(n)); % collection of h values.

format short g % or long g if you need to see additional precision.
disp('         n          pn       |pn - p|');% display table variables
for i = 1:numel(n)
    pn = compositeTrapezoid(f,interval,n(i));
    dataStore=[dataStore;n(i) pn abs(pn-p)];
    hvalues(i)= (interval(2)-interval(1))/n(i); 
    approximated(i) = abs(pn-p); 
end
disp(dataStore); loglog(n,data,n,hvalues.^2,'ro-'); grid on; % display table in console and loglog plot in separate window.
% from the plot (error vs h^2), the slopes are identical and thus we can say that the 
% rate of convergence of the error is h^2.

