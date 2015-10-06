close all;
% rng(1);
[A, map] = imread('res/tree.png');
size(A)
tic

Q = quilt_cut(A,[320 320], [45 45], 10, 50);


% Q = quilt_cut(A,[300 300], [51 51],2, 3);

% Q = quilt_random(A,[900 900], [101 101]);
toc
imshow(Q,map)

% quilt_simple(sample, outsize, patchsize, overlap, tol)