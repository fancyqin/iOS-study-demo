//
//  SecondViewController.h
//  camera
//
//  Created by QF on 2018/2/27.
//  Copyright © 2018年 QF. All rights reserved.
//

#import <UIKit/UIKit.h>


//委托方--创建一个协议
@protocol passValueDelegate <NSObject>

//定义协议方法
-(void) passVal:(NSString *)str;

@end

@interface SecondViewController : UIViewController

@property (nonatomic,strong) NSString *str;

//定义一个持有协议的id指针
@property (weak)id<passValueDelegate>valDelegate;

//定义一个block进行页面反向传值
@property (copy) void (^block123)(NSString *);

@end
