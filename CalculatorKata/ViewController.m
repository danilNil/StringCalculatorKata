//
//  ViewController.m
//  CalculatorKata
//
//  Created by Danil Nikiforov on 13.11.14.
//  Copyright (c) 2014 Danil. All rights reserved.
//


#import "ViewController.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputText;
@property (weak, nonatomic) IBOutlet UITextField *resultText;

@end

@implementation ViewController

- (IBAction)calculate:(id)sender {
    self.resultText.text = @"hello world";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


@end