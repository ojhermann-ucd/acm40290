function q2

% convert to first order system
% syms y(t);
% eqn = (1/2) * diff(y,2) + sin(y);
% V = odeToVectorField(eqn);
% disp(V);

% t range
t = 0:100;

% alpha
alpha = 1;

% initial values
initial_u_1 = alpha;
initial_u_2 = 0;

% function
function dudt = rhs(t, u)
    dudt = [u(2); -2 * sin(u(1))];
end

% ODE
opts = odeset('RelTol',10e-8,'AbsTol',10e-8);
[t, u] = ode45(@rhs, t, [initial_u_1; initial_u_2], opts);

% plot
plot(abs(u - [initial_u_1, initial_u_2]) / [initial_u_1, initial_u_2] ), log(t);
xlabel('t'); ylabel('E(t) - E(0)');

end