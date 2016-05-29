img_rgb = imread('IAMGE PATH\IMAGE_NAME.jpg');     %  Read Image 
subplot (3,3,1);
imshow(img_rgb);                                        % command to show image 
title('RGB Image')                                      % put title to image 
img_gray = rgb2gray(img_rgb);                           % command to convert image to Grey
subplot(3,3,2);
imshow(img_gray);
title('Gray image');
I2 = edge(img_gray,'sobel');
subplot(3,3,3);
imshow(I2);
title('sharpsobel');
% applying Frequency Filtering to image %
 [M N] = size(img_gray);                                     % Loop for Mask
for i = 1 : M;
    for j = 1 : N;
        D = sqrt ((i-M/2)^2+(j-N/2)^2);
        if D>75 && D<300
            I2(i,j) = 255;
        else
            I2(i,j) = 0;
        end
    end
end
subplot(3,3,4);
imshow(I2);
title('Mask');
I3 = fft2(img_gray);                                               % applying Fourier Transform Image 
subplot(3,3,5);
imshow(I3);
title('Fourier Transform Image');
I4 = fftshift(I3);                                             % Shifted Fourier Transform
subplot(3,3,6);
imshow(I4);
title('Shifted Fourier Transform');
I5 = I4.*I2;                                 % Filtered Fourier Image
subplot(3,3,7);
imshow(I5);
title('Filtered Fourier image');        % Filtered Image
I6 = real(ifft2(ifftshift(I2)));
subplot(3,3,8);
imshow(I6);
title('Filtered image');