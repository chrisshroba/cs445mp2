close all;
[A, map] = imread('res/sand.png');

Q = quilt_random(A,[400 400], [40 40]);

imshow(Q,map)

