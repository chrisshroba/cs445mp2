[A,map] = imread('res/granite.jpg');
B = get_correspondence_map(A);
imshow(B,map);