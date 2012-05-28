//
//  ViewController.m
//  DrawingApp
//
//  Created by Alexander Ikonomidis on 5/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "DrawingView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet DrawingView *drawingView;

@end

@implementation ViewController
@synthesize drawingView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setDrawingView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)singleTapDrawingView:(id)sender {
    NSLog(@"AW YEAH TAP DAT VIEW");
    
    CGPoint tapPoint = [sender locationInView: drawingView];
    [self.drawingView.square setPos: tapPoint.x newYPos: tapPoint.y];
    [drawingView setNeedsDisplay];
}

@end
