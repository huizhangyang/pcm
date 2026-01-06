function h = plot_sar(I,alpha,ref)
%   Huizhang Yang, 2021.6.16
%   hzyang@njust.edu.cn
[n,m]=size(I);
Npmax = 4000;
if n>Npmax
    d = ceil(n/Npmax);
    I = I(1:d:end,:);
end
if m>Npmax
    d = ceil(m/Npmax);
    I = I(:,1:d:end);
end

    I = abs(I);

if nargin==2 % 
    th = prctile(I(1:fix(length(I(:))/10000):end),alpha);% alpha*mean(I(1:1000:end));
else
    if sum(imag(ref(1:fix(length(ref(:))/10000):end)))~=0
        ref = abs(ref);
    end
    th = prctile(ref(:),alpha);
end
h = imagesc(I);colormap gray;clim([0 th]);
end