syms x y
f = y.*sin(x)-x.*cos(y);
fsurf(f,[-2*pi 2*pi])
a = gca;
a.TickLabelInterpreter = 'latex';
a.Box = 'on';%��ʾ���걳���ռ�
a.BoxStyle = 'full';%��ʾ�ⲿ�ռ����

%%
%ת��x��������ת��Ϊ��
S = sym(a.XLim(1):pi/2:a.XLim(2));
S = sym(round(vpa(S/pi*2))*pi/2);
a.XTick = double(S);
a.XTickLabel = strcat('$',arrayfun(@latex, S, 'UniformOutput', false),'$');
%%
%ת��x��������ת��Ϊ��
S = sym(a.YLim(1):pi/2:a.YLim(2));
S = sym(round(vpa(S/pi*2))*pi/2);
a.YTick = double(S);
a.YTickLabel = strcat('$',arrayfun(@latex, S, 'UniformOutput', false),'$');
%%
%�������������ߺͱ���ΪLaTeX��ʽ
xlabel('x','Interpreter','latex');
ylabel('y','Interpreter','latex');
zlabel('z','Interpreter','latex');
title(['$' latex(f) '$ for $x$ and $y$ in $[-2\pi,2\pi]$'],'Interpreter','latex')