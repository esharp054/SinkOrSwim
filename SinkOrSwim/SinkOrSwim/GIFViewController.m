//
//  GIFViewController.m
//  SinkOrSwim
//
//  Created by Elena Sharp on 9/6/17.
//  Copyright © 2017 Elena Sharp. All rights reserved.
//

#import "GIFViewController.h"
#import "ImageModel.h"
#import "UIImage+animatedGIF.h"

@interface GIFViewController ()

@property (strong,nonatomic) ImageModel* myImageModel;
@property (strong, nonatomic) UIImageView* animatedView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation GIFViewController
@synthesize myImageModel = _myImageModel;

-(ImageModel*) myImageModel{
    
    if(!_myImageModel){
        _myImageModel = [ImageModel sharedInstance];
    }
    return _myImageModel;
}

-(NSInteger)imageIndex{
    
    if(!_imageIndex)
        _imageIndex = 0;
    
    return _imageIndex;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.imageView.image = [self.myImageModel getGIFWithName:@"Eir"];
    
    //set contentMode to scale aspect to fit
    self.animatedView.contentMode = UIViewContentModeScaleAspectFit;
    
    
////    change width of frame
    CGRect frame = self.animatedView.frame;
    frame.size.width = [[UIScreen mainScreen] bounds].size.width;
    self.animatedView.frame = frame;
    self.animatedView.center= self.view.center;
    [self.view addSubview:self.animatedView];
    
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [coordinator animateAlongsideTransition:nil completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        
        //set contentMode to scale aspect to fit
        self.animatedView.contentMode = UIViewContentModeScaleAspectFit;
        
        
        ////    change width of frame
        CGRect frame = self.animatedView.frame;
        frame.size.width = [[UIScreen mainScreen] bounds].size.width;
        self.animatedView.frame = frame;
        self.animatedView.center= self.view.center;
        [self.view addSubview:self.animatedView];
    }];
}

-(UIImageView*) animatedView{
    
    if(!_animatedView){
        _animatedView = [[UIImageView alloc] initWithImage: [[ImageModel sharedInstance] getGIFWithIndex:self.imageIndex]];
    }
    
    return _animatedView;
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
