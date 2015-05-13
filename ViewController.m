//
//  ViewController.m
//  Hello_Polly
//
//  Created by Maclab03 on 5/12/15.
//  Copyright (c) 2015 LiptakLask. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize stepperOutlet,infoLabel;

//variables
NSString *label;
NSString *title;
int i;
double deg;
double rad;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //onLoad default
    i = 5;
    [self setString:i];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)stepperAction:(id)sender {
    
    i = stepperOutlet.value;
    [self setString:i];

}//endStepperAction

-(void)setString:(int)i{
    deg = (180 *(i-2)/i);
    rad = (deg * M_PI/180);
    [self setShape:i];

    //create string; append to label
    label = [NSString stringWithFormat: @"Shape: %@\t      Sides: %i\nDegrees: %.02f\nRadians: %.06f", title, i, deg, rad];
    infoLabel.Text = label;
    
}//endSetString

-(void)setShape:(int)i{
    switch (i) {
        case 3:
            title = @"Triangle";
            break;
        case 4:
            title = @"Quadrilateral";
            break;
        case 5:
            title = @"Pentagon";
            break;
        case 6:
            title = @"Hexagon";
            break;
        case 7:
            title = @"Heptagon";
            break;
        case 8:
            title = @"Octagon";
            break;
        case 9:
            title = @"Nonagon";
            break;
        case 10:
            title = @"Decagon";
            break;
        case 11:
            title = @"Hendecagon";
            break;
        case 12:
            title = @"Dodecagon";
            break;
        default:
            break;
    }//endSwitch
    
}//endSetShape

@end
