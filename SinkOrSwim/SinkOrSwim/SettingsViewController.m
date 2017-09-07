//
//  SettingsViewController.m
//  SinkOrSwim
//
//  Created by Elena Sharp on 9/6/17.
//  Copyright © 2017 Elena Sharp. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *switchLabel;

@property (weak, nonatomic) IBOutlet UISwitch *invertSwitch;

@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;

@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation SettingsViewController

- (IBAction)makeVibrate:(id)sender {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

- (IBAction)changeNumberImages:(id)sender {
    
    NSInteger value = self.slider.value * 10;
    
    self.sliderLabel.text = [NSString stringWithFormat:@"Current Number of Images: %ld", value];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.switchLabel.text = @"For Interactive Fun";
    
    self.sliderLabel.text = @"Adjust Number of Images Using Slider";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
