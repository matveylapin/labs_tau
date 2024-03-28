function [value, isterminal, direction] = outOfBounds(t, z, xmax, xmin, ymax, ymin) 
value = (z(1,1) > xmax) || (z(1,1) < xmin) || (z(2,1) > ymax) || (z(2,1) < ymin);
isterminal = 1;
direction = 0;
end