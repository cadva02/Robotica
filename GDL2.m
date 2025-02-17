clear all
close all
clc

syms l1 l2 t th1(t) th2(t)

% Configuración del robot, @ para junta rotacional, 1 para junta prismática
RP = [0 0];

% Creamos el vector de coordenadas articulares
Q = [th1, th2];
disp('Coordenadas generalizadas');
pretty(Q);

% Creamos el vector de velocidades generalizadas
Qp = diff(Q, t);
disp('Velocidades generalizadas');
pretty(Qp);

% Número de grado de libertad del robot
GDL = size(RP, 2);
GDL_str = num2str(GDL);

% Junta 1
% Posición de la junta 1 respecto a 0
P(:,:,1) = [l1*cos(th1);
            l1*sin(th1);
            0];
% Matriz de rotación de la junta 1 respecto a 0
R(:,:,1) = [cos(th1) -sin(th1) 0;
             sin(th1) cos(th1) 0;
             0        0        1];

% Junta 2
% Posición de la junta 2 respecto a 0
P(:,:,2) = [l2*cos(th2+th1); 
            l2*sin(th2+th1); 
            0];
% Matriz de rotación de la junta 2 respecto a 0
R(:,:,2) = [cos(th2) -sin(th2) 0;
             sin(th2) cos(th2) 0;
             0        0        1];
Pe = P(:,:,1)  +P(:,:,2);

disp('Posición del extremo del robot');
pretty(Pe);


% Derivadas parciales para obtener el Jacobiano (sin inicializar la matriz)
Jv = [simplify(diff(Pe(1), th1)), simplify(diff(Pe(1), th2));
      simplify(diff(Pe(2), th1)), simplify(diff(Pe(2), th2));
      simplify(diff(Pe(3), th1)), simplify(diff(Pe(3), th2))];

% Mostrar el Jacobiano
disp('Jacobiano de la posición del extremo del robot usando diff')
pretty(Jv)