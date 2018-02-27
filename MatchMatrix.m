function match = MatchMatrix(round1,round2)


[p1,q1]=size(round1);

[p2,q2]=size(round2);

for i=1:q1
    for j=1:q2
        if(round2(1,j) == round1(1,i)||round2(1,j) == (round1(1,i)-1)||round2(1,j) == (round1(1,i)+1))
            match(1,i) = j-1;
            break;
        end
    end
end
