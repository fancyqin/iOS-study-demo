//
//  ViewController.m
//  camera
//
//  Created by QF on 2018/1/22.
//  Copyright © 2018年 QF. All rights reserved.
//

#import "ViewController.h"

#import "SecondViewController.h"
#import "Defaultinstance.h"


@interface ViewController ()<passValueDelegate> //遵守协议
@property (nonatomic,strong) UILabel *label;
@property (nonatomic,strong) UIButton *btn;

@end



@implementation ViewController

- (UILabel *)label{
    
    if(_label == nil){
        _label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 200, 40)];
        _label.backgroundColor = [UIColor blueColor];
        _label.textColor = [UIColor whiteColor];
        _label.font = [UIFont systemFontOfSize:20];
    }
    return _label;
}



- (UIButton *)btn{
    if(_btn == nil){
        _btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 150, 200, 30)];
        _btn.backgroundColor = [UIColor brownColor];
        [_btn setTitle:@"跳转" forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        
        [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _btn;
}

- (void)btnClick{
    SecondViewController *nxVC = [[SecondViewController alloc] init];
    //属性传值
//    nxVC.str = @"属性传值";
    //单例传值
//    [Defaultinstance sharedInstance].str = @"单例传值";
    //NSUserDefaults传值--正向传值
//    [[NSUserDefaults standardUserDefaults] setObject:@"NSUserDefaults传值" forKey:@"key11"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    //代理传值--设置代理关系
//    nxVC.valDelegate = self;
    
    //block传值--实现block-接受页面2的值
    nxVC.block123 = ^(NSString *str12){
//        self.label.text = str12;
    };
    
    //通知传值--添加监听--等待页面2的传值
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(noticeHandler:) name:@"notice123" object:nil];
    
    
    [self presentViewController:nxVC animated:YES completion:nil];
    
}
//接受到通知的处理--参数1:通知

- (void)noticeHandler:(NSNotification *)not{
    self.label.text = not.userInfo[@"not"];
}

//代理传值--实现协议方法--接受页面2的值
-(void)passVal:(NSString *)str{
//    self.label.text = str;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //接受单例反向传值
//    self.label.text = [Defaultinstance sharedInstance].str;
    
    //接受NSUserDefaults反向传值
    
//    self.label.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"key1-re"];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.label];
    [self.view addSubview:self.btn];
    
}



//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    UIAlertAction *alert = [[UIAlertAction alloc] init];
//
//    [self performSelector:@selector(dismiss:) withObject:alert afterDelay:1.0];
//}
//
//- (void)dismiss:(UIAlertController *)alert{
//
//}



@end

