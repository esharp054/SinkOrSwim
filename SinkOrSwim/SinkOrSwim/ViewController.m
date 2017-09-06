//
//  ViewController.m
//  SinkOrSwim
//
//  Created by Elena Sharp on 9/4/17.
//  Copyright © 2017 Elena Sharp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <NSURLSessionTaskDelegate>
@property (weak, nonatomic) IBOutlet UIButton *viewMain;
@property (strong, nonatomic) NSURLSession *session;

//client ID: 77b0c801d1a25b7
//client secret: 997e2ccfb98ba9a02baebc9abdfd8f55de86c4b8


@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURLSessionConfiguration *sessionConfig =
    [NSURLSessionConfiguration ephemeralSessionConfiguration];
    
    sessionConfig.timeoutIntervalForRequest = 5.0;
    sessionConfig.timeoutIntervalForResource = 8.0;
    sessionConfig.HTTPMaximumConnectionsPerHost = 1;
    
    self.session =
    [NSURLSession sessionWithConfiguration:sessionConfig
                                  delegate:self
                             delegateQueue:nil];
}

-(IBAction)getGallery: (id) sender{
    
    // get a new dataset ID from the server (gives back a new dataset id)
    // Note that if data is not uploaded, the server may issue the same dsid to another requester
    // ---how might you solve this problem?---
    
    // create a GET request and get the reponse back as NSData
    
    
    NSURL *baseURL = [NSURL URLWithString:@"https://api.imgur.com/3/gallery/search/top/day/.3?q=cats"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:baseURL];
    
    [request setHTTPMethod:@"GET"];
    
    [request addValue:[NSString stringWithFormat:@"Client-ID %@", @"77b0c801d1a25b7"] forHTTPHeaderField:@"Authorization"];
    
    NSURLResponse *response = NULL;
    NSError *error = NULL;
    NSData *theResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSDictionary *dataDictionaryResponse = [NSJSONSerialization JSONObjectWithData:theResponseData options:0 error:&error];
    NSLog(@"url to send request= %@",baseURL);
    NSLog(@"%@",dataDictionaryResponse);
    
//    NSURL *getUrl = [NSURL URLWithString: baseURL];
//    
//    NSURLSessionDataTask *dataTask = [self.session dataTaskWithURL:request.URL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//        
//         if(!error){
//             NSLog(@"%@",response);
//             NSDictionary *responseData = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error: &error];
//             //self.dsid = responseData[@"dsid"];
//             //NSLog(@"New dataset id is %@",self.dsid);
//             for(NSString *key in responseData) {
//                 NSLog(@"%@",[responseData objectForKey:key]);
//             }
//                                                         
//             //ispatch_async(dispatch_get_main_queue(), ^{self.dsidLabel.text = [NSString stringWithFormat:@"DSID: %ld",(long)[self.dsid integerValue]];);
//            }
//          
//         else{
//             NSLog(@"%@",error);
//            }
//        }
//    ];
//    [dataTask resume];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
