//
//  ParanthesisCountTests.m
//  ParanthesisCountTests
//
//  Created by Pranav Jaiswal on 7/30/15.
//  Copyright (c) 2015 Pranav Jaiswal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ViewController.h"
@interface ParanthesisCountTests : XCTestCase
{
    ViewController *viewController;
}
@end

@implementation ParanthesisCountTests

- (void)setUp {
    [super setUp];
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    viewController = (ViewController *)[storyBoard instantiateViewControllerWithIdentifier:@"ViewController"];
    [viewController view];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}
- (void)testValidateZeroParanthesisCases
{
    XCTAssertNotNil(viewController, @"Cannot create View Controller instance");
    [viewController.inputtextField setText:@")))))))((((((("];
    UIButton *validateButton = (UIButton *)[viewController.view viewWithTag:5];
    [viewController validateInputString:validateButton];
    XCTAssertEqualObjects(viewController.resultLabel.text, @"Number of valid paranthesis:0");
}
- (void)testValidateNilInput
{
    XCTAssertNotNil(viewController, @"Cannot create View Controller instance");
    [viewController.inputtextField setText:nil];
    UIButton *validateButton = (UIButton *)[viewController.view viewWithTag:5];
    [viewController validateInputString:validateButton];
    XCTAssertEqualObjects(viewController.resultLabel.text, @"Number of valid paranthesis:0");
}
- (void)testValidNumberOfParanthesis
{
    XCTAssertNotNil(viewController, @"Cannot create View Controller instance");
    [viewController.inputtextField setText:@"(((()))))))((())((()("];
    UIButton *validateButton = (UIButton *)[viewController.view viewWithTag:5];
    [viewController validateInputString:validateButton];
    NSLog(@"%@",viewController.resultLabel.text);
    XCTAssertEqualObjects(viewController.resultLabel.text, @"Number of valid paranthesis:7");
}
- (void)testFailureCase
{
    XCTAssertNotNil(viewController, @"Cannot create View Controller instance");
    [viewController.inputtextField setText:@"(((()))))))((())((()("];
    UIButton *validateButton = (UIButton *)[viewController.view viewWithTag:5];
    [viewController validateInputString:validateButton];
    NSLog(@"%@",viewController.resultLabel.text);
    XCTAssertNotEqualObjects(viewController.resultLabel.text, @"Number of valid paranthesis:6");
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        NSString *inputString = @"((())A((((((((()(((((**((((((((((((((((((";
        const char *stringArray = [inputString UTF8String];
        int openBracketCount = 0;
        int closeBracketCount = 0;
        int validBracketsCount =0;
        for (int i=0; i<inputString.length; i++)
        {
            NSLog(@"Character at index %d is:%c",i,stringArray[i]);
            if (stringArray[i] == '(') {
                openBracketCount++;
            }
            else if (stringArray[i] == ')')
            {
                if (openBracketCount>0)
                {
                    closeBracketCount++;
                    if (closeBracketCount<=openBracketCount)
                    {
                        validBracketsCount++;
                    }
                    else
                    {
                        openBracketCount = 0;
                    }
                }
            }
        }
        
    }];
}

@end
