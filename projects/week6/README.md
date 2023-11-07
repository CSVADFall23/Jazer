## Project 6 Readme

This library is intended to provide an easy way to apply an ordered dither effect as a filter over anything draw in the Processing render context. I think this effect looks really neat and was originally motivated to create an easy way to work with the effect in my own projects. I think it brings clarity to low resolution images and interest in higher resolution images.

There is only one method required to use the library. This method gets passed an integer that controls the block size of the kernel of the effect. This way people can customize the look. One could even use varying block density on different objects to create a sense of depth.

I decided to call the library DitheringLib since I may expand to include other dithering algorithms besides ordered dithering. I decided to call the class OrderedDither to distinguish it from other algorithms that may be added. 
