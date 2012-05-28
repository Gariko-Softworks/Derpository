//
//  Square.h
//  DrawingApp
//
//  Created by Tiernan Garsys on 5/27/12.
//  Copyright (c) 2012 University of Pennsylvania. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Square : NSObject

@property int xPos;
@property int yPos;

-(Square*)initWithPos: (int) x yPos: (int) y;

@end
