function q1

% t range
t = 0:100;

% alpha
alpha = 0.99;

% initial values
initial_u_1 = alpha;
initial_u_2 = 0;

% ODE
[t, u] = ode45(@rhs, t, [initial_u_1; initial_u_2], eps*t);


% plot
plot(u(:,1),u(:,2));
xlabel('u1'); ylabel('u2');


function dudt = rhs(t, u)
    dudt = [u(2); -sin(u(1))];
end

end