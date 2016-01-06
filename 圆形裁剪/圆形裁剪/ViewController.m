//
//  ViewController.m
//  圆形裁剪
//
//  Created by 章芝源 on 16/1/6.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageWithImageName:@"07eef38f8c5494ee8407dca42df5e0fe99257e13" color:[UIColor redColor] imageWithBoderW:10.0];
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = image;
    imageView.frame = CGRectMake(0, 0, 300, 300);
    [self.view addSubview:imageView];
}

- (void)test1
{
    //位图上下文
    UIImage *image = [UIImage imageNamed:@"07eef38f8c5494ee8407dca42df5e0fe99257e13"];
    
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    UIBezierPath *bzrPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    
    [bzrPath addClip];
    
    //把图片画到上下文中
    [image drawAtPoint:CGPointMake(0, 0)];
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.frame = CGRectMake(0, 0, 300, 300);
    imageView.image = image;
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
