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
@property (weak, nonatomic) IBOutlet UISegmentedControl *peopleCountControl;

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

- (IBAction)onPeopleCountChange:(UISegmentedControl *)sender {
    [self updateValues];
}


- (void) updateValues {
    float billValue = [self.billTextField.text floatValue];
    NSArray *tipValues = @[@(0.15), @(0.2), @(0.25)];
    int numOfPeopleIndex = (int) self.peopleCountControl.selectedSegmentIndex;
    int numOfPeople = [self.peopleCountControl titleForSegmentAtIndex:numOfPeopleIndex].intValue;
    float tipAmount = ([tipValues[self.tipControl.selectedSegmentIndex] floatValue] * billValue) / numOfPeople;
    float totalAmount = billValue / numOfPeople + tipAmount;
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];

    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
    
}

@end
