function y = DFUN(x);
% This is a function picker. E.g., if Fno = 4 then this returns y=DF4(x)

global FuncNo;
global NEvals;
switch FuncNo
    case 1
        y = DF1(x);
    case 2
        y = DF2(x); 
    case 3
        y = DF3(x);
    case 4
        y = DF4(x);  
    case 5
        y = DF5(x);
    case 6
        y = DF6(x); 
    case 7
        y = DF7(x);
    case 8
        y = DF8(x);
    case 9
        y = DF9(x);
    case 10
        y = DF10(x); 
    case 11
        y = DF11(x);
    case 12
        y = DF12(x);
   
    otherwise
        error('Global var Fno must be set to one of 1,2,...,13')
end;

NEvals(FuncNo) = NEvals(FuncNo) + 1;
    
function y = DF1(x);  y = 1 + sin(x);
function y = DF2(x);  y = exp(x+1.00202);
function y = DF3(x);  y = -(x * log(x) - x + 1) / (log(x) * (x - 1)^2 * x);  %----------------- to be written by students
function y = DF4(x);  y = 20*x^19;
function y = DF5(x);  y = 2*x - 3/(80*(3*(1-x)+1));  %----------------- to be written by students
function y = DF6(x);  z = (x-1.01*1.0e-9)*1.0e8; y = (z-4.0)*(z+2.0)+(z-4.0)*(z+41.0)+(z+2.0)*(z+41.0)*1.0e8;
function y = DF7(x);  y = (10*x - 11)^2 / (50 * abs(x - 11/10));
     if x < 1.1
         y = -(2.0*x-2.2);
     elseif x > 1.1
         y = (2.0*x-2.2);
     end;
function y = DF8(x);  
     if x < 9.1 
         y = -4.5*abs(x-9.1)^3.5;
     elseif x > 9.1 
         y =  4.5*abs(x-9.1)^3.5;
     end;
function y = DF9(x);  
     if x < 8.4317
         y = -0.4*abs(x-8.4317)^(-0.6);
     elseif x > 8.4317
         y =  0.4*abs(x-8.4317)^(-0.6);
     end;    
function y = DF10(x);  
    if abs(x) < 3.8e-4
        y = 0.0;
    else
        y = exp(-1.0/x^2)*(1.0 + 2.0/x^2) ;
    end;
    
function y = DF11(x);  
    if x > -1.0e6
        y = exp(x);
    else
        y = -2.0*(x+1.0+1.0e6);
    end;
        
function y = DF12(x); 
    y = inf;  %----------------- to be written by students
