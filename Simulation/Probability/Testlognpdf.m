
Sigma2_NLOS = 7.8;
d = 1:1:200;
p = zeros(200:1);
p(d) = lognpdf(d,0,Sigma2_NLOS );
t = 1:1:200;
plot(t,p(t));
