//
//  SettingsViewController.h
//  SinkOrSwim
//
//  Created by Elena Sharp on 9/6/17.
//  Copyright © 2017 Elena Sharp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioServices.h>

@interface SettingsViewController : UIViewController<UITextFieldDelegate,UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *memeNamePicker;


@end
