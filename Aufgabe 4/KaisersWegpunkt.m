//
//  KaisersWegpunkt.m
//  Aufgabe 4
//
//  Created by Master-Student on 27.11.13.
//  Copyright (c) 2013 Master-Student. All rights reserved.
//

#import "KaisersWegpunkt.h"

@implementation KaisersWegpunkt

@synthesize coordinate, title;

- (id) initWidthCoordinate:(CLLocationCoordinate2D) coord title:(NSString *)tit
{
    self = [super init];
    if (self) {
        self->coordinate = coord;
        self.title = tit;
    }
    return self;
}

- (id) init
{
    return [self initWidthCoordinate:CLLocationCoordinate2DMake(52.11, 13.33) title:@"Werners Hundersaloon"];
}

@end
