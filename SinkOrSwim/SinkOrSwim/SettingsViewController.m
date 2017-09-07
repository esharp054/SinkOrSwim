//
//  SettingsViewController.m
//  SinkOrSwim
//
//  Created by Elena Sharp on 9/6/17.
//  Copyright © 2017 Elena Sharp. All rights reserved.
//

#import "SettingsViewController.h"
#import "ImageModel.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *switchLabel;
@property (weak, nonatomic) IBOutlet UISwitch *invertSwitch;
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *stepperLabel;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (strong,nonatomic) ImageModel* myImageModel;

@end

@implementation SettingsViewController
@synthesize myImageModel = _myImageModel;

-(ImageModel*) myImageModel{
    
    if(!_myImageModel){
        _myImageModel = [ImageModel sharedInstance];
    }
    return _myImageModel;
}

- (IBAction)makeVibrate:(id)sender {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

- (IBAction)changeNumberImages:(id)sender {
    
    NSNumber* value =  [NSNumber numberWithFloat:self.slider.value];
    
    self.sliderLabel.text = [NSString stringWithFormat:@"Current Value: %.2f", value.doubleValue];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.switchLabel.text = @"For Interactive Fun";
    
    NSNumber* value =  [NSNumber numberWithFloat:self.slider.value];
    
    self.sliderLabel.text = [NSString stringWithFormat:@"Current Value: %.2f", value.doubleValue];

    self.stepperLabel.text = [NSString stringWithFormat:@"Current Number of Memes: %.2ld", (long)self.myImageModel.numImagesDisplayed];
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
