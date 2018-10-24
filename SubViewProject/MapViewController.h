//
//  MapViewController.h
//  SubViewProject
//
//  Created by Elzes on 19.09.18.
//  Copyright © 2018 Elzes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface MapViewController : UIViewController<MKMapViewDelegate>
{
    UITextField *searchText;
    MKMapView *mapView;
    MKCoordinateRegion *region;
}
@property (strong,nonatomic) UITextField *_searchText;
@property (nonatomic, strong) MKMapView *_mapView;
@property(nonatomic) MKCoordinateRegion *_region;

//- (void) performSearch;
- (void)initWithRequest:(MKLocalSearchRequest *)request;
@end
