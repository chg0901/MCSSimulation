d= 1:1:200 ;

d_BP = 27;
alpha = 71;
d0 = 1;
c  = 3*10^8;

f = 28*10^9;
n_LOS = 2.1;
Sigma_LOS = 3.6;
n_NLOS = 3.4;
Sigma_NLOS = 9.7;
alpha2 = 79.2;
Beta = 2.6;
Sigma2_NLOS = 9.6;


Lambda  =c/f ;
P_LOS = zeros(200,1);
PL_LOS = zeros(200,1);
PL_NLOS = zeros(200,1);
PL_Prob = zeros(200,1);

PL_NLOS_CloseIn = zeros(200,1);
PL_NLOS_Floating = zeros(200,1);


for d=1:1:200
    P_LOS(d)  = (min(d_BP/d,1)*(1-exp(-d/alpha))+exp(-d/alpha))^2;
    
    PL_LOS(d)  = 20*log10(4*pi/ Lambda)+10*n_LOS *log10(d)+lognpdf(d,0,Sigma_LOS );
    
    PL_NLOS_CloseIn(d) = 20*log10(4*pi/ Lambda)+10*n_NLOS *log10(d)+lognpdf(d,0,Sigma_NLOS );
       PL_NLOS_Floating(d)  = alpha2  +10* Beta  *log10(d)+lognpdf(d,0,Sigma2_NLOS );
        
    if d<= 30
         PL_NLOS(d)  = PL_NLOS_CloseIn(d);
    else
        PL_NLOS(d)  = PL_NLOS_Floating(d);
    end
    PL_Prob(d)  = P_LOS(d)*PL_LOS(d)+(1-P_LOS(d))*PL_NLOS(d);
    PL_Prob_CloseIn(d)  = P_LOS(d)*PL_LOS(d)+(1-P_LOS(d))*PL_NLOS_CloseIn(d);
    PL_Prob_Floating(d)  = P_LOS(d)*PL_LOS(d)+(1-P_LOS(d))*PL_NLOS_Floating(d);
    
end

t = 1:1:200;
axis([0,100,1,200]);
plot(t,P_LOS*100,'r--','LineWidth',2);
legend('MMSE Fit');
xlabel('T-R Separation(m)','FontSize',12,'FontWeight','bold')
ylabel('LOS Probability(%)','FontSize',12,'FontWeight','bold')
grid on;

figure;
axis([1,200,55,150]);


semilogx(t,PL_LOS,'b-','LineWidth',2.5);grid on;hold on;
% plot(t,PL_LOS,'r-');

semilogx(t,PL_NLOS);
plot(t,PL_NLOS,'r-','LineWidth',1);  hold on;grid on;

semilogx(t, PL_NLOS_CloseIn);
plot(t, PL_NLOS_CloseIn,'go','LineWidth',1);  hold on;grid on;

semilogx(t,PL_NLOS_Floating);
plot(t,PL_NLOS_Floating,'bo-','LineWidth',1);  hold on;grid on;

semilogx(t,PL_Prob_CloseIn);
plot(t,PL_Prob_CloseIn,'m^','LineWidth',1.5);  hold on;grid on;

semilogx(t,PL_Prob_Floating);
plot(t,PL_Prob_Floating,'k^','LineWidth',0.7);  hold on;grid on;



semilogx(t,PL_Prob);
plot(t,PL_Prob,'g-','LineWidth',2);  hold on;grid on;

axis([1,210,55,150]);
xlabel('T-R Separation(m)','FontSize',12,'FontWeight','bold')
ylabel('Total Path Loss (dB)','FontSize',12,'FontWeight','bold')
title('28GHz Omnidirectional Path Loss Models','FontSize',12,'FontWeight','bold')
legend([PL_LOS,PL_NLOS,PL_Prob_CloseIn,PL_Prob_Floating,PL_Prob],'n_LOS=2.1','','','','');
grid on;



