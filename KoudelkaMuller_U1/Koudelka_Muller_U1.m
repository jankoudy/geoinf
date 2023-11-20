clc; clear;
format long g

image = "IMG_1.png";        % Path to the compressed image
compression_factor = 70;    % Value of q
transformation = 'dct';     % Transformation method ('dct' = discrete cosine transformation, 'dft' = discrete furierova transformation)
                            % If the parameter of transformation is not set to the function, then it is automatically set to DCT.
resampl = '1x1';            % Size of averaged pixels ('2x1', '1x2', '2x2', '4x4')
                            % If the parameter of resampling is not set to the function, then resampling is not.
zig = false();              % Order to ZIK-ZAG sequence ('True, False)
                            % If the parameter is not set to the function, then ordering is not.
huf = false();              % Use of Huffman coding ('True, False)
                            % If the parameter is not set to the function, then Huffman coding is not.

picture_transformed = jpg_compression(image, compression_factor, transformation, resampl, zig, huf);    
% The original image and the image after compression are displayed and the root mean square deviation
% values ​​for each color are displayed.







