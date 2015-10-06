close all;
[A, map] = imread('res/crowd.jpg');

Q = quilt_random(A,[100 100], [99 99]);

imshow(Q,map)

