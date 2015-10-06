function [out] = make_topmask(height, width, top_overlap, left_overlap)
    out = ones(height, width, 'uint8');
    out(:, left_overlap+1:width) = 0;
end