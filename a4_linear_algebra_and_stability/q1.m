% inputs
A = [5 7 6 5; 7 10 8 7; 6 8 10 9; 5 7 9 10];
b = [23; 32; 33; 31];
x = [1;1;1;1];

% RELATIVE ERROR IN THE CALCULATED X
fprintf('Q1a \n');
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
fprintf('Q1b \n');
fprintf('----------------------------------------------------------------- \n');
fprintf('b \n');
disp(b);
fprintf('Ax_calc \n');
disp(A\x_calc);
fprintf('r = b - Ax_calc \n');
disp(b - A\x_calc);
fprintf('\n');

% COND(A)
fprintf('Q1c \n');
fprintf('----------------------------------------------------------------- \n');
fprintf('cond(A) \n');
disp(cond(A));
fprintf('\n');

% LUP
fprintf('Q1d \n');
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