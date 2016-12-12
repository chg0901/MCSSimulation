syms x y
f = y.*sin(x)-x.*cos(y);
fsurf(f,[-2*pi 2*pi])
a = gca;
a.TickLabelInterpreter = 'latex';
a.Box = 'on';%显示坐标背景空间
a.BoxStyle = 'full';%显示外部空间边线

%%
%转换x坐标数字转换为π
S = sym(a.XLim(1):pi/2:a.XLim(2));
S = sym(round(vpa(S/pi*2))*pi/2);
a.XTick = double(S);
a.XTickLabel = strcat('$',arrayfun(@latex, S, 'UniformOutput', false),'$');
%%
%转换x坐标数字转换为π
S = sym(a.YLim(1):pi/2:a.YLim(2));
S = sym(round(vpa(S/pi*2))*pi/2);
a.YTick = double(S);
a.YTickLabel = strcat('$',arrayfun(@latex, S, 'UniformOutput', false),'$');
%%
%绘制三个坐标线和标题为LaTeX格式
xlabel('x','Interpreter','latex');
ylabel('y','Interpreter','latex');
zlabel('z','Interpreter','latex');
title(['$' latex(f) '$ for $x$ and $y$ in $[-2\pi,2\pi]$'],'Interpreter','latex')