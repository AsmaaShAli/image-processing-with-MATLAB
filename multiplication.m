function [newR,newI] = multiplication (filter,I,R)
[p,q,n]=size(R);

for l=1:n
    for i=1:p
        for j=1:q
            newR(i,j,l)=filter(i,j)*R(i,j,l);
            newI(i,j,l)=filter(i,j)*I(i,j,l);
        end
    end
end

end