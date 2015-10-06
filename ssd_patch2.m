
function [ out ] = ssd_patch2(I, M, T)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    dI = double(I);
    dM = double(M);
    dT = double(T);
    ssd = imfilter(dI.^2, dM) -2*imfilter(dI, dM.*dT) + sum(sum((dM.*dT).^2));
    dout = mean(ssd,3,'double');
    out = uint32(dout);
    
    
end