function [ out1 ] = func1( in1 )
    out1 = func2(in1) + 1;
end

function [out2] = func2( in2 )
    out2 = in2*2;
end