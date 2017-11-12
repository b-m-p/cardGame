//
//  Deck.h
//  cardGame
//
//  Created by Brandi Phillips on 11/6/17.
//  Copyright © 2017 Brandi Phillips. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void)addCard:(Card *)card atTop:(BOOL)atTop;
-(void)addCard:(Card *)card;

-(Card *)drawRandomCard;

@end
