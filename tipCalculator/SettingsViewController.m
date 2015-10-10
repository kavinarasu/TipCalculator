//
//  SettingsViewController.m
//  tipCalculator
//
//  Created by Kavin Arasu on 10/8/15.
//  Copyright © 2015 groupon. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipControl;
@property (weak, nonatomic) IBOutlet UISwitch *splitGroupSwitch;

@end

@implementation SettingsViewController

- (void)viewWillAppear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int tipIndex = (int) [defaults integerForKey:@"defaultTipValue"];
    BOOL shouldSplitGroup = [defaults boolForKey:@"shouldSplitGroup"];
    [self.defaultTipControl setSelectedSegmentIndex:tipIndex];
    [self.splitGroupSwitch setOn:shouldSplitGroup];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onValueChanged:(UISegmentedControl *)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.defaultTipControl.selectedSegmentIndex forKey:@"defaultTipValue"];
    [defaults synchronize];
}
- (IBAction)onSplitGroupValueChanged:(UISwitch *)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSLog(@" %s", self.splitGroupSwitch.on ? "true" : "false");
    [defaults setBool:self.splitGroupSwitch.on forKey:@"shouldSplitGroup"];
    [defaults synchronize];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
