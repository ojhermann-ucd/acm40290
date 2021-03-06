% inputs
A = [5 7 6 5; 7 10 8-.1 7; 6 8 10 9; 5 7 9 10];
b = [23; 32; 33; 31];
x = [1;1;1;1];

% RELATIVE ERROR IN THE CALCULATED X
fprintf('Q2a \n');
fprintf('----------------------------------------------------------------- \n');
x_calc = A\b;
x_re = norm(x_calc - x);
fprintf('x \n');
disp(x);
fprintf('x_calc \n');
disp(x_calc);
fprintf('relative error in x_numerical \n');
disp(x_re);
fprintf('\n');

% RESIDUAL VECTOR r = b - Ax_calc
fprintf('Q2b \n');
fprintf('----------------------------------------------------------------- \n');
fprintf('b \n');
disp(b);
fprintf('Ax_calc \n');
disp(A\x_calc);
fprintf('r = b - Ax_calc \n');
disp(b - A\x_calc);
fprintf('\n');

% COND(A)
fprintf('Q2c \n');
fprintf('----------------------------------------------------------------- \n');
fprintf('cond(A) \n');
disp(cond(A));
fprintf('\n');

% LUP
fprintf('Q2d \n');
fprintf('----------------------------------------------------------------- \n');
[L, U, P] = lu(A);
fprintf('L \n');
disp(L);
fprintf('U \n');
disp(U);
fprintf('P \n');
disp(P);
fprintf('L*U \n');
disp(L*U);
fprintf('P*A \n');
disp(P*A);
fprintf('demonstrating  that L*U = P*A \n');
fprintf('\n');

% Explanation
fprintf('Q2 explanation \n');
fprintf('----------------------------------------------------------------- \n');
fprintf('The core issue is that A is ill-conditioned: \n');
disp(cond(A));
fprintf('And when creating L, U, and P, we see a further issue in U: \n');
disp(U);
fprintf('P_44 is very close to zero, which will cause roundoff problems. \n');