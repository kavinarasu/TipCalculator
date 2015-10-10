//
//  ViewController.m
//  tipCalculator
//
//  Created by Kavin Arasu on 10/3/15.
//  Copyright (c) 2015 groupon. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UITextField *billTextField;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tip Controller";
    [self updateValues];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onBillAmountChanged:(UITextField *)sender {
    [self updateValues];
}

- (void)viewWillAppear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int tipIndex = (int) [defaults integerForKey:@"defaultTipValue"];
    [self.tipControl setSelectedSegmentIndex:tipIndex];
    [self updateValues];
}
     
- (IBAction)onControlChange:(UISegmentedControl *)sender {
    [self updateValues];
}

- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void) updateValues {
    float billValue = [self.billTextField.text floatValue];
    NSArray *tipValues = @[@(0.15), @(0.2), @(0.25)];
    float tipAmount = [tipValues[self.tipControl.selectedSegmentIndex] floatValue] * billValue;
    float totalAmount = billValue + tipAmount;
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];

    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
    
}

@end
