 clear
 clc

d= 1:1:200 ;

d_BP = 27;
alpha = 71;
d0 = 1;
c  = 3*10^8;

f = 73.5*10^9;
n_LOS = 2.0;
Sigma_LOS = 4.8;
n_NLOS = 3.4;
Sigma_NLOS = 7.9;
alpha2 = 80.6;
Beta = 2.9;
Sigma2_NLOS = 7.8;


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


figure;
t = 1:1:50;%in fact it should be 30
s1 = semilogx(t,PL_LOS(1:50),'b-','LineWidth',2);grid on;hold on;
% plot(t,PL_LOS,'r-');

% semilogx(t,PL_NLOS);
% plot(t,PL_NLOS,'r-','LineWidth',1);  hold on;grid on;

t = 31:1:200; %in the paper it begin at 51
% semilogx(t,PL_NLOS_Floating);
p1 = plot(t,PL_NLOS_Floating(31:200),'r-','LineWidth',2);  hold on;grid on;

t = 1:1:200;
% semilogx(t, PL_NLOS_CloseIn);
p2 = plot(t, PL_NLOS_CloseIn,'r--','LineWidth',2);  hold on;grid on;

% semilogx(t,PL_Prob_CloseIn);
p3 = plot(t,PL_Prob_Floating,'k-','LineWidth',2);  hold on;grid on;

% semilogx(t,PL_Prob_Floating);
p4 = plot(t,PL_Prob_CloseIn,'k--','LineWidth',2);  hold on;grid on;



% semilogx(t,PL_Prob);
% plot(t,PL_Prob,'g-','LineWidth',2);  hold on;grid on;

axis([1,210,55,150]);
xlabel('T-R Separation(m)','FontSize',12,'FontWeight','bold')
ylabel('Total Path Loss (dB)','FontSize',12,'FontWeight','bold')
title('73GHz Omnidirectional Path Loss Models','FontSize',12,'FontWeight','bold')

% legend([PL_LOS,PL_NLOS_CloseIn,PL_NLOS_Floating,PL_Prob_CloseIn,PL_Prob_Floating],'n_LOS=2.1 sigma_LOS=3.6dB','1','1','1','1');

lgd = legend([s1,p1,p2,p3,p4],....
    'n_L_O_S=2.0 \sigma_L_O_S=4.8dB', '(\alpha _N_L_O_S,\beta_N_L_O_S)=(80.6dB,2.9) \sigma_N_L_O_S=7.8dB'...
,'n_N_L_O_S=3.4 \sigma_N_L_O_S=7.9dB','Probabilistic Path Loss (Floating)','Probabilistic Path Loss (Close-In)','Location','best');
lgd.FontWeight = 'bold';
% legend([s1,'n_L_O_S=2.1 \sigma_L_O_S=3.6dB'],....
%     [p1,'(\alpha_N_L_O_S,\beta_N_L_O_S)=(80.6dB,2.9)  \sigma_N_L_O_S=7.8dB'],...
%     [p2,'n__NL_O_S=3.4 \sigma_N_L_O_S=7.9dB'],...
%     [p3,'Probabilistic Path Loss (Floating)'],...
%     [p4,'Probabilistic Path Loss (Close-In)'],...
%     'Location','best');
grid on;



