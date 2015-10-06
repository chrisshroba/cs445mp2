
function [ out ] = ssd_patch2(I, M, T)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    dI = double(I);
    dM = double(M);
    dT = double(T);
    ssd1 = imfilter(dI(:,:,1).^2, dM) -2*imfilter(dI(:,:,1), dM.*dT(:,:,1)) + sum(sum((dM.*dT(:,:,1)).^2));
    ssd2 = imfilter(dI(:,:,2).^2, dM) -2*imfilter(dI(:,:,2), dM.*dT(:,:,2)) + sum(sum((dM.*dT(:,:,2)).^2));
    ssd3 = imfilter(dI(:,:,3).^2, dM) -2*imfilter(dI(:,:,3), dM.*dT(:,:,3)) + sum(sum((dM.*dT(:,:,3)).^2));
    dout = (ssd1+ssd2+ssd3)/3;
    out = uint32(dout);
    
    
end