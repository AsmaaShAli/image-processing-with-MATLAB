 function round = Equalization(img)

pi = zeros(1,256);           % pixel matrix
[p,q,n]=size(img);
for l=1:n
for i=1:p
    for j=1:q
        pi(1,img(i,j,l)+1) = pi(1,img(i,j,l)+1) + 1;
    end
end
end

run = zeros(1,256);         % Run.Sum matrix
run(1,1) = pi(1,1);
for k=2:256
    run(1,k) = pi(1,k) + run(1,k-1);
end
maxrun = max(run);

run = double(run);
round = zeros(1,256);               % round matrix  
round = double(round);

for a=1:256
    round(1,a) = run(1,a)/maxrun;
    round(1,a) = round(1,a)*255;          %col-1
    round(1,a) = uint8(round(1,a));     %make final round matrix
end





