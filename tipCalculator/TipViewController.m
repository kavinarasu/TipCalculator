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
@property (weak, nonatomic) IBOutlet UILabel *eachTipLabel;
@property (weak, nonatomic) IBOutlet UILabel *eachTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *eachTipLabelField;
@property (weak, nonatomic) IBOutlet UILabel *eachTotalLabelField;

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
    BOOL shouldSplitGroup = [defaults boolForKey:@"shouldSplitGroup"];
    NSLog(@" %s", shouldSplitGroup ? "true" : "false");
    if(shouldSplitGroup) {
        self.peopleCountControl.alpha = 1;
        self.eachTipLabel.alpha = 1;
        self.eachTotalLabel.alpha = 1;
        self.eachTipLabelField.alpha = 1;
        self.eachTotalLabelField.alpha = 1;
    } else {
        self.peopleCountControl.alpha = 0;
        self.eachTipLabel.alpha = 0;
        self.eachTotalLabel.alpha = 0;
        self.eachTipLabelField.alpha = 0;
        self.eachTotalLabelField.alpha = 0;
    }
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
    float tipAmount = ([tipValues[self.tipControl.selectedSegmentIndex] floatValue] * billValue);
    float eachTipAmount = tipAmount / numOfPeople;
    self.eachTipLabel.text = [NSString stringWithFormat:@"$%0.2f", eachTipAmount];
    
    float totalAmount = billValue + tipAmount;
    float eachTotalAmount = billValue / numOfPeople + eachTipAmount;
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.eachTotalLabel.text = [NSString stringWithFormat:@"$%0.2f", eachTotalAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
    
}

@end
