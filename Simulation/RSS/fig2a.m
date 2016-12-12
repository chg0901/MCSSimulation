%Picture Fig.1 (a)
clc
clear
x = floor(rand(1,5)*50);
y = floor(rand(1,5)*50);
axis([0 50 0 50])
Z = [1   2  3  4  5];
plot(x,y,'o','MarkerSize',10,'MarkerFaceColor','k'),grid
axis('square')
title('Picture Fig.2 (a)'),xlabel('(meters)'),ylabel('(meters)')

for i = 1:1:5
    text(x,y,[['  ';'  ';'  ';'  ';'  '],int2str(Z')]) ;
end
Position = [x',y'];
