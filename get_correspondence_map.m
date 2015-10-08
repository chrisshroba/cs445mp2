function [out] = get_correspondence_map(input)
    out = mean(imgaussfilt(input, 1), 3, 'double');
    out = mean(input, 3, 'double');
    
end