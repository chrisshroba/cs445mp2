square = imread('res/square.png');
circle = imread('res/circle.png');

diff = sum((square-circle).^2,3);


gc = transpose(given_cut(transpose(diff)));

combined(:,:,1) = uint8(gc) .* square(:,:,1) + uint8(~gc) .* circle(:,:,1);
combined(:,:,2) = uint8(gc) .* square(:,:,2) + uint8(~gc) .* circle(:,:,2);
combined(:,:,3) = uint8(gc) .* square(:,:,3) + uint8(~gc) .* circle(:,:,3);

imshow(combined);