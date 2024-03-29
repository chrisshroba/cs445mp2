close all;
rng(1);
[A, map] = imread('res/clouds.jpg');
size(A)
tic

patchsize = 31;
outputsize = 960;

Q = quilt_cut(A,[outputsize outputsize], [patchsize patchsize], uint8(patchsize/3), 3);


% Q = quilt_cut(A,[300 300], [51 51],2, 3);

% Q = quilt_random(A,[900 900], [101 101]);
toc
imshow(Q,map)

% quilt_simple(sample, outsize, patchsize, overlap, tol)