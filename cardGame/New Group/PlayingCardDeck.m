//
//  PlayingCardDeck.m
//  cardGame
//
//  Created by Brandi Phillips on 11/7/17.
//  Copyright © 2017 Brandi Phillips. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

//overriding the init method which is inherited from NSObject through Deck class:
-(instancetype)init {
    //check to see if super class can initialize itself, if not retun nil:
    self = [super init];
    if(self){
        for (NSString *suit in [PlayingCard validSuits]){
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++){
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
    }
    return self;
}

@end
