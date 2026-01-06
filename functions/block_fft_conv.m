function data = block_fft_conv(data,ref1,ref2)
%hzyang 2025.3.30
Lref1 = length(ref1);
Lref2 = length(ref2);
[Ldata1, Ldata2] = size(data);
sz = size(data) + [Lref1 Lref2];
ref1 = conj(fft(ref1,sz(1)));
ref2 = conj(fft(ref2,sz(2)));
data = fft(data,sz(1),1);
data = ifft(data.*ref1,sz(1),1);
data = fft(data,sz(2),2);
data = ifft(data.*ref2,sz(2),2);
data = circshift(data,[fix(Lref1/2) fix(Lref2/2)]);
data = data((1:Ldata1),(1:Ldata2));
end