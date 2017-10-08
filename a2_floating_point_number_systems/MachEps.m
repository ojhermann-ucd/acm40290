function value = MachEps()
    
    % instantiate the estimate for machine epsilon
    me = 1.0;

    % use a while loop to refine the estimate
    while (1.0 + me) > 1.0
    	me = me / 2;
    end
    
    % set the return format
    format long;

    % return accounting for e/2
    value = me * 2.0;

end