//
//  Square.h
//  DrawingApp
//
//  Created by Tiernan Garsys on 5/27/12.
//  Copyright (c) 2012 University of Pennsylvania. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Square : NSObject

@property float xPos;
@property float yPos;
@property float xVel;
@property float yVel;

-(Square*)initWithPos: (float) x yPos: (float) y;

-(void)move;
-(void)draw: (CGContextRef) context;
-(void)setPos: (float) x newYPos: (float) y;

@end
