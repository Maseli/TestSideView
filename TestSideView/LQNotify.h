//
//  LQNotify.h
//  家长汇
//
//  Created by PL on 13-3-23.
//  Copyright (c) 2013年 M. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LQNotify : NSObject

@property (strong, nonatomic) NSString *content;
@property (strong, nonatomic) NSDate *createDate;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *sender;

@end
