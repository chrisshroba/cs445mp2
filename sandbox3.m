close all;
rng(1);
[A, map] = imread('res/foliage.jpg');
size(A)
tic

patchsize = 31;

Q = quilt_cut(A,[240 240], [patchsize patchsize], uint8(patchsize/6), 5);


% Q = quilt_cut(A,[300 300], [51 51],2, 3);

% Q = quilt_random(A,[900 900], [101 101]);
toc
imshow(Q,map)

% quilt_simple(sample, outsize, patchsize, overlap, tol)