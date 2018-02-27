function [new2]=SSR(Oimage,sag)

mask=Weighted_Gaussian(sag);
Gimage=linear_filter(Oimage,mask);
Gimage=double(Gimage);
Oimage=double(Oimage);
[p,q,n]=size(Oimage);

for l=1:n
   for i=1:p
       for j=1:q
           value=Oimage(i,j,l)/Gimage(i,j,l);
           new(i,j,l)=log(value+1);
       end
   end
end
new2=norm(new);



