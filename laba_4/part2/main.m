clc
close all
clear all
syms w a

[sola, solw] = vpasolve([-0.33*w^2 + 90*2/pi*(asin(24/a)+(24/a)*sqrt(1-(24^2)/(a^2)))==0, ...
    -0.009*w^3+w==0], [a, w]);

ans_a = double(vpa(sola(1)))
ans_w = double(vpa(solw(1)))

figure
hold on
q = @(a) 2/pi*(asin(24/a)+24/a*sqrt(1-(24^2)/(a^2)));
fplot(q)
xlim([0 100])
ylim([-1 2])
hold off

figure
hold on
ql = @(a) -20*log10(q(a));
fplot(ql)
xline(ans_a)
plot(ans_a, ql(ans_a), '-o')
xlim([0 100])
ylim([-1 10])
hold off