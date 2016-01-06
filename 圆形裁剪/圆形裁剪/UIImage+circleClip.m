//
//  UIImage+circleClip.m
//  圆形裁剪
//
//  Created by 章芝源 on 16/1/6.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import "UIImage+circleClip.h"

@implementation UIImage (circleClip)
+ (UIImage *)imageWithImageName:(NSString *)imageName color:(UIColor *)color imageWithBoderW:(CGFloat)borderW
{
    
    UIImage *image = [UIImage imageNamed:imageName];
    //设置大圆制作圆环
    CGFloat borderViewH = borderW * 2 + image.size.height;
    CGFloat borderViewW = borderW * 2 + image.size.width;
    //大圆范围
    CGRect bigCircle = CGRectMake(0, 0, borderViewW, borderViewH);
    UIGraphicsBeginImageContextWithOptions(bigCircle.size, NO, 0);
    UIBezierPath *bzrPath = [UIBezierPath bezierPathWithOvalInRect:bigCircle];
    [color set];
    [bzrPath fill];
    
    //小圆
    CGRect smallCircle = CGRectMake(borderW, borderW, image.size.width, image.size.height);
    bzrPath = [UIBezierPath bezierPathWithOvalInRect:smallCircle];
    [bzrPath addClip];
    
    //把图片画上去
    [image drawAtPoint:CGPointMake(borderW, borderW)];
    
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndPDFContext();
    
    return image;
}
@end
