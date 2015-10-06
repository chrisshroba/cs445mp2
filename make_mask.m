function [out] = make_mask(height, width, top_overlap, left_overlap)
    out = ones(height, width, 'uint8');
    out(top_overlap+1:height, left_overlap+1:width) = 0;
end