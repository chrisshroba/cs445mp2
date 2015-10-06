
function [ out ] = quilt_random(sample, outsize, patchsize)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


patchwidth = patchsize(1);
patchheight = patchsize(2);

outsize_w = outsize(1);
outsize_h = outsize(2);

out = zeros(outsize_w,outsize_h,3, 'uint8');

samplesize = size(sample);



max_part = samplesize(1:2) - patchsize;

max_part_x = max_part(1);
max_part_y = max_part(2);

rng(1);

x = 1;
while x < outsize_w
    y = 1;
    while y < outsize_h
        rand_x = randi(max_part_x, 1);
        rand_y = randi(max_part_y, 1);
        
        slice = sample(rand_x:rand_x+patchwidth, rand_y:rand_y+patchheight,1:3);
        out(x:x+patchwidth, y:y+patchheight,:) = slice;
        
        y = y + patchheight;
    end
    x = x + patchwidth;
end

end
