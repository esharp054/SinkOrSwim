//
//  TableViewController.m
//  SinkOrSwim
//
//  Created by Elena Sharp on 9/6/17.
//  Copyright © 2017 Elena Sharp. All rights reserved.
//

#import "TableViewController.h"
#import "ImageModel.h"
#import "ViewController.h"
#import "GIFViewController.h"

@interface TableViewController ()

@property(strong, nonatomic) ImageModel* myImageModel;

@end

@implementation TableViewController

-(ImageModel*) myImageModel{
    
    if(!_myImageModel){
        _myImageModel = [ImageModel sharedInstance];
    }
    return _myImageModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.segmentedControl setTitle:@"All" forSegmentAtIndex:0];
    [self.segmentedControl setTitle:@"Albums" forSegmentAtIndex:1];
    [self.segmentedControl setTitle:@"Images" forSegmentAtIndex:2];
    [self.segmentedControl setTitle:@"Animated" forSegmentAtIndex:3];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section
    if(section == 0){
        return self.myImageModel.imageNames.count;
    }
    else if(section == 1){
        return 1;
    }
    else {
        return 1;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    if(indexPath.section == 0){
        cell = [tableView dequeueReusableCellWithIdentifier:@"ImageNameCell" forIndexPath:indexPath];
    
        // Configure the cell...
        cell.textLabel.text = self.myImageModel.imageNames[indexPath.row];
        cell.detailTextLabel.text = @"More";
    }
    else if(indexPath.section == 1){
        cell = [tableView dequeueReusableCellWithIdentifier:@"AnimatedImageCell" forIndexPath:indexPath];
        
        // Configure the cell...
        cell.textLabel.text = @"GIF";
        cell.detailTextLabel.text = @"More";
    }
    else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"CollectionCell" forIndexPath:indexPath];
        
        // Configure the cell...
        cell.textLabel.text = @"Collection";
    }
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    BOOL isVC = [[segue destinationViewController] isKindOfClass:[ViewController class]];
    
    if(isVC){
        UITableViewCell* cell = (UITableViewCell*) sender;
        ViewController* vc = [segue destinationViewController];
    
        vc.imageName = cell.textLabel.text;
    }
    
//    BOOL isGVC = [[segue destinationViewController] isKindOfClass:[GIFViewController class]];
//    
//    if(isGVC){
//        UITableViewCell* cell = (UITableViewCell*) sender;
//        GIFViewController* gvc = [segue destinationViewController];
//    }
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
