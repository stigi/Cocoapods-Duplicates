//
//  DupTests.m
//  DupTests
//
//  Created by Ullrich Schäfer on 31/08/14.
//  Copyright (c) 2014 ullrich. All rights reserved.
//

#import "USAppDelegate.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

#import <XCTest/XCTest.h>

@interface DupTests : XCTestCase

@end

@implementation DupTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    USAppDelegate *appDelegate = (USAppDelegate*)[[UIApplication sharedApplication] delegate];
    RACSubject *subject = appDelegate.subject;
    
    XCTAssert([subject isKindOfClass:RACSubject.class],
              @"Expecting %@<%p> to be kind of %@<%p>",
              NSStringFromClass(subject.class), subject,
              NSStringFromClass(RACSubject.class), RACSubject.class);
    
    XCTAssertEqual(subject.class, RACSubject.class,
                   @"Expecting %@<%p> to equal %@<%p>",
                   NSStringFromClass(subject.class), subject.class,
                   NSStringFromClass(RACSubject.class), RACSubject.class);
}

@end
