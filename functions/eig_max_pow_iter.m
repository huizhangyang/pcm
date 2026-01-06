function eig_val = eig_max_pow_iter(data,N,ep)
% max eig = data*data'
%2024.4.19
if size(data,2)<size(data,1)
    data = transpose(data);
end
R = data*data';
n = size(R,2);
y = randn(n,1);
eig_val_old = 0;
for k=1:N
    y = R*y;
    eig_val = max(abs(y));
    y = y/eig_val;
    if abs(eig_val-eig_val_old)/eig_val<ep && k>=2
        break;
    end
    eig_val_old = eig_val;
end
end