% Finished
% Method1
lgd = legend([s1,p1,p2,p3,p4],...
    'n_L_O_S=2.1 \sigma_L_O_S=3.6dB',...
    ['(\alpha _N_L_O_S,\beta_N_L_O_S)=(79.2dB,2.6)', sprintf('\n'),' \sigma_N_L_O_S=9.6dB']...
    ,'n_N_L_O_S=3.4 \sigma_N_L_O_S=9.7dB'...
    ,'Probabilistic Path Loss (Floating)'...
    ,'Probabilistic Path Loss (Close-In)');
lgd.FontWeight = 'bold';
lgd.Location = 'best';

% Method2
line_handles = [s1,p1,p2,p3,p4];

t1 = 'n_L_O_S=2.1 \sigma_L_O_S=3.6dB';
t2 = ['(\alpha _N_L_O_S,\beta_N_L_O_S)=(79.2dB,2.6) ', sprintf('\n'),...
    '\sigma_N_L_O_S=9.6dB'];
t3 = ['n_N_L_O_S=3.4 \sigma_N_L_O_S=9.7dB'];
t4 = ['Probabilistic Path Loss (Floating)' ];
t5 = ['Probabilistic Path Loss (Close-In)' ];

legend_texts = {t1, t2, t3, t4,t5};
h_leg = legend(line_handles, legend_texts);

h_leg.FontSize = 22.5;
h_leg.Location = 'bestoutside';

% Example1

a=linspace(0,2*pi,100);
y1=100*sin(a);
y2=50*cos(a);
y3=tan(a);
y4=log(a);
y=[y1;y2;y3;y4];
figure
p=plot(a,y)

legend(p(1:2),'sin','cos');
ah=axes('position',get(gca,'position'),'visible','off');
legend(ah,p(3:4),'tan','log','location','west');

% example2
legend([s1,p1,p2,p3,p4],....
    'n_L_O_S=2.1 \sigma_L_O_S=3.6dB',...
    '(\alpha_N_L_O_S,\beta_N_L_O_S)=(80.6dB,2.9)'...
,'1','1','1','Location','best');

% example3
%使用换行时要注意加中括号使之对应成为一个整体
x=0.1:0.1:5; plot(x,sin(x),'-',x,cos(x),':'); 
legend(['Model 1:',sprintf('\n'),'sin(x)'],['Model 2:',sprintf('\n'),'cos(x)']);

% example4
%使用Latex
leg = legend({'$\mathcal{ABCDEFGHIJKLMNOPQRSTUVWXYZ}(1)$'}, 'Interpreter', 'latex');
leg = legend([leg.String '$\mathcal{O}(2^n)$'],'Interpreter','latex');


%legend有时候挺烦人的，尽管大多时候挺好用。
%基本数据：
data = rand(25)+repmat(1:25,25,1);
H = plot(data);
%基本用法：
legend({'str1','str2','strn'});



%高级用法1：指定legend显示的位置：
legend({'str1','str2','strn'},1);
legend({'str1','str2','strn'},2);
legend({'str1','str2','strn'},'Location','SouthEast');
%可选的位置很多：
% North：Inside plot box near top
% South：Inside bottom
% EastI：nside right
% West：Inside left
% NorthEast：Inside top right (default)
% NorthWest：Inside top left
% SouthEast：Inside bottom right
% SouthWest：Inside bottom left
% NorthOutside：Outside plot box near top
% SouthOutside：Outside bottom
% EastOutside：Outsideright
% WestOutside：Outside left
% NorthEastOutside：Outside top right
% NorthWestOutside：Outside top left
% SouthEastOutside：Outside bottom right
% SouthWestOutside：Outside bottom left
% Best：Least conflict with data in plot
% BestOutside：Least unused space outside plot
% 通常，用'Best‘比较不错



% 高级用法2：指定显示某几条曲线的legend：
% 方法1：复杂到吐血
% 例如你有25条曲线，想显示其中1，6，11，16，21的legend，则
for i = [2:5 7:10 12:15 17:20 22:25]
set(get(get(H(i),'Annotation'),'LegendInformation'),'IconDisplayStyle','off'); 
end
legend('1','6','11','16','21');
% 方法2：简单到郁闷
H = plot(data);
legend(H([1 6 11 16 21],'1,'6','11’,'16','21');


% 高级用法3：legend横排
hl = legend(H([1 6 11 16 21],'1,'6','11’,'16','21');
set(hl,'Orientation','horizon')
% 高级用法4：不显示方框：
hl = legend(H([1 6 11 16 21],'1,'6','11’,'16','21');
set(hl,'Box','off');

