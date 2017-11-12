//
//  Card.m
//  cardGame
//
//  Created by Brandi Phillips on 11/6/17.
//  Copyright © 2017 Brandi Phillips. All rights reserved.
//

#import "Card.h"

// private declarations can go here:
@interface Card()

@end

@implementation Card

-(int)match:(NSArray *)otherCards {
    int score = 0;
    for (Card *card in otherCards){
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }

    return score;
}
@end
