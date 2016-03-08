//
//  ViewController.m
//  UseLayer
//
//  Created by 刘浩浩 on 16/1/20.
//  Copyright © 2016年 CodingFire. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController ()
{
    UIView *view;
}
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor grayColor];
    view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    view.center=self.view.center;
    view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:view];
    
    CALayer *blueLayer=[CALayer layer];
    blueLayer.delegate=self;
    blueLayer.frame=CGRectMake(50, 50, 100, 100);
    blueLayer.backgroundColor=[UIColor blueColor].CGColor;
    blueLayer.contentsScale=[UIScreen mainScreen].scale;
    [view.layer addSublayer:blueLayer];
    [blueLayer display];
    
    UIImage *image=[UIImage imageNamed:@"120X120.png"];
    //为图层设置图片
    view.layer.contents=(__bridge id)image.CGImage;
    //设置显示模式为自适应
    view.contentMode=UIViewContentModeScaleAspectFill;
    //边界对齐方式
    view.layer.contentsGravity=kCAGravityResizeAspect;
    //设置寄宿图片和视图的大小比例（在设置了contentsGravity之后设置无效）
    view.layer.contentsScale=1.0;
    //因为CGImage没有拉伸概念，所以图片不会自动读取高清图片，拉伸的概念就消失了，所以有了下面这种手动设置方法
    view.layer.contentsScale=[UIScreen mainScreen].scale;
    view.transform=CGAffineTransformMakeScale(1, 1);
    view.clipsToBounds=YES;
    view.layer.contentsCenter=CGRectMake(0.25, 0.25, 0.5, 0.5);
}
-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    CGContextSetLineWidth(ctx, 10);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
