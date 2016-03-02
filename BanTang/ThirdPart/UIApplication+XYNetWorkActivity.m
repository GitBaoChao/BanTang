//
//  UIApplication+XYNetWorkActivity.m
//  yunshouyi
//
//  Created by ZhangChangwei on 15/3/12.
//  Copyright (c) 2015年 Shanghai Yunshouyi Company Limited. All rights reserved.
//

#import "UIApplication+XYNetWorkActivity.h"

static NSInteger networkActivityCount = 0;

@implementation UIApplication (XYNetWorkActivity)

- (NSInteger)networkActivityCount{
    @synchronized(self){
        return networkActivityCount;
    }
}

- (void)pushNetworkActivity{
    @synchronized(self){
        networkActivityCount ++;
    }
    [self refreshNetworkActivityIndicator];
}

- (void)popNetworkActivity{
    @synchronized(self){
        if (networkActivityCount > 0) {
            networkActivityCount--;
        }else{
            networkActivityCount = 0;
        }
    }
    
    [self refreshNetworkActivityIndicator];
}

- (void)refreshNetworkActivityIndicator{
    if (![NSThread isMainThread]) {
        SEL sel_refresh = @selector(refreshNetworkActivityIndicator);
        [self performSelectorOnMainThread:sel_refresh withObject:nil waitUntilDone:NO];
        return;
    }
    BOOL active = (self.networkActivityCount > 0);
    self.networkActivityIndicatorVisible = active;
}

- (void)resetNetworkActivity{
    @synchronized(self){
        networkActivityCount = 0;
    }
    [self refreshNetworkActivityIndicator];
}
@end