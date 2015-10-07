function [out] = get_correspondence_map(input)
    out = mean(imgaussfilt(input, 5), 3, 'double');
end