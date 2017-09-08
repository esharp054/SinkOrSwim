//
//  TimerViewController.m
//  SinkOrSwim
//
//  Created by Elena Sharp on 9/7/17.
//  Copyright © 2017 Elena Sharp. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController ()

//@property (weak, nonatomic) IBOutlet UITextField *textLabel;
@property (nonatomic) BOOL changeTextField;
@property (nonatomic) NSInteger timerCounter;
@property (strong, nonatomic) NSTimer *t;
@property (weak, nonatomic) IBOutlet UIButton *moveButton;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.changeTextField = TRUE;
    self.timerCounter = 0;
    self.textLabel.text = @"Downloading memey content";
    NSDate *d = [NSDate dateWithTimeIntervalSinceNow: 0.0];
    self.t = [[NSTimer alloc] initWithFireDate: d
                                          interval: 1
                                            target: self
                                          selector:@selector(onTick)
                                          userInfo:nil repeats:YES];
    
    NSRunLoop *runner = [NSRunLoop currentRunLoop];
    [runner addTimer:self.t forMode: NSDefaultRunLoopMode];
    [self.moveButton setTitle:@"" forState:UIControlStateNormal];
    
}

-(void) onTick{
    if(self.changeTextField){
        
        [self.textLabel setAlpha:0];
        [UILabel beginAnimations:NULL context:nil];
        [UILabel setAnimationDuration:2.0];
        [self.textLabel setAlpha:1];
        [UILabel commitAnimations];
    }
    else{
        [UILabel beginAnimations:NULL context:nil];
        [UILabel setAnimationDuration:2.0];
        [self.textLabel setAlpha:0];
        [UILabel commitAnimations];
    }
    self.changeTextField = !self.changeTextField;
    self.timerCounter++;
    
    if(self.timerCounter >= 5){
//        [self.t invalidate];
        [self.moveButton setTitle:@"Continue" forState:UIControlStateNormal];
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
