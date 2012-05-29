//
//  ViewController.m
//  DrawingApp
//
//  Created by Alexander Ikonomidis on 5/27/12.
//  Copyright (c) 2012 Gariko Softworks. All rights reserved.
//

#import "ViewController.h"
#import "DrawingView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet DrawingView *drawingView;
@property NSTimer *timer;

@end

@implementation ViewController
@synthesize drawingView;
@synthesize timer;

- (void)viewDidLoad
{
    [super viewDidLoad];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.025 target:self selector:@selector(timestep) userInfo:nil repeats:YES];
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

// Alex: Changed to use setCenter
- (IBAction)singleTapDrawingView:(id)sender { // Alex: I like the thing to the left showing linkage
    NSLog(@"single tap"); // Alex: Thank god you figured out how to debug :D
    
    CGPoint tapPoint = [sender locationInView: drawingView];
    [self.drawingView.square setCenter: tapPoint];
    [drawingView setNeedsDisplay];
}

// Alex: Doesn't spam at lightning speed anymore :D
- (IBAction)panDrawingView:(id)sender {
    NSLog(@"pan");
    CGPoint translation = [sender translationInView: drawingView];
    CGPoint velocity = [sender velocityInView: drawingView];
    
    [self.drawingView.square translate: translation];
    [self.drawingView.square setVel: velocity withDamper: 0.025];
    
    [drawingView setNeedsDisplay];
}

-(void)timestep {
    [drawingView.square move];
    
    if (![drawingView.square doCollision:[[UIScreen mainScreen] bounds]]) {
        [drawingView.square accelerate];
    }
    [drawingView setNeedsDisplay];
}

@end
