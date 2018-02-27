function [new]=MSR(img,N)

[p,q,n]=size(img);
 
w=1/N;
seg=5;
new=size(img);
new=zeros(new);
for m=1:N
     seg=seg*N;
     ssr=SSR(img,seg);
     for l=1:n
        for i=1:p
            for j=1:q      
             new(i,j,l)=new(i,j,l)+w * ssr(i,j,l);
             end
         end
      end
  end


                
