[X,Y] = meshgrid(0:.5:10);
Z = X .* exp(-X.^2 - Y.^2);
surf(X,Y,Z)