%Picture Fig.2 (a)
clc
clear
x = [0, 0, 25, 50, 50];
y = [0, 50, 25, 0, 50];
Z = [1   2  3  4  5];
plot(x,y,'o','MarkerSize',10,'MarkerFaceColor','k'),grid
%axis('square')
axis square
title('Picture Fig.1 (a)'),xlabel('(meters)'),ylabel('(meters)')

for i = 1:1:5
    text(x,y,[['  ';'  ';'  ';'  ';'  '],int2str(Z')]) ;
    %concatenate character arrays with square brackets, 
    %just as you concatenate numeric arrays.
    %convert numeric values to characters, 
    %use functions, such as num2str or int2str.
end

Position = [x',y'];