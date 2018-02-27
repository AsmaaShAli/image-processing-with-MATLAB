function [new2,R,I]= Convert_to_Ferquency(img)
f=fft2(img);
f1=fftshift(f);
R=real(f1);
I=imag(f1);

mag=sqrt(R.^2+I.^2);
new=log(mag+1);

new2=norm(new);


new2=uint8(new2);
 




