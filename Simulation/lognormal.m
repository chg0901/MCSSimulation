%% Compute the Lognormal Distribution pdf
%

% Copyright 2015 The MathWorks, Inc.


%%
% Suppose the income of a family of four in the United States follows a
% lognormal distribution with |mu = log(20,000)| and |sigma = 1|. Compute
% and plot the income density.
x = (10:1000:125010)';
y = lognpdf(x,log(20000),1.0);

figure;
plot(x,y)
h = gca;
h.XTick = [0 30000 60000 90000 120000];
h.XTickLabel = {'0','$30,000','$60,000',...
                    '$90,000','$120,000'};
