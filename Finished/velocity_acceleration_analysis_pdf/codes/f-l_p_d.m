function [rB, rC, rE] = d_pos(phi)
global AB BC CD CE rD, syms x y theta(t)

% set variables
xB = AB*cos(theta(t)); yB = AB*sin(theta(t));
rB = [xB, yB, 0]; rC = [x, y, 0]; rE = [x, y, 0];

% find rC
eq1 = (rB(1)-x)^2 + (rB(2)-y)^2 == BC^2;
eq2 = (x-rD(1))^2 + (y-rD(2))^2 == CD^2;
sol = solve(eq1, eq2, x, y);
if 0>subs(sol.x(1), theta, phi)
    rC = subs(rC, [x,y], [sol.x(1),sol.y(1)]);
else
    rC = subs(rC, [x,y], [sol.x(2),sol.y(2)]); end