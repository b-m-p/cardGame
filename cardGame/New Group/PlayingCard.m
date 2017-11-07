//
//  PlayingCard.m
//  cardGame
//
//  Created by Brandi Phillips on 11/6/17.
//  Copyright © 2017 Brandi Phillips. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

-(NSString *)contents {
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

//had to explicitly declare the synthesize because we are overriding both the getter and setter
@synthesize suit = _suit;

+(NSArray *)validSuits {
    return @[@"♥︎", @"♦︎", @"♠︎", @"♣︎"];
}

-(void)setSuit:(NSString *)suit {
    if([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

-(NSString *)suit {
    return _suit ? _suit : @"?";
}
// not including this in the header files makes it private:
+(NSArray *)rankStrings {
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+(NSUInteger)maxRank { return [[self rankStrings] count]-1; }

//here we don't need to explicitly declare the synthesize because only overriding the setter but not the getter??
-(void) setRank: (NSUInteger)rank {
    if (rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
}

@end
