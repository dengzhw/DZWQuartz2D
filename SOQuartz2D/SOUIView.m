//
//  SOUIView.m
//  SOQuartz2D
//
//  Created by zwdeng on 16/5/5.
//  Copyright © 2016年 zwdeng. All rights reserved.
//

#import "SOUIView.h"

@implementation SOUIView

-(void)drawRect:(CGRect)rect{
//    [self drawRect];
    [self drawShap];
//    [self cutScreen];
    
    
}
-(void)drawShap{
    CGContextRef context = UIGraphicsGetCurrentContext();
    //画实心圆
    CGContextAddEllipseInRect(context, CGRectMake(0, 0, 120, 120));
    [[UIColor redColor] set];
    CGContextFillPath(context);
    //画空心圆
    CGContextAddEllipseInRect(context, CGRectMake(20, 20, 40, 40));
    [[UIColor blueColor] set];
    CGContextFillPath(context);
    //画直线
    CGContextMoveToPoint(context, 10, 10);
    CGContextAddLineToPoint(context, 200, 200);
    [[UIColor greenColor] set];
    CGContextSetLineWidth(context, 8.0f);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextStrokePath(context);
    //画弧
    CGContextAddArc(context, 160, 100, 20, M_PI, M_PI_4, 0);
    CGContextClosePath(context);
    CGContextFillPath(context);
    
}

-(void)drawRect{
    NSLog(@"start drawRect");
    UIBezierPath* path  = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 100, 100)];
    path.lineWidth = 8.0;
    path.lineCapStyle = kCGLineCapRound;
    UIColor * color = [UIColor colorWithRed:0 green:0 blue:07 alpha:1];
    [color set];
    [path stroke];
}

@end
