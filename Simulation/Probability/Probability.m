clear
clc
%%
d= 1:1:200 ;
d_BP = 27;
alpha = 71;
d0 = 1;
c  = 3*10^8;

%%
P_LOS = zeros(200,1);
for d=1:1:200
    P_LOS(d)  = (min(d_BP/d,1)*(1-exp(-d/alpha))+exp(-d/alpha))^2;
end
t = 1:1:200;
figure;
axis([0,100,1,200]);
plot(t,P_LOS*100,'r--','LineWidth',2);
lgd=legend('\fontsize {12}MMSE Fit');
lgd.FontWeight = 'bold';
xlabel('T-R Separation(m)','FontSize',12,'FontWeight','bold')
ylabel('LOS Probability(%)','FontSize',12,'FontWeight','bold')
grid on;