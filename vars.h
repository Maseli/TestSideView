//
//  vars.h
//  TestSideView
//
//  Created by PL on 13-3-15.
//  Copyright (c) 2013年 M. All rights reserved.
//

#ifndef TestSideView_vars_h
#define TestSideView_vars_h


#define OFFSETLEFT 30
#define OFFSETRIGHT 30

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#endif
