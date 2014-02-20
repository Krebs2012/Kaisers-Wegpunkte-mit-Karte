//
//  ViewController.m
//  Aufgabe 4
//
//  Created by Master-Student on 27.11.13.
//  Copyright (c) 2013 Master-Student. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "KaisersWegpunkt.h"

@interface ViewController ()
@property (nonatomic) MKCoordinateRegion region;
@property (nonatomic, strong) NSArray* wpall;
@end

@implementation ViewController
@synthesize map;
@synthesize distance;


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.map.delegate = self;
    [map setShowsUserLocation:YES];
    
    KaisersWegpunkt * wp1 = [[KaisersWegpunkt alloc] initWidthCoordinate:
                            CLLocationCoordinate2DMake(52.505664, 13.332290) title:@"Internationale Spezialitäten"];
    KaisersWegpunkt * wp2 = [[KaisersWegpunkt alloc] initWidthCoordinate:
                            CLLocationCoordinate2DMake(52.509987, 13.351094) title:@"Essen fassen"];

    KaisersWegpunkt * wp3 = [[KaisersWegpunkt alloc] initWidthCoordinate:
                            CLLocationCoordinate2DMake(52.516285, 13.353258) title:@"Eat Me"];
    KaisersWegpunkt * wp4 = [[KaisersWegpunkt alloc] initWidthCoordinate:
                            CLLocationCoordinate2DMake(52.506493, 13.332582) title:@"Chinese"];
    KaisersWegpunkt * wp5 = [[KaisersWegpunkt alloc] initWidthCoordinate:
                            CLLocationCoordinate2DMake(52.517789, 13.374638) title:@"Bockwurst"];
    KaisersWegpunkt * wp6 = [[KaisersWegpunkt alloc] initWidthCoordinate:
                            CLLocationCoordinate2DMake(52.516435, 13.384751) title:@"Schlesiches Restaurant"];
    KaisersWegpunkt * wp7 = [[KaisersWegpunkt alloc] initWidthCoordinate:
                            CLLocationCoordinate2DMake(52.517309, 13.393891) title:@"Mampf"];
    KaisersWegpunkt * wp8 = [[KaisersWegpunkt alloc] initWidthCoordinate:
                            CLLocationCoordinate2DMake(52.522387, 13.409570) title:@"All you can eat"];
    KaisersWegpunkt * wp9 = [[KaisersWegpunkt alloc] initWidthCoordinate:
                            CLLocationCoordinate2DMake(52.517363, 13.389218) title:@"Pizzeria"];
    KaisersWegpunkt * wp10 = [[KaisersWegpunkt alloc] initWidthCoordinate:
                            CLLocationCoordinate2DMake(52.518019, 13.378574) title:@"Döner"];
    KaisersWegpunkt * wp11 = [[KaisersWegpunkt alloc] initWidthCoordinate:
                            CLLocationCoordinate2DMake(52.517718, 13.369514) title:@"Wurst"];
    KaisersWegpunkt * wp12 = [[KaisersWegpunkt alloc] initWidthCoordinate:
                            CLLocationCoordinate2DMake(52.505878, 13.351798) title:@"und mehr"];
    
    _wpall = [[NSArray alloc] initWithObjects:wp1, wp2, wp3, wp4, wp5, wp6, wp7, wp8, wp9, wp10, wp11, wp12, nil];
    [map addAnnotations:_wpall];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(bool)updateDistanceToAnnotation:(KaisersWegpunkt *)waypoint
{
    CLLocation *pinLocation = [[CLLocation alloc] 
        initWithLatitude:waypoint.coordinate.latitude
               longitude:waypoint.coordinate.longitude];

    CLLocation *userLocation = [[CLLocation alloc] 
        initWithLatitude:map.userLocation.coordinate.latitude
               longitude:map.userLocation.coordinate.longitude];

    CLLocationDistance distanceTo = [pinLocation distanceFromLocation:userLocation];
    /*/
    NSLog([NSString stringWithFormat: @"Distance %4.0f", distanceTo]);
    /*/
    
    if (distanceTo < 20.0) {
    return true;
    
    }
    
    else {
    return false;

    }

}

-(void) mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    _region = MKCoordinateRegionMakeWithDistance([[userLocation location] coordinate], 1000, 1000);
    [map setRegion:_region];

    for (int i=0; i < [_wpall count]; i++) {
        if ([self updateDistanceToAnnotation:_wpall[i]] ==true) {
        self.distance.text= @"Ein Wegpunkt erreicht";
        break;
 
        }
        
        else {
        self.distance.text= @"";
        }
    }

}







@end
