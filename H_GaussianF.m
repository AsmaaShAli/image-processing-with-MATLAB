function [filter]=H_GaussianF(D0,img)
[m,n,k] = size(img);


    for i=1:m
        for j=1:n
           d= sqrt(( (i-(m/2) )^2) +((j-(n/2))^2) );
            filter(i,j)= 1 -  (exp(-(d^2/(2*D0*D0))));
        end
    end
end
