//
//  LogListTableViewController.m
//  CMClient
//
//  Created by 凯东源 on 17/2/6.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "LogListTableViewController.h"
#import "LogDetailViewController.h"
#import <LCActionSheet.h>
#import "Tools.h"

@interface LogListTableViewController () {
    
    NSArray *_logArr;
    NSString *_logDirPath;
}

@end

@implementation LogListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    _logDirPath = [NSString stringWithFormat:@"%@/%@", NSHomeDirectory(), @"Documents"];
    NSFileManager * fm = [NSFileManager defaultManager];
    NSError *error;
    _logArr = [fm contentsOfDirectoryAtPath:_logDirPath error:&error];
    
    //给Nav添加右item
    [Tools addNavRightItemTypeMore:self andAction:@selector(rightBtnOnclick)];
    
    NSLog(@"");
}

- (void)rightBtnOnclick {
    LCActionSheet *actionSheet = [LCActionSheet sheetWithTitle:@"Block LCActionSheet" cancelButtonTitle:@"取消" clicked:^(LCActionSheet *actionSheet, NSInteger buttonIndex) {
        NSLog(@"clickedButtonAtIndex: %d", (int)buttonIndex);
    } otherButtonTitles:@"fds", @"fff", nil];
    [actionSheet show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _logArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellID = @"cellid";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = _logArr[indexPath.row];
    
    
    return cell;
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


#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    LogDetailViewController *logVC = [[LogDetailViewController alloc] init];
    logVC.logPath = [NSString stringWithFormat:@"%@/%@", _logDirPath, _logArr[indexPath.row]];
    
    [self.navigationController pushViewController:logVC animated:YES];
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
