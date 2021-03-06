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
#import "ScrollViewController.h"
#import "GIFViewController.h"
#import "CollectionViewController.h"

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
- (IBAction)segButtonTapped:(id)sender {
    
    [self.tableView reloadData];
    
}

- (IBAction)segBtnTapped:(id)sender {
    
    [self.tableView reloadData];
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

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section
    if(section == 0){
        if([self.segmentedControl selectedSegmentIndex] == 0 || [self.segmentedControl selectedSegmentIndex] == 2){
        return self.myImageModel.numImagesDisplayed;
        }
        else {
            return 0;
        }
    }
    else if(section == 1){
        if([self.segmentedControl selectedSegmentIndex] == 0 || [self.segmentedControl selectedSegmentIndex] == 3){
            return self.myImageModel.GIFLinks.count;
        }
        else {
            return 0;
        }
    }
    else {
        if([self.segmentedControl selectedSegmentIndex] == 0 || [self.segmentedControl selectedSegmentIndex] == 1){
            return 5;
//            return 2;
        }
        else {
            return 0;
        }
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    if(indexPath.section == 0){
        cell = [tableView dequeueReusableCellWithIdentifier:@"ImageNameCell" forIndexPath:indexPath];
    
        // Configure the cell...
//        cell.textLabel.text = self.myImageModel.imageNames[indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"Kitty Meme #%ld", indexPath.row + 1];
        cell.detailTextLabel.text = @"More";
    }
    else if(indexPath.section == 1){
        cell = [tableView dequeueReusableCellWithIdentifier:@"AnimatedImageCell" forIndexPath:indexPath];
        
        // Configure the cell...
//        cell.textLabel.text = self.myImageModel.GIFLinks[indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"Cat GIF #%ld", indexPath.row + 1];
        cell.detailTextLabel.text = @"More";
    }
    else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"CollectionCell" forIndexPath:indexPath];
        
        // Configure the cell...
//        cell.textLabel.text = @"Albums";
        
        cell.textLabel.text = [NSString stringWithFormat:@"Cat Album #%ld", indexPath.row + 1];
    }
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    BOOL isVC = [[segue destinationViewController] isKindOfClass:[ScrollViewController class]];
    
    
    if(isVC){
        UITableViewCell* cell = (UITableViewCell*)sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        ScrollViewController *vc = [segue destinationViewController];
        
        vc.imageIndex = indexPath.row;
    }
    
    BOOL isGVC = [[segue destinationViewController] isKindOfClass:[GIFViewController class]];
    
    if(isGVC){
        UITableViewCell* cell = (UITableViewCell*) sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        GIFViewController* gvc = [segue destinationViewController];
        gvc.imageIndex = indexPath.row;
    }
    
    BOOL isCVC = [[segue destinationViewController] isKindOfClass:[CollectionViewController class]];
    
    if(isCVC){
        UITableViewCell* cell = (UITableViewCell*) sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        CollectionViewController* cvc = [segue destinationViewController];
        cvc.imageIndex = indexPath.row;
    }
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
