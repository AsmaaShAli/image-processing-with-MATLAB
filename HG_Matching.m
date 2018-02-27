function matched= HG_Matching (Image1, Image2)

[r,c]=size(Image1);
round1 = Equalization(Image1);
round2 = Equalization(Image2);

matchmat = zeros(1,256);

matchmat = matchMatrix(round1,round2);

matched = zeros(size(Image1));        % new matrix to replace colors from round matrix to original matrix
matchmat = double(matchmat);
for i=1:r
    for j=1:c
        matched(i,j) = matchmat(1,(Image1(i,j)+1));
    end
end

matched=uint8(matched);
end