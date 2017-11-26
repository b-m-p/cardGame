//
//  Card.h
//  cardGame
//
//  Created by Brandi Phillips on 11/6/17.
//  Copyright © 2017 Brandi Phillips. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

// methods and class variables (properties) get declared in the header file
@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

-(int)match:(NSArray *)otherCards;  // declare a public method (public because in header file) called match: that takes one argument which is a pointer to a Card - otherCards is an array of Cards.  


@end
