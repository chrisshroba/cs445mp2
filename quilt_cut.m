function [out] = quilt_cut(sample, outsize, patchsize, overlap, tol)
pw = patchsize(1);
ph = patchsize(2);

ow = outsize(1); % output width
oh = outsize(2); % output height

out = zeros(ow,oh,3, 'uint8');

samplesize = size(sample);


% 
max_part = samplesize(1:2) - patchsize;
% 
max_part_r = max_part(1);
max_part_c = max_part(2);

mask = make_mask(ph, pw, overlap, overlap);
topmask = make_topmask(ph, pw, overlap, overlap);
leftmask = make_leftmask(ph, pw, overlap, overlap);



row = 1;
while row < oh - (ph-1)
    uint8(row / ( oh - (ph-1))*100)
    toc
    col = 1;
    while col < ow - (pw-1)
        % signature: ssd_patch(source, current_image, mask, patchcenter, patchsize)
%         cost_image = ssd_patch(sample, out, mask, topleft_to_center([row col], patchsize), patchsize);
        
        % ssd_patch2(I, M, T)
        
        % populate the first patch into the output
        if ((col == 1) && (row == 1))
            while true
                'trying'
                rand_r = randi(max_part_r, 1);
                rand_c = randi(max_part_c, 1);


                slice = sample(rand_r:rand_r+ph-1, rand_c:rand_c+pw-1,:);
                if(mean(mean(mean(slice)))< 250)
                    break
                end
            end
            
            out(row:row+pw-1, col:col+ph-1,:) = slice;
            

            col = col + pw - overlap;

            continue
        end
        
        % Get the template of the current part of the image with just the 
        %  top and left part having pixels already filled (overlap)
        template = out(row:row+ph-1, col:col+pw-1);
        template3d = out(row:row+ph-1, col:col+pw-1,:);
        
        
        top = true;
        left = true;
        
        %ssd_patch2(I, M, T)
        if(row==1)
            top = false;
            cost_image = ssd_patch2(sample, topmask, template);
        elseif(col==1)
            left = false;
            cost_image = ssd_patch2(sample, leftmask, template);
        else
            cost_image = ssd_patch2(sample, mask, template);
        end
        
%         imagesc(cost_image);
        
        
        % signature: choose_sample (cost_image, num_samples)

        
%       get_optimal_patch(existing_part, new_patch, top, left, overlap)
        i=0;
        while true
            sample_coords = choose_sample(cost_image, tol, patchsize);
        
            sr = sample_coords(1);
            sc = sample_coords(2);
        
            slice = sample(sr:sr+ph-1, sc:sc+pw-1,1:3);

            
            cut_slice = get_optimal_patch(template3d, slice, top, left, overlap);
            mean(mean(mean(cut_slice)))
            if (mean(mean(mean(cut_slice))) < 254)
                break
            end
            i=i+1;
            if(i>100)
                break;
            end
            
        end
        
        
        out(row:row+pw-1, col:col+ph-1,:) = cut_slice;
        
        col = col + pw - overlap;
        
%         imagesc(out)
        
    end
    row = row + ph - overlap;
    
end


end

