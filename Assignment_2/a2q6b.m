clear all;
% Parameters:
Tend = 10;
N = 50;
h = 10/N;

% Initialization:
i = 1;
t(i) = 0;
A = [-20 10 0 0; 10 -20 10 0; 0 10 -20 10; 0 0 10 -20];
y{i} = transpose([1 1 1 1]);
n(i) = norm(y{i});
B = eye(4) - h*A;
% Backward Euler Method
while (t(i) + h < Tend + 1e-12)
    y{i+1} = inv(B)*y{i};
    n(i+1) = norm(y{i+1});
    t(i+1) = t(i) + h;
    i = i + 1;
end

% Initialization:
i = 1;
t1(i) = 0;
A = [-20 10 0 0; 10 -20 10 0; 0 10 -20 10; 0 0 10 -20];
n1(i) = norm(y{i});
n1(i+1) = norm(y{i+1});
B = eye(4) - (2/3 * h*A);
% 2-step BDF method:
while (t(i) + h < Tend + 1e-12)
    y{i+2} = inv(B)*(4/3 * y{i+1} - 1/3 * y{i});
    n1(i+2) = norm(y{i+2});
    t1(i+1) = t1(i) +h;
    i = i + 1;
end

n1 = n1(1:end-1);
figure(1);
plot(t1, n1);
xlabel('t');
ylabel('Euclidean norm (2-step BDF method)')
    
