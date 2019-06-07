# Image Blur #2: Perform an Image Transformation

In this assignment we will perform a transformation on the image data.

Given a black and white image, represented as the class you already implemented, implement a blur method to run a transformation on the image. Running the blur transformation causes any 1 in the image to cause the pixel to the left, right, above and below to become a 1.

The only things you'll want your image to reflect are the values of 0's and 1's. Orange 1's represent pixels that were 1's before the transformation, and pink indicates pixels that changed color due to the transformation. The only thing you'll want your representation to keep track of is the value of the element, a 0 or a 1; the color is only designed to help illustrate the problem:

![image_blur_2_examples.png](/images/image_blur_2_examples.png)

This problem is a bit tricky, but if you have a solid foundation on how to manipulate arrays and have completed the challenge assignments above, you have the skills you need to solve it.
