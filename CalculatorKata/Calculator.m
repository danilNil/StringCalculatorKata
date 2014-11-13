//
// Created by Danil Nikiforov on 13.11.14.
// Copyright (c) 2014 Danil. All rights reserved.
//

#import "Calculator.h"


@implementation Calculator {

}
- (int)add:(NSString *)numbers {
    return [numbers length]>0 ? [numbers intValue] : 0;
}
@end