//
//  Deck.m
//  cardGame
//
//  Created by Brandi Phillips on 11/6/17.
//  Copyright © 2017 Brandi Phillips. All rights reserved.
//

#import "Deck.h"
@interface Deck ()
// declare properties here when it is not desired for them to be public, here the deck can have an internal storage for its cards:
@property (strong, nonatomic) NSMutableArray *cards; // declaring the property makes space in the instance for the pointer itself, but doesn't allocate space in the heap for the object the pointer points to.
@end


@implementation Deck

// allocation happens in the getter, ("lazy instantiation") if the pointer is nil, initialize the object:
-(NSMutableArray *)cards {
    if (!_cards)_cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(void)addCard:(Card *)card atTop:(BOOL)atTop {
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}
// because arguments to methods are never optional, need to write additional methods and then implement the other method inside it:
-(void)addCard:(Card *)card {
    [self addCard:card atTop:NO];
}

-(Card *)drawRandomCard {
    Card *randomCard = nil;
    if ([self.cards count]) {
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    
    return randomCard;
}

@end
