function [ out ] = choose_sample (cost_image, num_samples, patchsize)
    exit = false;
    tol = 1;
    
    ph = patchsize(1);
    pw = patchsize(2);
    
    tl_r = (ph + 1) / 2;
    tl_c = (pw + 1) / 2;
    
    im_size = size(cost_image);
    
    im_h = im_size(1);
    im_w = im_size(2);
    
    br_r = im_h - (ph-1)/2;
    br_c = im_w - (pw-1)/2;
    adj_cost_img = cost_image(tl_r:br_r, tl_c:br_c);
%     min_cost = min(min(adj_cost_image));
%     max_threshold = 1.1*min_cost;
    while ~exit
        [rows,cols] = find(adj_cost_img < tol, num_samples);
        if numel(rows) >= num_samples
           exit = true;
        end
        tol = tol*1.15;
    end
    r = randi(num_samples);

    row = rows(r);
    col = cols(r);

%     [row col] = find(adj_cost_img < tol, 1);
    out = [row col];
end