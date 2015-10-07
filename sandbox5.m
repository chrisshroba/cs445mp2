[A,map] = imread('res/apple.png');
B = get_correspondence_map(A);
imshow(B,map);