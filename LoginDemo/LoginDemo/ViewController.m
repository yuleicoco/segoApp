//
//  ViewController.m
//  LoginDemo
//
//  Created by yulei on 16/10/21.
//  Copyright © 2016年 yulei. All rights reserved.
//

#import "ViewController.h"
#import <ShareSDKExtension/SSEThirdPartyLoginHelper.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

{
    
    UIButton * btn;
    UIView * bigBtn;
    CGPoint currentPoint;
    
    
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    // 测试地址 git 推送
    
    /*
    UIButton * btn =[[UIButton alloc]init];
    [btn addTarget:self action:@selector(TouchBtn:) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor =[UIColor redColor];
    btn.frame = CGRectMake(30, 100, 100, 100);
    [btn setTitle:@"点我登录" forState:UIControlStateNormal];
    [self.view addSubview:btn];
     */
    
    
    bigBtn =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 260, 260)];
    bigBtn.backgroundColor =[UIColor blueColor];
    bigBtn.center = self.view.center;
    bigBtn.layer.masksToBounds = YES;
    bigBtn.layer.cornerRadius = 130;
    [self.view addSubview:bigBtn];
    
    
    
    btn =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
    btn.center = CGPointMake(bigBtn.bounds.size.width/2, bigBtn.bounds.size.height/2);
    
    btn.backgroundColor =[UIColor redColor];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 30;
   // [btn addTarget:self action:@selector(touchSta) forControlEvents:UIControlEventTouchUpInside];
    [bigBtn addSubview:btn];
    
   //heheheheheheeh
    

    
    
    
    
    
    
    
    
    
}


 -(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches anyObject];
    NSUInteger toucheNum = [[event allTouches] count];//有几个手指触摸屏幕
    if ( toucheNum > 1 ) {
        return;//多个手指不执行旋转
    }
    
    CGPoint center = CGPointMake(CGRectGetMidX([touch.view bounds]), CGRectGetMidY([touch.view bounds]));
     currentPoint = [touch locationInView:touch.view];//当前手指的坐标
    CGPoint previousPoint = [touch previousLocationInView:touch.view];//上一个坐标
       
    
    [self touchSta:currentPoint];
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    
    btn.center = CGPointMake(bigBtn.bounds.size.width/2 , bigBtn.bounds.size.height/2 );
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded]; //告知页面立刻刷新，系统立即调用updateConstraints
    }];
    
}


- (void)touchSta:(CGPoint )sender
{
    
    btn.center =sender;
    [UIView animateWithDuration:0.4 animations:^{
        [self.view layoutIfNeeded]; //告知页面立刻刷新，系统立即调用updateConstraints
    }];
    
    
}






- (void)TouchBtn:(UIButton *)sender

{
//    
//    [SSEThirdPartyLoginHelper loginByPlatform:SSDKPlatformTypeWechat
//                                   onUserSync:^(SSDKUser *user, SSEUserAssociateHandler associateHandler) {
//                                       
//                                       //在此回调中可以将社交平台用户信息与自身用户系统进行绑定，最后使用一个唯一用户标识来关联此用户信息。
//                                       //在此示例中没有跟用户系统关联，则使用一个社交用户对应一个系统用户的方式。将社交用户的uid作为关联ID传入associateHandler。
//                                       associateHandler (user.uid, user, user);
//                                       NSLog(@"dd%@",user.rawData);
//                                       NSLog(@"dd%@",user.credential);
//                                       
//                                   }
//                                onLoginResult:^(SSDKResponseState state, SSEBaseUser *user, NSError *error) {
//                                    
//                                    if (state == SSDKResponseStateSuccess)
//                                    {
//                                        
//                                        
//                                        NSLog(@"Successful");
//                                        
//                                    }
//                                    
//                                }];
//    
    
    

    
    [ShareSDK getUserInfo:SSDKPlatformTypeSinaWeibo
           onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error)
     {
         
        
         if (state == SSDKResponseStateSuccess)
         {
             
             NSLog(@"id=%@",user.uid);
             NSLog(@"%@",user.credential);
             NSLog(@"token=%@",user.credential.token);
             NSLog(@"昵称=%@",user.nickname);
             NSLog(@"头像%@",user.icon);
             
         }
                  
         else
         {
             NSLog(@"%@",error);
         }
         
     }];
    
     
     
    
    
      
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
