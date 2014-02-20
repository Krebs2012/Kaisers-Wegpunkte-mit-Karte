//
//  KaisersWegpunkt.h
//  Aufgabe 4
//
//  Created by Master-Student on 27.11.13.
//  Copyright (c) 2013 Master-Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface KaisersWegpunkt : NSObject <MKAnnotation>

- (id) initWidthCoordinate:(CLLocationCoordinate2D) coord title: (NSString *) tit;

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, weak) NSString *title;

@end
