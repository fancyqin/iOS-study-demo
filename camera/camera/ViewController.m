//
//  ViewController.m
//  camera
//
//  Created by QF on 2018/1/22.
//  Copyright © 2018年 QF. All rights reserved.
//

#import "ViewController.h"


@interface ViewController (){
    NSArray* data;
}

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    data = @[@"刘备",@"关羽",@"张飞",@"马超",@"黄忠",@"诸葛亮"];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"NameIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSString *name = data[indexPath.row];
    cell.textLabel.text = name;
    return cell;
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

