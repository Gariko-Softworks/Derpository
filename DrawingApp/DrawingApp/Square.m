//
//  Square.m
//  DrawingApp
//
//  Created by Tiernan Garsys on 5/27/12.
//  Copyright (c) 2012 Gariko Softworks. All rights reserved.
//

#import "Square.h"

/* Tiernan: Since the height and width are hard-coded, I went ahead and moved them up 
 * to be class-constant.
 */
float GRAVITY = 0.5;
int WIDTH = 80;
int HEIGHT = 80;

@implementation Square

@synthesize xPos;
@synthesize yPos;
@synthesize xVel;
@synthesize yVel;

-(Square*) initWithPos: (float) x yPos: (float) y {
    
    self = [super init];
    
    xPos = x;
    yPos = y;
    
    // Tiernan: Yes, these are hard-coded; look at all the fucks I give for this test app :D
    // Alex: Cleaned a bit using the internal helper method :P
    [self setVel:CGPointMake(3, 3)];

    return self;
}

-(void) setPos: (CGPoint) point {
    xPos = point.x;
    yPos = point.y;
    [self resetVel];
}

// Alex: Provided for logical convenience
-(void) setCenter:(CGPoint)point{
    [self setPos:CGPointMake(point.x-(WIDTH/2), point.y-(HEIGHT/2))];
}

/* Alex: Why are all the values coming in so massive? It's like
 * the simulator is running a retina display on a 3GS D:
 * Tiernan: Changed to maintain consistency with setVel method; pesky damper won't always be 0.025
   Also, NO FUCKING CLUE; WHAT THE FUCK APPLE. Logical coordinates ain't so logical...
 */
-(void) translate:(CGPoint)translation withDamper: (float) damper{
    xPos = xPos + translation.x * damper;
    yPos = yPos + translation.y * damper;
    [self resetVel];
}

//Alex: Convenience method for legacy and shit. Damper is implied to be 1.0.
-(void) setVel: (CGPoint) velocity{
    [self setVel:velocity withDamper:1.0];
}

// Alex: The parameter value of damper should range from 0.0 (0%) to 1.0 (100%).
-(void) setVel: (CGPoint) velocity withDamper: (float) damper {
    xVel = velocity.x * damper;
    yVel = velocity.y * damper;
}

// Alex: changed to use setVel
-(void) resetVel {
    [self setVel:CGPointMake(0, 0)];
}

// Tiernan: Shuffled around to group similar statements, for readability and shit
-(void) draw: (CGContextRef) context {
    
    CGRect rectangle = CGRectMake(self.xPos, self.yPos, WIDTH, HEIGHT);
    CGContextAddRect(context, rectangle);
    
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);
    CGContextSetLineWidth(context, 2.0);
    
    CGContextStrokePath(context);
    CGContextFillRect(context, rectangle);
    
}

/* Tiernan: Defined gravity as a class constant, and used it here; will make life easier
 * if we ever want to change gravity, or want to use consistent grav values elsewhere.
 */
-(void) accelerate {
    yVel += GRAVITY;
}

/* Tiernan: Wanna go to bed? Wanna just get shit to work? FUCK GOOD CODING PRACTICE. 
 * There is some odd bug that I was playing with when I had to go to bed.
 */
// Alex: Cleaned it up a bit logically
/* Tiernan: Cleaned up to be slightly less redundant; my if-else structure here initially
 * caused the bug wherein the box would bounce higher with each successive bounce, but 
 * whatever changes you made appear to have re-caused that bug, so I went ahead with the
 * cleaner styling and skipping of unneccesary computation when no collision occurs. 
 * (Skipping bounds checks if the bouncy one is fully inbounds) (Yes, computationally 
 * trivial, but look at all the fucks I give).
 */
-(BOOL) doCollision: (CGRect) bounds {
    
     if (CGRectContainsRect(bounds, CGRectMake(xPos, yPos, WIDTH, HEIGHT))) {
         return false;
     } else {

         if (xPos < CGRectGetMinX(bounds)) {
             xVel = -xVel;
             xPos = CGRectGetMinX(bounds);
         } else if ((xPos + WIDTH) > CGRectGetMaxX(bounds)) {
             xVel = -xVel;
             xPos = CGRectGetMaxX(bounds) - WIDTH;
         }
    
         if (yPos < CGRectGetMinY(bounds)) {
             yVel = -yVel;
             yPos = CGRectGetMinY(bounds);
         } else if ((yPos + HEIGHT) > CGRectGetMaxY(bounds)) {
             yVel = -yVel;
             yPos = CGRectGetMaxY(bounds) - HEIGHT;
         }
    
         return true;
     }
}

-(void) move {
    xPos += xVel;
    yPos += yVel;
}

@end
