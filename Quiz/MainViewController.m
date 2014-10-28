//
//  ViewController.m
//  Quiz
//
//  Created by Daniel Brennan on 28/10/2014.
//  Copyright (c) 2014 Daniel Brennan. All rights reserved.
//

#import "MainViewController.h"
#import "QuestionViewController.h"

@interface MainViewController ()
{
    NSString *category;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)generalPressed:(id)sender {
    
    category = @"generalQuiz";
    
}

- (IBAction)fergiePressed:(id)sender {
   
    category = @"fergieYears";
    
}

- (IBAction)cupsPressed:(id)sender {
    
    category = @"theCups";

}

- (IBAction)leaguePressed:(id)sender {
    
    category = @"theLeague";

}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
    QuestionViewController *questionViewController = (QuestionViewController *)navController.topViewController;
    questionViewController.category = category;
    
    
}

@end
