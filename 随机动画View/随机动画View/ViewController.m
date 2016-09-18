//
//  ViewController.m
//  随机动画View
//
//  Created by MichaelLi on 16/9/18.
//  Copyright © 2016年 手持POS机. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *whiteView;
@property (weak, nonatomic) UIView*fatherView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark
#pragma mark -  改变View颜色
- (IBAction)changeFatherColor:(UIButton *)sender {

    //初始化父类View
    UIView *fatherView = sender.superview;
    fatherView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:fatherView];
}
#pragma mark
#pragma mark -  随机改变颜色
- (IBAction)randomFatherColor:(UIButton *)sender {

    UIView *fatherView = sender.superview;
    CGFloat r = arc4random_uniform(255)/255.0;
     CGFloat g = arc4random_uniform(255)/255.0;
     CGFloat b = arc4random_uniform(255)/255.0;

    fatherView.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
    [self.view addSubview:fatherView];
}
#pragma mark
#pragma mark -  移动view
- (IBAction)moveView:(UIButton *)sender {

    UIView *fatherView = [[UIView alloc]init];
    fatherView.tag = 100;
    CGFloat x = arc4random_uniform(self.whiteView.frame.size.width- fatherView.frame.size.width)/1;
    CGFloat y = arc4random_uniform(self.whiteView.frame.size.height - fatherView.frame.size.height)/ 1;
    fatherView.frame = CGRectMake(x,y, 200, 200);
    fatherView.center = self.whiteView.center;
    CGFloat r = arc4random_uniform(255)/255.0;
    CGFloat g = arc4random_uniform(255)/255.0;
    CGFloat b = arc4random_uniform(255)/255.0;

    fatherView.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0];


    [self.whiteView addSubview:fatherView];
    self.fatherView = fatherView;

    [UIView animateWithDuration:1.5 animations:^{

        /*------获取fatherView的位置------*/
        //获取原来的位置
        CGRect oldFrame = fatherView.frame;
        CGFloat x = arc4random_uniform(self.whiteView.frame.size.width- fatherView.frame.size.width)/1;
        CGFloat y = arc4random_uniform(self.whiteView.frame.size.height - fatherView.frame.size.height)/ 1;
        //这是获取位置
        oldFrame.origin.x = x;
        oldFrame.origin.y = y;
        NSLog(@"%lf   %lf",oldFrame.origin.x,oldFrame.origin.y);
        NSLog(@"%lf  %lf",self.whiteView.center.x,self.whiteView.center.y);
        //赋值给原来的位置
        fatherView.frame = oldFrame;

    }];

    [UIView animateWithDuration:8 animations:^{
        fatherView.alpha = 0;

    }];

    NSLog(@"%d   %d",fatherView.tag,self.whiteView.tag);

}
#pragma mark
#pragma mark -  清除View
- (IBAction)clearView:(UIButton *)sender {

//
//    if (self.whiteView.subviews.count) {
//        //        [self.fatherView removeFromSuperview];
//    //一个一个的删除子控件
//    for (int i = 0; i < self.whiteView.subviews.count; i ++) {
//        [[self.whiteView.subviews objectAtIndex:i]removeFromSuperview];
////        [self.whiteView removeFromSuperview];
//        }
//    }

    //一键清除subView
//    [self.whiteView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
//
//    UIView *view = [self.whiteView viewWithTag:100];
//    if ((view.tag = 100) && (self.whiteView.subviews.count)){
//        
//        [view removeFromSuperview];
//    }




    //删除subView,不删除Label--->双重判断:1.是不是子类  2.tag
    for (UIView *subView in [self.whiteView subviews]) {
     UIView *view = [self.whiteView viewWithTag:100];

        if (([subView  isKindOfClass:[UIView class]]) &&(view.tag == 100)){
            [view removeFromSuperview];
        }
    }
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
