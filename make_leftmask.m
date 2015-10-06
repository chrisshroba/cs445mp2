function [out] = make_leftmask(height, width, top_overlap, left_overlap)
    out = ones(height, width, 'uint8');
    out(top_overlap+1:height, :) = 0;
end