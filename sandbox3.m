close all;
% rng(1);
[A, map] = imread('res/google.jpg');
size(A)
tic

Q = quilt_cut(A,[200 200], [43 43],2, 50);


% Q = quilt_cut(A,[300 300], [51 51],2, 3);

% Q = quilt_random(A,[900 900], [101 101]);

imshow(Q,map)

% quilt_simple(sample, outsize, patchsize, overlap, tol)