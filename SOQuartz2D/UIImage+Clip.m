//
//  UIImage+Clip.m
//  SOQuartz2D
//
//  Created by zwdeng on 16/5/5.
//  Copyright © 2016年 zwdeng. All rights reserved.
//

#import "UIImage+Clip.h"

@implementation UIImage(Clip)
+(UIImage*)imageOfCutWithImage:(UIImage*)image BorderWidth:(CGFloat)borderWidth
                   BorderColor:(UIColor*)color{
    CGFloat imageWH = image.size.width;
    CGFloat circleWH = imageWH+2*borderWidth;
    //设置上下文的开始区域
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(circleWH, circleWH), NO, 0);
    //设置绘制路径.在正方开里画椭圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, circleWH, circleWH)];
    [color set];
    [path fill];
    //设置绘制路径.在正方开里画椭圆
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderWidth, borderWidth, imageWH, imageWH)];
    [clipPath addClip];
    //从position画UIImage
    [image drawAtPoint:CGPointMake(borderWidth, borderWidth)];
    //从绘画上下文获取UIImage
    UIImage *currentImage =UIGraphicsGetImageFromCurrentImageContext();
    //结束上下文.
    UIGraphicsEndImageContext();
    return currentImage;
}
+(UIImage*)imageWithSnapView:(UIView*)view{
    //创建位图上下文
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0);
    //获取位图上下文
    CGContextRef ref = UIGraphicsGetCurrentContext();
    //将layer渲染到上下文
    [view.layer renderInContext:ref];
    //从位图上下文中取出上图片
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    //关闭位图上下文
    UIGraphicsEndImageContext();
    return image;
}
+(UIColor*)getColorFromImage:(CGPoint)position{
    UIImage * image  = (UIImage*)self;
    CFDataRef pixedata = CGDataProviderCopyData(CGImageGetDataProvider(image.CGImage));
    const UInt8 *data = CFDataGetBytePtr(pixedata);
    NSUInteger pixeInfo = image.size.width*position.y+position.x*4;
    CGFloat red = data[pixeInfo]/255;
    CGFloat green = data[pixeInfo+1]/255;
    CGFloat blue = data[pixeInfo+2]/255;
    CGFloat alpha = data[pixeInfo+3]/255;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    return color;
}

@end

