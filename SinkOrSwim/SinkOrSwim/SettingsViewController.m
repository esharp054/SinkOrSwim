//
//  SettingsViewController.m
//  SinkOrSwim
//
//  Created by Elena Sharp on 9/6/17.
//  Copyright © 2017 Elena Sharp. All rights reserved.
//

#import "SettingsViewController.h"
#import "ImageModel.h"

@interface SettingsViewController (){
    NSArray *_pickerData;
}

@property (weak, nonatomic) IBOutlet UILabel *switchLabel;
@property (weak, nonatomic) IBOutlet UISwitch *invertSwitch;
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *stepperLabel;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (strong,nonatomic) ImageModel* myImageModel;
@property (weak, nonatomic) IBOutlet UILabel *pickerLabel;
@property (weak, nonatomic) IBOutlet UILabel *emojiResponse;

@end

@implementation SettingsViewController
@synthesize myImageModel = _myImageModel;
@synthesize stepper = _stepper;



-(ImageModel*) myImageModel{
    
    if(!_myImageModel){
        _myImageModel = [ImageModel sharedInstance];
    }
    return _myImageModel;
}

- (IBAction)makeVibrate:(id)sender {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

- (IBAction)stepperValueChange:(id)sender {
    
    self.myImageModel.numImagesDisplayed = self.stepper.value;
    
    self.stepperLabel.text = [NSString stringWithFormat:@"Number of Memes: %ld", (long)self.myImageModel.numImagesDisplayed];
}

- (IBAction)changeNumberImages:(id)sender {
    
    NSNumber* value =  [NSNumber numberWithFloat:self.slider.value];
    
    self.sliderLabel.text = [NSString stringWithFormat:@"Current Value: %.2f", value.doubleValue];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.switchLabel.text = @"For Interactive Fun";
    self.pickerLabel.text = @"Rate your meme experience!";
    self.emojiResponse.text = @"😱";
    
    NSNumber* value =  [NSNumber numberWithFloat:self.slider.value];
    
    self.sliderLabel.text = [NSString stringWithFormat:@"Current Value: %.2f", value.doubleValue];

    self.stepperLabel.text = [NSString stringWithFormat:@"Number of Memes: %ld", (long)self.myImageModel.numImagesDisplayed];
    
    self.stepper.value = self.myImageModel.numImagesDisplayed;
    self.stepper.wraps = YES;
    self.stepper.autorepeat = YES;
    self.stepper.maximumValue = 15;
    self.stepper.minimumValue = 1;
    
    _pickerData = @[@"Poor", @"Fair", @"Good",@"Great",@"MemeTastic!"];
    self.memeNamePicker.dataSource = self;
    self.memeNamePicker.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _pickerData.count;
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{

    return _pickerData[row];
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if([_pickerData[row] isEqualToString:@"Poor"]){
        self.emojiResponse.text = @"😱";
    }
    else if([_pickerData[row] isEqualToString:@"Fair"]){
        self.emojiResponse.text = @"☺️";
    }
    else if([_pickerData[row] isEqualToString:@"Good"]){
        self.emojiResponse.text = @"🙂";
    }
    else if([_pickerData[row] isEqualToString:@"Great"]){
        self.emojiResponse.text = @"😀";
    }
    else if([_pickerData[row] isEqualToString:@"MemeTastic!"]){
        self.emojiResponse.text = @"😄";
    }
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
