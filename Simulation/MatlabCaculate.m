%%���������

%%
%����׵���
clear
syms x y
y = log(sqrt(x+x^2)+exp(x));
dy = diff(y,2) 

%%
%�󶨻���
clear
syms x y
y = (1/x)*exp(x^3)
int(y,1,2)