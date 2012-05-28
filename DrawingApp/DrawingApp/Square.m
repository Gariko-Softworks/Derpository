//
//  Square.m
//  DrawingApp
//
//  Created by Tiernan Garsys on 5/27/12.
//  Copyright (c) 2012 University of Pennsylvania. All rights reserved.
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
    
    // Yes, these are hard-coded; look at all the fucks I give for this test app :D
    xVel = 3;
    yVel = 3;
    width = 80;
    height = 80;
    
    return self;
}

-(void) setPos: (CGPoint) point {
    xPos = point.x;
    yPos = point.y;
   [self resetVel];
}

-(void) setVel: (CGPoint) point {
    xVel = point.x * 0.025;
    yVel = point.y * 0.025;
}

-(void) resetVel {
    xVel = 3;
    yVel = 0;
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

// Wanna go to bed? Wanna just get shit to work? FUCK GOOD CODING PRACTICE. 
// There is some odd bug that I was playing with when I had to go to bed.
-(BOOL) checkCollision: (CGRect) bounds {
    
    /*
    if (CGRectContainsRect(bounds, CGRectMake(xPos, yPos, width, height))) {
        NSLog(@"Collision Detection Worked Properly");
        return false;
    } else {
    */
    
        if (xPos < CGRectGetMinX(bounds) && xVel < 0) {
            xVel = -xVel;
            xPos = CGRectGetMinX(bounds);
            return true;
        }
        
        if ((xPos + width) > CGRectGetMaxX(bounds) && xVel >= 0) {
            xVel = -xVel;
            xPos = CGRectGetMaxX(bounds) - width;
            return true;
        }
    
        if (yPos < CGRectGetMinY(bounds) && yVel < 0) {
            yVel = -yVel;
            yPos = CGRectGetMinY(bounds);
            return true;
        }
        
        if ((yPos + height) > CGRectGetMaxY(bounds) && yVel >= 0) {
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
