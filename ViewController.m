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
@import UIKit;

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
    label = [NSString stringWithFormat: @"%@\tSides: %i\nDegrees: %.02f\nRadians: %.06f", title, i, deg, rad];
    infoLabel.Text = label;
    
    CGFloat lineWidth    = 5.0;
    UIBezierPath *path   = [self roundedPolygonPathWithRect:self.imageView.bounds
                                                  lineWidth:lineWidth
                                                      sides:i
                                               cornerRadius:0.0];
    
    CAShapeLayer *mask   = [CAShapeLayer layer];
    mask.path            = path.CGPath;
    mask.lineWidth       = lineWidth;
    mask.strokeColor     = [UIColor clearColor].CGColor;
    mask.fillColor       = [UIColor whiteColor].CGColor;
    self.imageView.layer.mask = mask;
    
    CAShapeLayer *border = [CAShapeLayer layer];
    border.path          = path.CGPath;
    border.lineWidth     = lineWidth;
    border.strokeColor   = [UIColor blackColor].CGColor;
    border.fillColor     = [UIColor blackColor].CGColor;
    [self.imageView.layer addSublayer:border];
    
    
    

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

//Test method; create shape

- (UIBezierPath *)roundedPolygonPathWithRect:(CGRect)square
                                   lineWidth:(CGFloat)lineWidth
                                       sides:(NSInteger)sides
                                cornerRadius:(CGFloat)cornerRadius
{
    UIBezierPath *path  = [UIBezierPath bezierPath];
    
    CGFloat theta       = 2.0 * M_PI / sides;                           // how much to turn at every corner
    CGFloat offset      = cornerRadius * tanf(theta / 2.0);             // offset from which to start rounding corners
    CGFloat squareWidth = MIN(square.size.width, square.size.height);   // width of the square
    
    // calculate the length of the sides of the polygon
    
    CGFloat length      = squareWidth - lineWidth;
    if (sides % 4 != 0) {                                               // if not dealing with polygon which will be square with all sides ...
        length = length * cosf(theta / 2.0) + offset/2.0;               // ... offset it inside a circle inside the square
    }
    CGFloat sideLength = length * tanf(theta / 2.0);
    
    // start drawing at `point` in lower right corner
    
    CGPoint point = CGPointMake(squareWidth / 2.0 + sideLength / 2.0 - offset, squareWidth - (squareWidth - length) / 2.0);
    CGFloat angle = M_PI;
    [path moveToPoint:point];
    
    // draw the sides and rounded corners of the polygon
    
    for (NSInteger side = 0; side < sides; side++) {
        point = CGPointMake(point.x + (sideLength - offset * 2.0) * cosf(angle), point.y + (sideLength - offset * 2.0) * sinf(angle));
        [path addLineToPoint:point];
        
        CGPoint center = CGPointMake(point.x + cornerRadius * cosf(angle + M_PI_2), point.y + cornerRadius * sinf(angle + M_PI_2));
        [path addArcWithCenter:center radius:cornerRadius startAngle:angle - M_PI_2 endAngle:angle + theta - M_PI_2 clockwise:YES];
        
        point = path.currentPoint; // we don't have to calculate where the arc ended ... UIBezierPath did that for us
        angle += theta;
    }
    
    [path closePath];
    
    return path;
}

@end
