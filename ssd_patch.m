
function [ out ] = ssd_patch(source, dcurrent_image, mask, dpatchcenter, dpatchsize)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

ssd = imfilter(I.^2, M) -2*imfilter(I, M.*T) + sum(sum((M.*T).^2))

current_image = uint8(dcurrent_image);
patchcenter = uint8(dpatchcenter);
patchsize = uint8(dpatchsize);

topleft = center_to_topleft(patchcenter, patchsize);

toprow = topleft(1);
leftcol= topleft(2);

pw = patchsize(1);
ph = patchsize(2);

patch_to_match = current_image(toprow:toprow+ph-1, leftcol:leftcol+pw-1);

sourcesize = size(source);

sourcewidth = sourcesize(1);
sourceheight = sourcesize(2);

out = zeros(sourcesize, 'uint8');

for r = 1+(ph-1)/2:sourceheight-((ph-1)/2)
    for c = 1+(pw-1)/2:sourcewidth-((pw-1)/2)
        curcenter = [r c];
        curtopleft = center_to_topleft(curcenter, patchsize);
        
        tl_r = curtopleft(1);
        tl_c = curtopleft(2);
        
        curpatch = source(tl_r:tl_r+ph-1, tl_c:tl_c+pw-1);
        
        
        
        diff = curpatch - patch_to_match;

        ssd = sum(sum(diff .* diff .* mask));
        
        out(tl_r,tl_c) = ssd;
    end
end




end

