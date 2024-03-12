syms s

Kpa = 1800;
Kia = 13000;
a = 13.5;
b = 0.002945;
g = 9.81;
l = 0.41994844287198841974773330815194;

tf_inner = 1/(1-(Kpa+Kia/s)*a*b/(s+a)*s/(g-(l*s^2)));

Kpv = 0.04;
Kiv = 0.15;

outer_forward = (Kpv + Kiv/s) * tf_inner * 1/(s^2);
tf_outer = outer_forward / (1 + outer_forward);

[~,den] = numden(tf_outer);

poles = solve(den, s);

for pole = poles
    double(pole)
end