#import "MapViewController.h"

@implementation MapViewController

@synthesize city = _city;
@synthesize mapView = _mapView;
@synthesize cityNameLabel = _cityNameLabel;
@synthesize cityPopulationLabel = _cityPopulationLabel;

#pragma mark View lifecycle
- (void)viewDidLoad
{
  [super viewDidLoad];

  self.title = [self.city valueForKey:@"Name"];
  self.cityPopulationLabel.text = [self.city valueForKey:@"Population"];

  // Get the lat/lon out of the dictionary and convert to floating point numbers
  CLLocationDegrees latitude = [[self.city valueForKey:@"Latitude"] floatValue];
  CLLocationDegrees longitude = [[self.city valueForKey:@"Longitude"] floatValue];

  // Make a region for the map based around the lat/lon
  MKCoordinateRegion region;
  region.center = CLLocationCoordinate2DMake(latitude, longitude);
  region.span = MKCoordinateSpanMake(0.5, 0.5);

  // Zoom the map on the point
  self.mapView.region = region;

  // Place a pin on the map
  MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
  annotation.coordinate = CLLocationCoordinate2DMake(latitude, longitude);
  annotation.title = [self.city valueForKey:@"Name"];
  [self.mapView addAnnotation:annotation];
  [annotation release]; annotation = nil;
}

- (void)viewDidUnload
{
  self.mapView = nil;
  self.cityNameLabel = nil;
  self.cityPopulationLabel = nil;

  [super viewDidUnload];
}

#pragma mark Memory management
- (void)dealloc
{
  self.city = nil;
  self.mapView = nil;
  self.cityNameLabel = nil;
  self.cityPopulationLabel = nil;

  [super dealloc];
}

@end
