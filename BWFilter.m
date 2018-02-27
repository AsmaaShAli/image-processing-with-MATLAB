function [filter]=BWFilter(D0,N,img)%N=filter order 
[m,n,k] = size(img);


    for i=1:m
        for j=1:n
           d= sqrt(( (i-(m/2) )^2) +((j-(n/2))^2) ); %D(u,v)
           %filter=H(u,v)
            filter(i,j)= 1/(1+(d/D0)^(2*N)); 
            
        end
    end
end
