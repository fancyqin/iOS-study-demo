//
//  SecondViewController.m
//  camera
//
//  Created by QF on 2018/2/27.
//  Copyright © 2018年 QF. All rights reserved.
//

#import "SecondViewController.h"
#import "Defaultinstance.h"

@interface SecondViewController ()
@property (strong,nonatomic) UITextField *textField;
@property (strong,nonatomic) UIButton *btn;

@end

@implementation SecondViewController

- (UITextField *) textField{
    if(!_textField){
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 200, 30)];
        _textField.textColor = [UIColor blackColor];
        _textField.borderStyle = UITextBorderStyleBezel;
//        _textField.backgroundColor = [UIColor grayColor];
        //属性传值--接受并显示
//        _textField.text = self.str;
        //单例传值--接受并显示
//        _textField.text = [Defaultinstance sharedInstance].str;
        //NSUserDefaults 传值--从文件读取并显示
//        _textField.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"key11"];
        
    
        
    }
    return _textField;
}

- (UIButton *) btn{
    if (!_btn) {
        _btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 150, 200, 30)];
        _btn.backgroundColor = [UIColor brownColor];
        [_btn setTitle:@"返回1" forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _btn.titleLabel.font = [UIFont systemFontOfSize:20];
        
        [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _btn;
}

- (void) btnClick{
    //单例传值 反向传递
//    [Defaultinstance sharedInstance].str = self.textField.text;
    
    //NSUserDefaults 反向传值
//    [[NSUserDefaults standardUserDefaults] setObject:self.textField.text forKey:@"key1-re"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
    
    //代理传值--反向传值
//    [self.valDelegate passVal:self.textField.text];
    
    //block传值--反向传值
//    self.block123(self.textField.text);
    
    //通知传值
    [[NSNotificationCenter defaultCenter] postNotificationName:@"notice123" object:nil userInfo:@{@"not":self.textField.text}];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.textField];
    [self.view addSubview:self.btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
