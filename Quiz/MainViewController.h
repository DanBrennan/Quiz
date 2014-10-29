//
//  MainViewController.h
//  Quiz
//
//  Created by Daniel Brennan on 28/10/2014.
//  Copyright (c) 2014 Daniel Brennan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface MainViewController : UIViewController<ADBannerViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *generalQuizButton;
@property (weak, nonatomic) IBOutlet UIButton *fergieYearsButton;
@property (weak, nonatomic) IBOutlet UIButton *theCupsButton;
@property (weak, nonatomic) IBOutlet UIButton *theLeagueButton;
@end

