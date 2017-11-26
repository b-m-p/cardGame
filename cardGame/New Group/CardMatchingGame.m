//
//  CardMatchingGame.m
//  cardGame
//
//  Created by Brandi Phillips on 11/12/17.
//  Copyright © 2017 Brandi Phillips. All rights reserved.
//

#import "CardMatchingGame.h"
#import "Card.h"
#import "Deck.h"

//Class Extension is where private properties live
@interface CardMatchingGame()
// in our implementation we need to be able to set the score so the property is redeclared privately to be readwrite:
@property (nonatomic, readwrite) NSInteger score;
// privately, the game needs to keep track of cards of type Card
@property (nonatomic, strong) NSMutableArray *cards;
@end

@implementation CardMatchingGame

//lazy instantiation:
- (NSMutableArray *)cards {
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

//initialing the game:
// let the super class have a chance to initialize itself and check for failure
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(id)deck{
    // must always call superclass's designated initializer from the our designated initializer:
    self = [super  init]; // super's designated initializer
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
              [self.cards addObject:card];
            } else {
                // protecting against nil being passed into an array:
                self = nil;
                break;
            }
        }
    }
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index {
    //check to make sure the index argument is not out of the bounds of the array:
    return (index<[self.cards count]) ? self.cards[index] : nil;
}

#define MISMATCH_PENALTY 2;
#define MATCH_BONUS 4;
#define COST_TO_CHOOSE 1;

// primary logic of the game class:
- (void)chooseCardAtIndex:(NSUInteger)index {
    Card *card = [self cardAtIndex:index];
    // only want unmatched cards to be available for chosing
    if (!card.isMatched) {
        if (card.isChosen) {
         card.chosen = NO;
        }else {
        // match against other chosen cards searching for the cards marked as chosen and unmatched -- how would this work if matching against more than one card?
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        otherCard.matched = YES;
                        card.matched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO; // how would this look if matching more than one card?
                    }
                    break; // at this point we are only matching two cards
                }
            }
        self.score -= COST_TO_CHOOSE;
        card.chosen = YES;
        }
    }
}

@end
