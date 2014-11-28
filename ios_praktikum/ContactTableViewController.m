//
//  TableViewController.m
//  ios_praktikum
//
//  Created by Felix Jensen on 26.11.14.
//  Copyright (c) 2014 Felix Jensen. All rights reserved.
//

#import "ContactTableViewController.h"
#import "ContactTableViewCell.h"
#import "ContactManager.h"
#import "SaveContactViewController.h"

@interface ContactTableViewController ()

@property (strong, nonatomic) ContactManager *contactManager;
@end

@implementation ContactTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *addContactButton = [[UIBarButtonItem alloc]initWithTitle:@"Add Contact" style:UIBarButtonItemStylePlain target:self action:@selector(addContact:)];
    // assign to the toolbar
    self.toolbarItems = [[NSArray alloc]initWithObjects:addContactButton, nil];
    // show toolbar
    self.navigationController.toolbarHidden = NO;
    
    _contactManager = [[ContactManager alloc]init];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(IBAction)addContact:(id)sender {
    [self performSegueWithIdentifier:@"addContact" sender:self];
}

-(void)saveContact:(NSString *)firstname withLastname:(NSString *)lastname andMail:(NSString *)mail
{
    [_contactManager addContact:firstname withLastname:lastname andMail:mail];
}

-(void)changeContact:(Contact *)contact
{
    [_contactManager changeContact:contact];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [_contactManager size];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ContactTableViewCell *cell = (ContactTableViewCell*) [tableView dequeueReusableCellWithIdentifier:@"Contact Cell" forIndexPath:indexPath];
    
    Contact *contact = [_contactManager getContact:indexPath.row];
    
    cell.firstnameLabel.text = contact.firstname;
    cell.lastnameLabel.text = contact.lastname;
    
    return cell;
}

-(void) tableView:(UITableView*) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"addContact" sender:self];
    
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

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    SaveContactViewController *controller = (SaveContactViewController*)[segue destinationViewController];
    
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    if (path.length > 0)
    {
        controller.contact = [_contactManager getContact:path.row];
    }
    
    controller.delegate = self;
}


@end
