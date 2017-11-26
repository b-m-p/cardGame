//
//  CardMatchingGame.h
//  cardGame
//
//  Created by Brandi Phillips on 11/12/17.
//  Copyright © 2017 Brandi Phillips. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject
// designated game initializer will start the game with the number of cards and a deck from which the cards will be drawn from:
- (instancetype)initWithCardCount: (NSUInteger)count
                        usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;
// need to be able to get a card so that it can be displayed/used:
- (Card *)cardAtIndex:(NSUInteger)index;
// the game keeps the score so publically needs to be read only:
@property (nonatomic, readonly)NSInteger score;

@end
