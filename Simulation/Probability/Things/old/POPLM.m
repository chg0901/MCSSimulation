d=[1:1:200];
axis([1,200,55,150]);

d_BP = 27;
alpha = 71;
d0 = 1;
c  = 3*10^8;

f = [28*10^9,73.5*10^9];
n_LOS = [2.1,2.0];
Sigma_LOS = [3.6,4.8];
n_NLOS = [3.4,3.4];
Sigma_NLOS = [9.7,7.9];
alpha2 = [79.2,80.6];
Beta = [2.6,2.9];
Sigma2_NLOS = [9.6,7.8];
for t = 1:1:2
    
    Lambda  =c/f(t);
    P_LOS = zeros(200,1);
    PL_LOS = zeros(200,1);
    PL_NLOS = zeros(200,1);
    PL_Prob = zeros(200,1);
    
    
    for d=1:1:200
        P_LOS(d)  = (min(d_BP/d,1)*(1-exp(-d/alpha))+exp(-d/alpha))^2;
        
        PL_LOS(d)  = 20*log10(4*pi/ Lambda)+10*n_LOS(t)*log10(d)+lognpdf(Sigma_LOS(t));
        
        if d<= 30
            PL_NLOS_CloseIn = 20*log10(4*pi/ Lambda)+10*n_NLOS(t)*log10(d)+lognpdf(Sigma_NLOS(t));
            PL_NLOS(d)  = PL_NLOS_CloseIn;
        else
            PL_NLOS_Floating  = alpha2(t) +10* Beta(t) *log10(d)+lognpdf(Sigma2_NLOS(t));
            PL_NLOS(d)  = PL_NLOS_Floating;
        end
        PL_Prob(d)  = P_LOS(d)*PL_LOS(d)+(1-P_LOS(d))*PL_NLOS(d);
        
        %     subplot(2,2,1);
        plot(d,P_LOS);grid on; hold on
        %     subplot(2,2,2);
        semilogx(d,PL_LOS);plot(d,PL_LOS);grid on;  hold on
        %     subplot(2,2,3);
        semilogx(d,PL_NLOS);plot(d,PL_NLOS);grid on;   hold on
        %subplot(2,2,4);
        semilogx(d,PL_Prob);plot(d,PL_Prob);grid on;  hold on
    end
    
    
end


