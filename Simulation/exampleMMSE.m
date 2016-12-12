clear 
clc
% dimensions
m = 6;
n = 4;

mean_x = [2 ; -1; 0.5; -3]; % mean of x
mean_v = zeros(m,1); % mean of v
var_x = [2 5 1 2]; % variances of x_i's
var_v = [2 1 2 3 2 1]; % variances of v_i's . v is noise(y = Ax+v)

% constructing the covariance matrix of x
corr_x = zeros(n); %PS:correlation coefficients not given are zero and correlation  metrixs is n*n
corr_x(1,2) = -0.1; corr_x(1,3) = 0.025; corr_x(2,3) = -0.01;

%why?
corr_x = corr_x + corr_x' + eye(n);%PS:eye(n) returns an n-by-n identity matrix with ones on the main diagonal and zeros elsewhere.

%why?
sigma_x = diag(sqrt(var_x))*corr_x*diag(sqrt(var_x));%PS:Use diag to create a matrix with the elements of v on the main diagonal.

% constructing the covariance matrix of v
corr_v = zeros(m);%PS:noise
corr_v(1,3) = -0.25; corr_v(2,4) = 0.5; corr_v(3,5) = 0.3;
corr_v(4,6) = -0.04;
corr_v = corr_v + corr_v' + eye(m);
sigma_v = diag(sqrt(var_v))*corr_v*diag(sqrt(var_v));
A = [ 2 3 -1 4; ...
1 0 0 -2; ...
2 1 1 0; ...
-3 -1 0 0; ...
1 0 0 -1; ...
0 -1 1 0];
% Pseudo-inverse estimator
B_pinv = pinv(A);%returns the Moore-Penrose pseudoinverse of A·µ»ØAµÄÎ±Äæ¾ØÕó

sigma_pinv_err = B_pinv*sigma_v*B_pinv';
pinv_mse = trace(sigma_pinv_err)
% MMSE estimator
B_mmse = sigma_x*A'*inv(A*sigma_x*A' + sigma_v);
mean_y = A*mean_x + mean_v;
sigma_mmse_err = sigma_x - sigma_x*A'*inv(A*sigma_x*A' + sigma_v)*A*sigma_x;
mmse = trace(sigma_mmse_err)
% generate N instances
N = 1000;
alpha = chi2inv(.9,n);
cnt = 0; % to count the number of error vectors inside the
% the 90% confidence ellipsoid
for i = 1:N
x = sqrtm(sigma_x)*randn(n,1) + mean_x;
v = sqrtm(sigma_v)*randn(m,1) + mean_v;
y = A*x +v;
x_pinv = B_pinv*y;
sq_err_pinv(i) = norm(x-x_pinv)^2;
x_mmse = mean_x + B_mmse*(y - A*mean_x - mean_v);
sq_err_mmse(i) = norm(x-x_mmse)^2;
if (x-x_mmse)'*inv(sigma_mmse_err)*(x-x_mmse) <= alpha
cnt = cnt + 1;
end
end
mean_sq_error_pinv = mean(sq_err_pinv)
mean_sq_error_mmse = mean(sq_err_mmse)
cnt
figure;
hist(sq_err_pinv,50)
title('title1')
axis([0 60 0 250]);
print -deps mmse_example_pinv_dist
figure;
hist(sq_err_mmse,50)
title('title2')
axis([0 60 0 250]);
print -deps mmse_example_mmse_dist