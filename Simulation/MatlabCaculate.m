%%软件计算题

%%
%求二阶导数
clear
syms x y
y = log(sqrt(x+x^2)+exp(x));
dy = diff(y,2) 

%%
%求定积分
clear
syms x y
y = (1/x)*exp(x^3)
int(y,1,2)