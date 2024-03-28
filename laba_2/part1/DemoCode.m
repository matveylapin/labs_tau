clc;
clear all;
close all;

XMAX = 5;
XMIN = -5;
YMAX = 5;
YMIN = -5;
STEP = 0.3;
TMAX = 10;

[x1, x2] = meshgrid(XMIN:STEP:XMAX, YMIN:STEP:YMAX);

event_out_of_bounds = @(t, z) outOfBounds(t, z, XMAX+0.01, XMIN-0.01, YMAX+0.01, YMIN-0.01);
    
figure('Name','variantGrad','NumberTitle','off')
plotLocus(x1, x2, @variantGrad, event_out_of_bounds, TMAX);
plotQuiver(x1, x2, @variantGrad);

figure('Name','aTaskGrad','NumberTitle','off')
plotLocus(x1, x2, @aTaskGrad, event_out_of_bounds, TMAX);
plotQuiver(x1, x2, @aTaskGrad);

figure('Name','bTaskGrad','NumberTitle','off')
plotLocus(x1, x2, @bTaskGrad, event_out_of_bounds, TMAX);
plotQuiver(x1, x2, @bTaskGrad);

function dxdt = variantGrad(t, x)
dxdt(1, :) = x(2, :);
dxdt(2, :) = - 0.5 * (x(2, :) .^ 3) - 2 * x(1, :) - x(1, :) .^ 2;
end

function dxdt = aTaskGrad(t, x)
dxdt(1, :) = x(2, :);
dxdt(2, :) = sin(x(1, :)) .* x(2, :) + log(1 + x(1, :) .^ 2);
end

function dxdt = bTaskGrad(t, x)
dxdt(1, :) = x(2, :);
dxdt(2, :) = (x(2, :) .^ 4 ) .* x(1, :) + x(2, :);
end


