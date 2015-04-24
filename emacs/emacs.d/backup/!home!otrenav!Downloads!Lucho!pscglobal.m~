function [x,fval,iter,lambda, fin] = pscglobal(fname,funh,x,maxiter)
% Juan P Aguilera 136078
% Luis M Román    117077
% Madeleine León  125154
%------------------------------------------
% Inicialización de parámetros
%------------------------------------------
% Este programa resuelve resuelve el problema cuadrático 
% con restricciones usando programación cuadratica sucesiva 
tol     = .01;     % Tolerancia a las condiciones necesarias de primer orden
C       = 1.0;     % Penalización
%------------------------------------------
iter = 0;                   
f    = feval(fname,x);
h    = feval(funh,x);
df   = gradiente(fname,x);
dh   = jacobiana1(funh,x);
n    = length(x);
m    = length(h);
B    = eye(n,n);
%Multiplicador de Lagrange
lambda = ones(m,1);
fin    = norm([[ df + dh' * lambda]' h']);
%------------------------------------------
% Iteración
%------------------------------------------
while ( (fin >= tol) && (iter < maxiter) )
    lastLag   = (df + dh' * lambda);
    [p,lambda] = PCDirecto(B,dh,df,-h); %pc directo
    % Se calcula el parametro c
    normah     = norm(h);
   if (normah>1.0e-6)
        gradl = df + dh' * lambda;
        sigma = (gradl' * p)/(h' * h); 
        CAux  = abs(sigma) + 1;
        C     = max([C CAux]);
    % Condicion de Wolfe 1 / Busqueda de Línea
    cond1 = f + h' * lambda + (C/2) * h' * h;
    cond2 = (df + dh'*lambda)' * p - C * h' * h;
    alfa = 1.0;
    xt   = x + alfa * p;
    fxt  = feval(fname, xt);
    hxt  = feval(funh, xt);
    Lxt  = fxt + hxt' * lambda + (C/2) * (hxt' * hxt);
    c1   = 1.0e-4;
    j    = 0;
    jmax = 13;
    while(Lxt > cond1 + alfa * c1 * cond2 && j < jmax)
        alfa = alfa/2;
        xt   = x+alfa*p;
        fxt  = feval(fname,xt);
        hxt  = feval(funh,xt);
        Lxt  = fxt + hxt' * lambda + (C/2) * (hxt' * hxt);
        j    = j + 1;
    end
    if j == jmax
        alfa = 1.0;
    end
    
   else
       alfa = 1.0;
   end
    %------------------------------------------
    x  = x + alfa * p; %nuevo punto.
    %------------------------------------------
    f  = feval(fname,x);
    h  = feval(funh,x);
    df = gradiente(fname,x);
    dh = jacobiana1(funh,x);
    % multiplicador por minimos cuadrados lineales
    lambda = -(dh * dh') \ (dh * df);
    lag    = df + dh' * lambda ;
    % Actualización de la aproximación al hessiano
    B    = Powell(B, alfa * p, lag - lastLag);
    fin  = norm([(df + dh' * lambda)' h']);
    iter = iter + 1;
    if n >= 120
    normrec(iter) = fin;
    end
end
% Graficamos norma del lagrangeano vs el número de iteraciones.
if n >= 120
plot(1:iter,normrec)
end
fval = feval(fname,x);





