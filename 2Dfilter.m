% Fig_1
% S = [0 0 0 0;0 0 0 0;0 0 0.01 0.005;0 0 0.005 0.01];
% Q = [0 0 0 0;0 0 0 0;0 0 0.01 0.005;0 0 0.005 0.01];
% R = [1 0.5;0.5 1];

% Fig_2
% S = [0 0 0 0;0 0 0 0;0 0 0.1 0.05;0 0 0.05 0.1];
% Q = [0 0 0 0;0 0 0 0;0 0 0.1 0.05;0 0 0.05 0.1];
% R = [0.01 0.005;0.005 0.01];

% Fig_3
% S = [0 0 0 0;0 0 0 0;0 0 0.05 0.025;0 0 0.025 0.05];
% Q = [0 0 0 0;0 0 0 0;0 0 0.05 0.025;0 0 0.025 0.05];
% R = [0.6 0.3;0.3 0.6];

clc;
X_t = [0;0;0;0];

S = [0 0 0 0;0 0 0 0;0 0 0.05 0.025;0 0 0.025 0.05];
Q = [0 0 0 0;0 0 0 0;0 0 0.05 0.025;0 0 0.025 0.05];
R = [0.6 0.3;0.3 0.6];
Si = [1 0 1 0;0 1 0 1;0 0 1 0;0 0 0 1];
M = [1 0 0 0;0 1 0 0];

X_p = Si*X_t;
S_p = Si*S*Si' + Q;
I = [1 0 0 0;0 1 0 0;0 0 1 0;0 0 0 1];

for i = 1:numel(X_1)
    Y = [X_1(i);Y_1(i)];
    k_t = S_p*(M'*(inv(M*S_p*M' + R)));
    X_up = X_p + k_t*(Y - M*X_p);
    S_up = (I - k_t*M)*S_p;
    
    Z_1(i) = X_up(1);
    Z_2(i) = X_up(2);
    
    X_p = Si*X_up;
    S_p = Si*S_up*Si' + Q;
end

t = 1:numel(X_1);
plot(t,Z_1,t,X_1)
figure
plot(t,Z_2,t,Y_1)

