//
//  CardMatchingGame.h
//  cardGame
//
//  Created by Brandi Phillips on 11/12/17.
//  Copyright © 2017 Brandi Phillips. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CardMatchingGame : NSObject
// designated initializer:
- (instancetype)initWithCardCount: (NSUInteger)count
                        usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly)NSInteger score;

@end
