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
@property float height;
@property float width;

-(Square*)initWithPos: (float) x yPos: (float) y;

// Basic physics simulation methods, or something of that nature?
-(void)move;
-(void)accelerate;
-(BOOL)checkCollision: (CGRect) bounds;

-(void)draw: (CGContextRef) context;
-(void)setPos: (CGPoint) point;
-(void)setVel: (CGPoint) velocity;
-(void)resetVel;


@end
