//
//  USAppDelegate.h
//  Dup
//
//  Created by Ullrich Schäfer on 31/08/14.
//  Copyright (c) 2014 ullrich. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>

#import <UIKit/UIKit.h>

@interface USAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly) RACSubject *subject;

@end
