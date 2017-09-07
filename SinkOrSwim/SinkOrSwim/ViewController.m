//
//  ViewController.m
//  SinkOrSwim
//
//  Created by Elena Sharp on 9/4/17.
//  Copyright © 2017 Elena Sharp. All rights reserved.
//

#import "ViewController.h"
#import "ImageModel.h"

@interface ViewController () <NSURLSessionTaskDelegate>
@property (weak, nonatomic) IBOutlet UIButton *viewMain;
@property (strong, nonatomic) NSURLSession *session;
@property (strong, nonatomic) NSArray *data;
@property (strong, nonatomic) NSMutableDictionary *albums;


//client ID: 77b0c801d1a25b7
//client secret: 997e2ccfb98ba9a02baebc9abdfd8f55de86c4b8

@property (strong,nonatomic) ImageModel* myImageModel;
@property (strong, nonatomic) UIImageView* imageView;
//@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController
@synthesize data = _data;
@synthesize myImageModel = _myImageModel;

-(NSArray*) data {

    if(!_data){
        _data = @[];
    }

    return _data;
}

-(void) setData:(NSArray *)data {
    _data = data;
}

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

-(UIImageView*)imageView{
    
    if(!_imageView)
        _imageView = [[UIImageView alloc] initWithImage:[[ImageModel sharedInstance] getImageWithIndex:self.imageIndex]];
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
             NSMutableDictionary *responseData = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error: &error];
             for(NSString *key in responseData) {
                 if([key  isEqual: @"data"]){
                     [self setData:[responseData objectForKey:key]];
                 }
             }

            }

         else{
             NSLog(@"%@",error);
            }

        self.myImageModel.albums = [[NSMutableDictionary alloc]init];

        for (id dict in self.data) {
            NSMutableArray*imageLinks = [[NSMutableArray alloc]init];
            NSArray *images = [dict objectForKey:@"images"];

            for(id imgDict in images){
                [imageLinks addObject:[imgDict objectForKey:@"link"]];
            }

            NSString *albumName = [dict objectForKey:@"title"];
            [self.myImageModel.albums setObject:imageLinks forKey:albumName];
            }

        for(NSString *key in self.myImageModel.albums) {
            NSLog(@"%@",[self.myImageModel.albums objectForKey:key]);
            }
        }

    ];
    [dataTask resume];

}

@end
