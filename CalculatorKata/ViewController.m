//
//  ViewController.m
//  CalculatorKata
//
//  Created by Danil Nikiforov on 13.11.14.
//  Copyright (c) 2014 Danil. All rights reserved.
//


#import "ViewController.h"
#import "Calculator.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputText;
@property (weak, nonatomic) IBOutlet UITextField *resultText;

@end

@implementation ViewController

- (IBAction)calculate:(id)sender {
    @try {
        Calculator *calculator = [[Calculator alloc] init];
        int result = [calculator add:self.inputText.text];
        self.resultText.text = [NSString stringWithFormat:@"%d", result];
    }
    @catch (NSException *ex){
        self.resultText.text = [ex.name description];
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];
}


@end