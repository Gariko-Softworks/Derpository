//
//  Square.m
//  DrawingApp
//
//  Created by Tiernan Garsys on 5/27/12.
//  Copyright (c) 2012 Gariko Softworks. All rights reserved.
//

#import "Square.h"

@implementation Square

@synthesize xPos;
@synthesize yPos;
@synthesize xVel;
@synthesize yVel;
@synthesize width;
@synthesize height;

-(Square*) initWithPos: (float) x yPos: (float) y {
    
    self = [super init];
    
    xPos = x;
    yPos = y;
    
    // Tiernan: Yes, these are hard-coded; look at all the fucks I give for this test app :D
    // Alex: Cleaned a bit using the internal helper method :P
    [self setVel:CGPointMake(3, 3)];
    
    width = 80;
    height = 80;
    
    return self;
}

-(void) setPos: (CGPoint) point {
    xPos = point.x;
    yPos = point.y;
    [self resetVel];
}

// Alex: Provided for logical convenience
-(void) setCenter:(CGPoint)point{
    [self setPos:CGPointMake(point.x-width/2, point.y-height/2)];
}

/* Alex: Why are all the values coming in so massive? It's like
 * the simulator is running a retina display on a 3GS D:
 */
-(void) translate:(CGPoint)translation{
    xPos = xPos+translation.x*0.025;
    yPos = yPos+translation.y*0.025;
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

-(void) draw: (CGContextRef) context {
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGRect rectangle = CGRectMake(self.xPos, self.yPos, self.width, self.height);
    CGContextAddRect(context, rectangle);
    CGContextStrokePath(context);
    
    CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);
    CGContextFillRect(context, rectangle);
    
}

-(void) accelerate {
    yVel += 0.5;
}

/* Tiernan: Wanna go to bed? Wanna just get shit to work? FUCK GOOD CODING PRACTICE. 
 * There is some odd bug that I was playing with when I had to go to bed.
 */
// Alex: Cleaned it up a bit logically
-(BOOL) doCollision: (CGRect) bounds {
    
    /*
     if (CGRectContainsRect(bounds, CGRectMake(xPos, yPos, width, height))) {
     NSLog(@"Collision Detection Worked Properly");
     return false;
     } else {
     */
    
    /* Alex: Velocity checks are unneded, as the box is guaranteed to
     * be in-bounds if the velocity is correct. If they're there, 
     * and the box somehow ends up out of bounds with no velocity,
     * it'll never be moved back in.
     */
    if (xPos < CGRectGetMinX(bounds)) {
        xVel = -xVel;
        xPos = CGRectGetMinX(bounds);
        return true;
    } else if ((xPos + width) > CGRectGetMaxX(bounds)) {
        xVel = -xVel;
        xPos = CGRectGetMaxX(bounds) - width;
        return true;
    }
    
    if (yPos < CGRectGetMinY(bounds)) {
        yVel = -yVel;
        yPos = CGRectGetMinY(bounds);
        return true;
    } else if ((yPos + height) > CGRectGetMaxY(bounds)) {
        yVel = -yVel;
        yPos = CGRectGetMaxY(bounds) - height;
        return true;
    }
    
    return false;
    //}
}

-(void) move {
    xPos += xVel;
    yPos += yVel;
}

@end
