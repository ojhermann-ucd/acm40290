function q2

% convert to first order system
% syms y(t);
% eqn = diff(y,2) + sin(y);
% V = odeToVectorField(eqn);

% initial values
initial_1 = 1;
initial_2 = 0;

% t values
t = 0:1:100;

% ode45
[t,u] = ode45( @rhs, t, [initial_1; initial_2], eps*t);

plot(u(:,1),u(:,2));
xlabel('u1'); ylabel('u2');

% function
     function dudt = rhs(t, u)
         dudt = [u(1); -sin(u(2))];
     end
end