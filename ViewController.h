//
//  ViewController.h
//  Hello_Polly
//
//  Created by Maclab03 on 5/12/15.
//  Copyright (c) 2015 LiptakLask. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIStepper *stepperOutlet;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
- (IBAction)stepperAction:(id)sender;


@end
