//
//  Background.m
//  RunningGame-ARC
//
//  Created by Pawis Chairoj on 1/12/56 BE.
//  Copyright 2556 KUSAPP. All rights reserved.
//

#import "Background.h"


@implementation Background

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
        
        cave1 = [CCSprite spriteWithFile:@"cave floor.png"];
        cave1.anchorPoint = ccp(0,0);
        cave1.position = ccp(0,0);
        [self addChild:cave1];
        
        cave2 = [CCSprite spriteWithFile:@"cave floor.png"];
        cave2.anchorPoint = ccp(0,0);
        cave2.position = ccp([cave1 boundingBox].size.width-1,0);
        [self addChild:cave2];
        
        [self schedule:@selector(update:) interval:0.001];
        
    }
	return self;
}

-(void) update:(ccTime)delta {
    cave1.position = ccp(cave1.position.x-5,0);
    cave2.position = ccp(cave2.position.x-5,0);
    
    if(cave1.position.x < - [cave1 boundingBox].size.width) {
        cave1.position = ccp(cave2.position.x + [cave2 boundingBox].size.width - 1,0);
    }
    else if(cave2.position.x < -[cave2 boundingBox].size.width) {
        cave2.position = ccp(cave1.position.x + [cave1 boundingBox].size.width - 1,0);
    }
    
}

@end
