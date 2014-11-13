//
//  CalculatorTest.m
//  CalculatorKata
//
//  Created by Danil Nikiforov on 13.11.14.
//  Copyright (c) 2014 Danil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Calculator.h"

@interface CalculatorTest : XCTestCase{
    Calculator *sut;
}

@end

@implementation CalculatorTest

- (void)setUp {
    [super setUp];
    sut = [[Calculator alloc] init];

}

- (void)testAddMethod_ZeroLengthInput_ReturnsZero{
    int result = [sut add:@""];

    int expected = 0;

    XCTAssertEqual(expected, result);
}



@end
