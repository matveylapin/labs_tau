clc;
clear all;
close all;

ALFA1 = 0.05;
GAMMA1 = 0.1;
START1 = [0.1 -0.1 0.1];

ALFA2 = 1.1;
GAMMA2 = 0.87;
START2 = [-1 -0 0.5];

plot_3d_RF(ALFA1, GAMMA1, START1, [0 500], 'ode23t')
plot_3d_RF(ALFA1, GAMMA1, START1, [0 500], 'ode45')

plot_3d_RF(ALFA2, GAMMA2, START2, [0 500], 'ode23t')
plot_3d_RF(ALFA2, GAMMA2, START2, [0 500], 'ode45')

function plot_3d_RF(p_alfa, p_gamma, start_point, tspan, solver)

figure
ddt = @(t, x) transpose([x(2)*(x(3) - 1 + x(1) ^ 2) + p_gamma*x(1) ...
    x(1)*(3*x(3)+1-x(1)^2) + p_gamma*x(2) ...
    -2 * x(3) * (p_alfa + x(1) * x(2))]);

if isequal(solver, 'ode45')
    result = ode45(ddt, tspan, start_point, odeset('RelTol',1e-3));
elseif isequal(solver, 'ode23t')
    result = ode23t(ddt, tspan, start_point, odeset('RelTol',1e-3));
else 
    result = ode45(ddt, tspan, start_point, odeset('RelTol',1e-3));
end

plot3(result.y(1, :), result.y(2, :), result.y(3, :));
title(['ALFA=', num2str(p_alfa),...
    '   GAMMA=', num2str(p_gamma),...
    '   X0=', num2str(start_point(1)),...
    '   Y0=', num2str(start_point(2)),...
    '   Z0=', num2str(start_point(3)), ...
    '   T=[', num2str(tspan(1)), '; ', num2str(tspan(2)), ']s', ...
    '   solver=', solver])

end



