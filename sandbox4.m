% ============== Paramaters ============== %
% Texture file
texture_path = 'res/dots.jpg';

% File to texture
target_path = 'res/me2.png';

% Texturing <-------------------> Blending %
alpha = .00;

% Pick slice from this many lowest samples %
num_samples = 1;

% Size of patches
patchsize = 21;

overlap = uint8(patchsize/6);
% overlap = uint8(1)

% dbstop if error;
close all;
rng(1);


[texture, map] = imread(texture_path);
[target, map] = imread(target_path);

% quilt_texture(target, texture, outsize, patchsize, overlap, tol, alpha)
outsize = size(target);
outsize = outsize(1:2);

tic
Q = quilt_texture(target, texture, outsize, [patchsize patchsize], uint8(patchsize/6), num_samples, alpha);
toc
imshow(Q,map)


