//
// Created by Danil Nikiforov on 13.11.14.
// Copyright (c) 2014 Danil. All rights reserved.
//

#import "Calculator.h"


@implementation Calculator {

}


- (int)sum:(NSString *)numbers {
    int total = 0;
    NSArray *numbersArray = [numbers componentsSeparatedByString:@","];
    for(NSString *numberString in numbersArray){
        int number = [numberString intValue];
        [self guardConditionNegativeNumber:number];
        total +=number;
    }
    return total;
}

- (void)guardConditionNegativeNumber:(int)number {
    if(number<0)
        [NSException raise:@"NegativeNumbersException" format:@""];
}

- (NSString *)handleNewLineDelimiters:(NSString *)numbers {
    numbers = [numbers stringByReplacingOccurrencesOfString:@"\n" withString:@","];
    return numbers;
}

-(void)guardConditionDuplicatedDelimitersRejected:(NSString *)numbers{
    if([numbers rangeOfString:@",,"].location != NSNotFound)
        [NSException raise:@"DuplicateDelimitersException" format:@""];
}

- (int)add:(NSString *)numbers {
    numbers = [self handleCustomDelimiters:numbers];
    numbers = [self handleNewLineDelimiters:numbers];
    [self guardConditionDuplicatedDelimitersRejected:numbers];
    if([numbers rangeOfString:@","].location != NSNotFound)
        return [self sum:numbers];
    return [numbers length]>0 ? [numbers intValue] : 0;
}

- (NSString *)handleCustomDelimiters:(NSString *)numbers {
    if([numbers hasPrefix:@"//"]){
        NSString *customDelimiter = [numbers substringWithRange:NSMakeRange(2, 1)];
        NSString *suffix = [numbers substringWithRange:NSMakeRange(4, numbers.length-4)];
        numbers = [suffix stringByReplacingOccurrencesOfString:customDelimiter withString:@","];
    }
    return numbers;
}


@end