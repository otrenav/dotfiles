function fx = funelectron(x)
% Juan P Aguilera 136078
% Luis M Román    117077
% Madeleine León  125154
%------------------------------------------
% Función potencial de np electrones sobre la esfera basada en la 
% ley de gravitación de Newton.
% x: vector de tamaño 3*np
% fx: número real
% -------------------------
n  = length(x);
np = floor(n / 3);
x  = x(1:3 * np);
fx = 0;
for i = 1:(np - 1)
    u = x(3 * (i - 1) + 1:3 * i);
    for j = i + 1:np
        v = x(3 * (j - 1) + 1:3 * j);
        fx = fx + (1 / norm(u - v));
    end
end