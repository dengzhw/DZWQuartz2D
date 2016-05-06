//
//  UIImage+Clip.h
//  SOQuartz2D
//
//  Created by zwdeng on 16/5/5.
//  Copyright © 2016年 zwdeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage(Clip)
+(UIImage*)imageOfCutWithImage:(UIImage*)image BorderWidth:(CGFloat)borderWidth
                   BorderColor:(UIColor*)color;
+(UIImage*)imageWithSnapView:(UIView*)view;
+(UIColor*)getColorFromImage:(CGPoint)position;
@end
