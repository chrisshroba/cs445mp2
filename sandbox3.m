close all;
[A, map] = imread('res/fire.jpg');
tic
Q = quilt_simple(A,[300 300], [75 75],8, 4);
% Q = quilt_cut(A,[300 300], [51 51],2, 3);

% Q = quilt_random(A,[900 900], [101 101]);

imshow(Q,map)

% quilt_simple(sample, outsize, patchsize, overlap, tol)