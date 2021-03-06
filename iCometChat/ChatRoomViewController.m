//
//  ChatRoomViewController.m
//  iCometChat
//
//  Created by Yongseok Kang on 4/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ChatRoomViewController.h"
#import "ChatRoom.h"

@implementation ChatRoomViewController
@synthesize room;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView {
    NSLog(@"add loadView");
    UITableView *table = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
	table.autoresizingMask = (UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight);
	table.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
	table.delegate = self;
	table.dataSource = self;	
	table.sectionIndexMinimumDisplayRowCount=10;
    self.tableView = table;
	[table release];
    
    self.room = [ChatRoom room];
}

- (void)dealloc
{
    [room release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    NSLog(@"before super didReceiveMemoryWarnig");
    NSLog(@"%@", self.view);
    [super didReceiveMemoryWarning];
    NSLog(@"after super didReceiveMemoryWarning");
    NSLog(@"%@", self.view);
    self.room = nil;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    NSLog(@"before super viewDidLoad");
    NSLog(@"%@", self.view);
    [super viewDidLoad];
    NSLog(@"after super viewDidLoad");
    NSLog(@"%@", self.view);
    [room bind:^{
        [self.tableView reloadData];
        [self.tableView scrollToRowAtIndexPath:[room indexPathAtLast] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }];
}

- (void)viewDidUnload
{
    NSLog(@"before super viewDidUnLoad");
    NSLog(@"%@", self.view);
    [super viewDidUnload];
    NSLog(@"before super viewDidUnLoad");
    NSLog(@"%@", self.view);
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [room countMessages];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    cell.textLabel.text = [room message:indexPath.row];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

@end
