function data = block_func_memory_opt(data,Bsz,Npad,func)
%2025.4.6, req: Npad<Bsz
Bsz = min(Bsz,size(data));
Nb = fix(size(data)./Bsz);
[Na,Nr] = size(data);

if isscalar(Npad)
    Npad = [Npad Npad];
end

ida_o_old = [];
result_old = [];

for k=1:Nb(1)
    if k==1
        ida_i = 1:Bsz(1) + Npad(1);
        ida_p = 1:Bsz(1);
        ida_o = ida_p;
    elseif k==Nb(1)
        ida_i = (k-1)*Bsz(1)+1-Npad(1):Na;
        ida_p = 1+Npad(1):Na-(k-1)*Bsz(1)+Npad(1);
        ida_o = (k-1)*Bsz(1)+1:Na;
    else
        ida_i = (k-1)*Bsz(1)+(1-Npad(1):Bsz(1)+Npad(1));
        ida_i = ida_i(ida_i<=Na);
        ida_p = Npad(1)+(1:Bsz(1));
        ida_o = (k-1)*Bsz(1)+(1:Bsz(1));
    end
    if Nb(1)==1
        ida_i = 1:Na;
        ida_p = 1:Na;
        ida_o = 1:Na;
    end
    
    result = zeros(length(ida_o),Nr);

    for n=1:Nb(2)
        if n==1
            idr_i = 1:Bsz(2) + Npad(2);
            idr_p = 1:Bsz(2);
            idr_o = idr_p;
        elseif n==Nb(2)
            idr_i = (n-1)*Bsz(2)+1-Npad(2):Nr;
            idr_p = 1+Npad(2):Nr-(n-1)*Bsz(2)+Npad(2);
            idr_o = (n-1)*Bsz(2)+1:Nr;
        else
            idr_i = (n-1)*Bsz(2)+(1-Npad(2):Bsz(2)+Npad(2));
            idr_i = idr_i(idr_i<=Nr);
            idr_p = Npad(2)+(1:Bsz(2));
            idr_o = (n-1)*Bsz(2)+(1:Bsz(2));
        end
        if Nb(2)==1
            idr_i = 1:Nr;
            idr_p = 1:Nr;
            idr_o = 1:Nr;
        end

        tmp = func(data(ida_i,idr_i));
        result(:,idr_o) = tmp(ida_p,idr_p);

    end

    data(ida_o_old,:) = result_old;
    ida_o_old = ida_o;
    result_old = result;
end

data(ida_o_old,:) = result_old;

end

