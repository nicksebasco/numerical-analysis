function Quadrature(f,trueValue,I,nValues,method,cnvg)
%{
 INPUTS: f = function of interest, trueValue = true value of integral when
 evaluated at interval (I), nValues = array of n-partitions used by the
 quadrature methods, method = specific quadrature formula to use, cnvg =
 theoretical rate of error convergence.

 Functionality: Input a function of interest along with it's true analytic
 integral along some interval I, specify an array containg i
 sets of subintervals {ni,...}, choose a quadrature method, view tabulated
 & graphical data for the method chosen.
%}
dataStore = []; % holds output table data.
approximated = zeros(numel(nValues)); % approximation of p at each h.
hvalues = zeros(numel(nValues)); % collection of h values.

format short g % or long g if you need to see additional precision.
disp('         n          pn       |pn - p|');% display table variables

for i = 1:numel(nValues)
    if (strcmp('trapezoid',method)); pn = compositeTrapezoid(f,I,nValues(i)); else pn = compositeSimpsons(f,I,nValues(i));end  
    dataStore=[dataStore;nValues(i) pn abs(pn-trueValue)];
    hvalues(i)= (I(2)-I(1))/nValues(i); 
    approximated(i) = abs(pn-trueValue); 
end
disp(dataStore); loglog(nValues,approximated,nValues,hvalues.^(cnvg),'ro-'); grid on; % display table in console and loglog plot in separate window.
fprintf('Since n v. error has the same slope as n v. h^%d,\n the rate of convergence of error for the composite %s formula must be h^%d.\n',cnvg,method,cnvg);

end