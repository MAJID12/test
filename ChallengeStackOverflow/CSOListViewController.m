//
//  CSOListViewController.m
//  ChallengeStackOverflow
//
//  Created by CHAIBI  on 27/02/2016.
//  Copyright (c) 2016 CHAIBI . All rights reserved.
//

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Imports

#import "CSOListViewController.h"

//Services
#import "CSService.h"

//model
#import "StackOverflowUser.h"

//views
#import "CustomCellView.h"

#pragma mark - Types

#pragma mark - Defines & Constants

#pragma mark - Macros

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private Interface

@interface CSOListViewController ()

#pragma mark - Outlets

#pragma mark - Private Properties
@property (strong, nonatomic)IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *usersList;
@end

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Implementation

@implementation CSOListViewController

#pragma mark - Setup & Teardown

-(void)commonInitCSOListViewController
{
    // Your common initialization code here
}

-(id)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        [self commonInitCSOListViewController];
    }
    return self;
}

-(id)initWithCoder:(NSCoder*)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self commonInitCSOListViewController];
    }
    return self;
}

#pragma mark - Superclass Overrides

-(void)viewDidLoad
{
    [super viewDidLoad];

       [self.tableView registerNib:[UINib nibWithNibName:@"CustomCellView" bundle:nil] forCellReuseIdentifier:@"CustomCellView"];
    
    //Fetch First Stackoverflow Data Page
    [CSService fetchFirstPageDataWithSuccesCompletion:^(NSArray *users) {
        self.usersList = users;
        [self.tableView reloadData];
        
        NSLog(@"Users %@",users);
    } failureCompltion:^(NSError *error) {
        [UIAlertController alertControllerWithTitle:@"Error"
                                            message:@"Erreur de récupération des données"
                                     preferredStyle:UIAlertControllerStyleAlert];
    }];
}

-(void)viewDidUnload
{
	// Release any retained subviews of the main view.
    
    [super viewDidUnload];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Perform custom tasks associated with displaying the view
}

-(void)viewDidDisappear:(BOOL)animated
{
    // Perform additional tasks associated with dismissing or hiding the view
    
    [super viewDidDisappear:animated];
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

#pragma mark - Public methods

#pragma mark - Private methods

#pragma mark - Actions

#pragma mark - XXXDataSource / XXXDelegate methods


#pragma mark - UITableViewDataSource / UITableViewDelegate methods
- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80.0;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return self.usersList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomCellView *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCellView" forIndexPath:indexPath];
    StackOverflowUser *user = [self.usersList objectAtIndex:indexPath.row];

    NSLog(@"%@ %@",user,user.lastUserName);
    [cell setupWithTitle:user.lastUserName imageUrl:user.gravatarUrl];
    
    return cell;
}
@end
