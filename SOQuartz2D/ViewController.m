//
//  ViewController.m
//  SOQuartz2D
//
//  Created by zwdeng on 16/5/5.
//  Copyright © 2016年 zwdeng. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Clip.h"
#import "SOUIView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
    UIImageView * imageview =[[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    imageview.image = [UIImage imageOfCutWithImage:[UIImage imageNamed:@"th.jpeg"] BorderWidth:2 BorderColor:[UIColor redColor]];
    [self.view addSubview:imageview];

    SOUIView * view  = [[SOUIView alloc] initWithFrame:CGRectMake(100, 300, 200, 200)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    UIImage *image =  [UIImage imageWithSnapView:self.view];
    // 将image转成NSData写入,验证
    // compressionQuality： 图片质量 1:最高质量
    NSData *data = UIImageJPEGRepresentation(image,1);
    
    [data writeToFile:@"....../Desktop/view.png" atomically:YES];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: animated];
    NSLog(@"viewWillAppear");
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
