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
        total +=[numberString intValue];
    }
    return total;
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
    numbers = [self handleNewLineDelimiters:numbers];
    [self guardConditionDuplicatedDelimitersRejected:numbers];
    if([numbers rangeOfString:@","].location != NSNotFound)
        return [self sum:numbers];
    return [numbers length]>0 ? [numbers intValue] : 0;
}



@end