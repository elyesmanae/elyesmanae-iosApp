//
//  MapViewController.m
//  SubViewProject
//
//  Created by Elzes on 19.09.18.
//  Copyright © 2018 Elzes. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

@synthesize _searchText = searchText,
            _mapView = mapView,
            _region = region;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self._mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, 414, 700)];
    mapView.showsUserLocation = YES;
    mapView.delegate = self;
    mapView.showsUserLocation = YES;
    mapView.zoomEnabled = YES;
    
    [self.view addSubview:mapView];
    
    
    searchText = [[UITextField alloc] initWithFrame:CGRectMake(40, 50, 330, 40)];
    searchText.backgroundColor = [UIColor whiteColor];
    searchText.layer.cornerRadius = 8;
    searchText.placeholder = @" ⦿ Search";
    self._searchText.layer.borderColor = [[UIColor grayColor] CGColor];
    [self.view addSubview:searchText];
    self._mapView.delegate = self;
    
    MKCoordinateSpan span;
    span.latitudeDelta = 0.002;
    span.longitudeDelta = 0.002;
    
    // define starting point for map
    CLLocationCoordinate2D start;
    start.latitude = 49.00937;
    start.longitude = 8.40444;
    
    // create region, consisting of span and location
    MKCoordinateRegion region;
    region.span = span;
    region.center = start;
    
    // move the map to our location
    [self._mapView setRegion:region animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
  
}
/*
- (void) performSearch {
    MKLocalSearchRequest *request =
    [[MKLocalSearchRequest alloc] init];
    request.naturalLanguageQuery = searchText.text;
    request.region = mapView.region;
    
  NSMutableArray  *matchingItems = [[NSMutableArray alloc] init];
    
    MKLocalSearch *search =
    [[MKLocalSearch alloc]initWithRequest:request];
    
    [search startWithCompletionHandler:^(MKLocalSearchResponse
                                         *response, NSError *error) {
        if (response.mapItems.count == 0)
            NSLog(@"No Matches");
        else
            for (MKMapItem *item in response.mapItems)
            {
                [matchingItems addObject:item];
                MKPointAnnotation *annotation =
                [[MKPointAnnotation alloc]init];
                annotation.coordinate = item.placemark.coordinate;
                annotation.title = item.name;
                [self._mapView addAnnotation:annotation];
            }
    }];
}*/
-(void)initWithRequest:(MKLocalSearchRequest *)request{
    request = [[MKLocalSearchRequest alloc] init];
    request.naturalLanguageQuery = searchText.text;
    request.region = mapView.region;
    [mapView regionThatFits:request.region];
    
}

@end
