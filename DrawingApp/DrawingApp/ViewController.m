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

@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *panRecognizer;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapRecognizer;


@end

double const damper = 0.025;

@implementation ViewController

@synthesize drawingView;
@synthesize timer;
@synthesize panRecognizer;
@synthesize tapRecognizer;

- (void)viewDidLoad
{
    [super viewDidLoad];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.025 target:self selector:@selector(timestep) userInfo:nil repeats:YES];
}

- (void)viewDidUnload
{
    [self setDrawingView:nil];
    [self setPanRecognizer:nil];
    [self setTapRecognizer:nil];
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
// Tiernan: Made dragging a little friendlier; still not perfect, however.
- (IBAction)panDrawingView:(UIPanGestureRecognizer*)sender {
    CGPoint translation = [sender translationInView: drawingView];
    CGPoint velocity = [sender velocityInView: drawingView];
    
    [self.drawingView.square translate: translation withDamper: damper];
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        [self.drawingView.square setVel: CGPointMake(0, 0) withDamper: damper];
    } else if (sender.state == UIGestureRecognizerStateRecognized) {
        [self.drawingView.square setVel: velocity withDamper: damper];
    }
    
    [drawingView setNeedsDisplay];
}

-(void)timestep { 
    
    // If the user is not touching the screen in any way
    if (panRecognizer.state == UIGestureRecognizerStatePossible && 
        tapRecognizer.state == UIGestureRecognizerStatePossible) {
        
        [drawingView.square move];
    
        if (![drawingView.square doCollision:[[UIScreen mainScreen] bounds]]) {
            [drawingView.square accelerate];
        }
        [drawingView setNeedsDisplay];
    }
}

@end
