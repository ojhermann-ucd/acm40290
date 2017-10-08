function [me_estimate, precision] = MachEps()
    
    % instantiate the estimate for machine epsilon
    me_estimate = 1.0;
    precision = 0;

    % use a while loop to refine the estimate
    while (1.0 + me_estimate) > 1.0
    	me_estimate = me_estimate / 2;
    	precision = precision + 1;
    end

    % return accounting for e/2 in the last step
    me_estimate = me_estimate * 2.0;
    precision = precision;
    
    
end

%{
    My solution used a while loop to iteratively determine machine epsilon, the difference between 1.0 and the next hightest floating point number.  If for a given value of me, Matlab was able to distinguish between 1.0 and 1.0+me, I would divide me by 2 and repeat.  Once 1.0 and 1.0+me were indistinguishable, I returned the penultimate value of me i.e. 2 * me, as it was the last value that allowed Matlab to delineate 1.0 and 1.0+me.
    My results were identical to Matlabs eps, the built in value of me, so my method seems to work well.  Also, knowing that our base is 2 and seeing that precision is estimated to be 53, we can check that 2^-52 = out output = b^1-p as desired.
%}