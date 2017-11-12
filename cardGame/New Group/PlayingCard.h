//
//  PlayingCard.h
//  cardGame
//
//  Created by Brandi Phillips on 11/6/17.
//  Copyright © 2017 Brandi Phillips. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

//making the class method public by placing it in the header file:
+(NSArray *)validSuits;

+(NSUInteger)maxRank;

@end
