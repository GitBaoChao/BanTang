//
//  UIApplication+XYNetWorkActivity.h
//  yunshouyi
//
//  Created by ZhangChangwei on 15/3/12.
//  Copyright (c) 2015年 Shanghai Yunshouyi Company Limited. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface UIApplication (XYNetWorkActivity)

@property (nonatomic, assign, readonly) NSInteger networkActivityCount;

- (void)pushNetworkActivity;
- (void)popNetworkActivity;
- (void)resetNetworkActivity;

@end