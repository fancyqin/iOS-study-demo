//
//  Defaultinstance.h
//  camera
//
//  Created by QF on 2018/2/27.
//  Copyright © 2018年 QF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Defaultinstance : NSObject
+(instancetype)sharedInstance;

@property (strong,nonatomic) NSString *str;

@end
