//
//  ViewController.m
//  SinkOrSwim
//
//  Created by Elena Sharp on 9/4/17.
//  Copyright © 2017 Elena Sharp. All rights reserved.
//

#import "ViewController.h"
#import "ImageModel.h"

@interface ViewController () <NSURLSessionTaskDelegate, UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *viewMain;
@property (strong, nonatomic) NSURLSession *session;


//client ID: 77b0c801d1a25b7
//client secret: 997e2ccfb98ba9a02baebc9abdfd8f55de86c4b8

@property (strong,nonatomic) ImageModel* myImageModel;
@property (strong, nonatomic) UIImageView* imageView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController
@synthesize myImageModel = _myImageModel;

-(ImageModel*) myImageModel{
    
    if(!_myImageModel){
        _myImageModel = [ImageModel sharedInstance];
    }
    return _myImageModel;
}

-(NSString*) imageName {
    
    if(!_imageName){
        _imageName = @"Eric1";
    }
    
    return _imageName;
}

-(UIImageView*) imageView{
    
    if(!_imageView){
        _imageView = [[UIImageView alloc] initWithImage: [[ImageModel sharedInstance] getImageWithName:self.imageName]];
    }
    
    return _imageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    // Session stuff to pull from Imgur
    NSURLSessionConfiguration *sessionConfig =
    [NSURLSessionConfiguration ephemeralSessionConfiguration];
    
    sessionConfig.timeoutIntervalForRequest = 5.0;
    sessionConfig.timeoutIntervalForResource = 8.0;
    sessionConfig.HTTPMaximumConnectionsPerHost = 1;
    
    self.session =
    [NSURLSession sessionWithConfiguration:sessionConfig
                                  delegate:self
                             delegateQueue:nil];
    
    [self.scrollView addSubview:self.imageView];
    self.scrollView.contentSize = self.imageView.image.size;
    self.scrollView.minimumZoomScale = 0.1;
    self.scrollView.delegate = self;
    
    for(NSInteger i = 0; i < self.myImageModel.data.count; i++){
        NSLog(@"Test");
        NSLog(@"%@", self.myImageModel.data[i]);
    }
    
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

-(IBAction)getGallery: (id) sender{
    
    // get a new dataset ID from the server (gives back a new dataset id)
    // Note that if data is not uploaded, the server may issue the same dsid to another requester
    // ---how might you solve this problem?---
    
    // create a GET request and get the reponse back as NSData
    
    
    NSURL *baseURL = [NSURL URLWithString:@"https://api.imgur.com/3/gallery/search/top/year/.3?q=cat+memes"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:baseURL];
    
    [request setHTTPMethod:@"GET"];
    
    [request addValue:[NSString stringWithFormat:@"Client-ID %@", @"77b0c801d1a25b7"] forHTTPHeaderField:@"Authorization"];
 
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
         if(!error){
//           NSLog(@"%@",response);
             NSDictionary *responseData = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error: &error];
             [self.myImageModel setImgurPull:responseData];
             for(NSString *key in responseData) {
//                 NSLog(@"%@",[responseData objectForKey:key]);
             }
            }
          
         else{
             NSLog(@"%@",error);
            }
        }
    ];
    [dataTask resume];
}

@end
