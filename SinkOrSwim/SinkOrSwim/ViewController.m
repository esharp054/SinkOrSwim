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
    
    
    NSURL *baseURL = [NSURL URLWithString:@"https://api.imgur.com/3/gallery/search/top/year/.3?q=cat+memes"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:baseURL];
    
    [request setHTTPMethod:@"GET"];
    
    [request addValue:[NSString stringWithFormat:@"Client-ID %@", @"77b0c801d1a25b7"] forHTTPHeaderField:@"Authorization"];
 
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
         if(!error){
             NSLog(@"%@",response);
             NSDictionary *responseData = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error: &error];
             for(NSString *key in responseData) {
                 NSLog(@"%@",[responseData objectForKey:key]);
             }
            }
          
         else{
             NSLog(@"%@",error);
            }
        }
    ];
    [dataTask resume];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
