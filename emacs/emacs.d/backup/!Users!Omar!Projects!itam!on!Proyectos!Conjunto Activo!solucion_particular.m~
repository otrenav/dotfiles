%
% Solución particular de Ax=b
% usando la pseudo inversa de A.
%
% In:
% - A: matriz en R^mxn, m < n, rango(A) = m
% - b: vector en R^m
%
% Out:
% - xp: Yb = A'inv(AA')b
%       w = inv(AA')b => xp = A'w
%
% Omar Trejo Navarro, 119711
% Natalia Orozco Urquijo, 111008
%
% Optimización Numérica
% Prof. Zeferino Parada
% Enero, 2015
%
function [xp] = sol_particular(A, b)
    M = A*A';
    L = chol(M);    % Factor de Cholesky triangular
                    % inferior con diagonal positiva.
    z = L\b;
    w = L'\z;
    xp = A'*w;
end
