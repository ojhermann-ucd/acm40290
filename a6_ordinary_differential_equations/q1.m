function q1

t = 0:1:100;

initial_u_1 = 1;
initial_u_2 = 0;

[t,x]=ode45( @rhs, t, [initial_u_1; initial_u_2] );

plot(t,x(:,1));
xlabel('t'); ylabel('x');

    function dudt=rhs(t,u)
        dudt_1 = u(2);
        dudt_2 = -sin(u(1));
        dudt = [dudt_1; dudt_2];
    end
end