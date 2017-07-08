% Ratio's of noises: Fig_1- Q:0.125 R: 0.0005
% Ratio's of noises: Fig_2- Q:0.0000125 R:0.5
% Ratio's of noises: Fig_3- Q: 0.00125 R: 0.05

clc;
X_t = [0;0];

S = [0 0;0 0.00125];
Q = [0 0;0 0.00125];
R = 0.05;
Si = [1 1;0 1];
M = [1 0];

X_p = Si*X_t;
S_p = Si*S*Si' + Q;
I = [1 0;0 1];

for i = 1:numel(Y_t)
    k_t = S_p*(M'*(inv(M*S_p*M' + R)));
    X_up = X_p + k_t*(Y_t(i) - M*X_p);
    S_up = (I - k_t*M)*S_p;
    
    Z(i) = X_up(1);
    X_p = Si*X_up;
    S_p = Si*S_up*Si' + Q;
end

t = 1:numel(Y_t);
plot(t,Z,'r',t,Y_t)