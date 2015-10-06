I = imread('res/me.png');

% ssd = ssd_patch();

cur = zeros(300, 300, 'uint8');

for r = 1:300
    for c = 1:300
        if ( r<200 && c < 150 ) || ( c < 100 )
            cur(r,c) = 255;
        end
    end
end
patchsize = [51 51];
topleft = [180 80];
patchcenter = topleft_to_center(topleft, patchsize);


% patch = 
imshow(cur);