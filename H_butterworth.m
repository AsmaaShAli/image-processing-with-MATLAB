function ft2= H_butterworth(D0,N,img)
f=fft2(img);
f1=fftshift(f);
R=real(f1);
I=imag(f1);

filter=H_BWFilter(D0,N,img);

[newR,newI] = multiplication (filter,I,R);

 
ft=ifftshift(newR +i*newI);
ft2=ifft2(ft);
ft2=uint8(ft2);