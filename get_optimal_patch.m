function [ out ] = get_optimal_patch(existing_part, new_patch, top, left, overlap)
    ps = size(existing_part);
    h = ps(1);
    w = ps(2);
%     mask = ones(h,w);
    left_mask = ones(h,w);
    top_mask = ones(h,w);
    
    if(left == true)
        left_part1 = existing_part(:,1:overlap);
        left_part2 = new_patch(:,1:overlap);
        
        diff = sum((left_part1-left_part2).^2,3);


        left_mask_partial = transpose(given_cut(transpose(diff)));

        left_mask=ones(h,w);
        left_mask(:,1:overlap) = left_mask_partial;
        
    end
    if(top == true)
        top_part1 = existing_part(1:overlap,:);
        top_part2 = new_patch(1:overlap,:);
        
        diff = sum((top_part1-top_part2).^2,3);


        top_mask_partial = given_cut(diff);
        top_mask = ones(h,w);
        top_mask(1:overlap,:) = top_mask_partial;
        

    end

    mask = uint8(top_mask&left_mask);
    
    out(:,:,1) = uint8(mask) .* new_patch(:,:,1) + uint8(~mask) .* existing_part(:,:,1);
    out(:,:,2) = uint8(mask) .* new_patch(:,:,2) + uint8(~mask) .* existing_part(:,:,2);
    out(:,:,3) = uint8(mask) .* new_patch(:,:,3) + uint8(~mask) .* existing_part(:,:,3);
    
end