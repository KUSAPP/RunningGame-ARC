//
//  Player.h
//  RunningGame-ARC
//
//  Created by Pawis Chairoj on 1/12/56 BE.
//  Copyright 2556 KUSAPP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Player : CCLayer {
    CCSprite *_player;
    CCAction *_moveAction;
}

@property(nonatomic, retain) CCSprite *player;
@property(nonatomic, retain) CCAction *moveAction;

@end
