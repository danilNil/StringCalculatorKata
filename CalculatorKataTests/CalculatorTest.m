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

- (void)testAddMethod_OneLengthInput_ReturnsEquivalent{
    int result = [sut add:@"3"];

    int expected = 3;

    XCTAssertEqual(expected, result);
}

- (void)testAddMethod_TwoLengthInput_ReturnsSum{
    int result = [sut add:@"3,4"];

    int expected = 7;

    XCTAssertEqual(expected, result);
}

- (void)testAddMethodAnyLengthInput_ReturnsSum{
    int howMany = arc4random() %999;
    NSMutableString *numbers = [NSMutableString string];
    int expected = 0;

    for (int i = 0; i < howMany; ++i) {
        [numbers appendString:[NSString stringWithFormat:@"%d,",i]];
        expected +=i;
    }

    int result = [sut add:numbers];
    XCTAssertEqual(expected, result, @"Any Lentgh input return sum");
}

- (void)testAddMethod_NewLineDelimiterInput_ReturnsSum{
    int result = [sut add:@"3,4\n5"];

    int expected = 12;

    XCTAssertEqual(expected, result);
}


-(void)testAddMethod_DuplicateDelimiterInput_ThrowsExpectedException{
    XCTAssertThrowsSpecificNamed([sut add:@"3,,4"], NSException, @"DuplicateDelimitersException", @"");
}

@end
