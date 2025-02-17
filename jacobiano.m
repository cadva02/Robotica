clear all
close all
clc

% Definir variables simbólicas
syms x y z

% Definir la función F(x, y, z)
F1 = sin(5*x^3 + 3*y - 4*y*x*z^2);
F2 = -10*x^5 - 4*y*x*z + 15*x*z^4;
F3 = cos(-x*y*z^5 - 6*x*y^5*z - 7*y*x*z^2);

%Derivadas en F1
F1dx=diff(F1,x);
F1dy=diff(F1,y);
F1dz=diff(F1,z);

%Derivadas en F2
F2dx=diff(F2,x);
F2dy=diff(F2,y);
F2dz=diff(F2,z);

%Derivadas en F3
F3dx=diff(F3,x);
F3dy=diff(F3,y);
F3dz=diff(F3,z);

%Definimos los valores de x y z
x_val = -5;
y_val = -4;
z_val = 1;

%Sustituimos los valores en las derivadas de F1 F2 F3
F1dx_val = subs(F1dx, {x, y, z}, {x_val, y_val, z_val});
F1dy_val = subs(F1dy, {x, y, z}, {x_val, y_val, z_val});
F1dz_val = subs(F1dz, {x, y, z}, {x_val, y_val, z_val});

F2dx_val = subs(F2dx, {x, y, z}, {x_val, y_val, z_val});
F2dy_val = subs(F2dy, {x, y, z}, {x_val, y_val, z_val});
F2dz_val = subs(F2dz, {x, y, z}, {x_val, y_val, z_val});

F3dx_val = subs(F3dx, {x, y, z}, {x_val, y_val, z_val});
F3dy_val = subs(F3dy, {x, y, z}, {x_val, y_val, z_val});
F3dz_val = subs(F3dz, {x, y, z}, {x_val, y_val, z_val});

%Mostramos la matriz jacobiana resultante en el punto (-5, -4, 1)
disp('Matriz jacobiana en el punto (-5, -4, 1)');

F(:,:,1) = [F1dx_val F1dy_val F1dz_val;
            F2dx_val F2dy_val F2dz_val;
            F3dx_val F3dy_val F3dz_val];
pretty(F)