//
//  Defaultinstance.m
//  camera
//
//  Created by QF on 2018/2/27.
//  Copyright © 2018年 QF. All rights reserved.
//

#import "Defaultinstance.h"

@implementation Defaultinstance

//通过类方法创建单例对象
+(instancetype)sharedInstance{
    static Defaultinstance *sharedVC = nil;
    if(sharedVC == nil){
        sharedVC = [[Defaultinstance alloc] init];
    }
    
    return sharedVC;
}

@end
