#import "MapViewController.h"

@implementation MapViewController

@synthesize city = _city;
@synthesize mapView = _mapView;
@synthesize cityPopulationLabel = _cityPopulationLabel;

#pragma mark View lifecycle
- (void)viewDidLoad
{
  [super viewDidLoad];

  self.title = [self.city valueForKey:@"Name"];
  self.cityPopulationLabel.text = [self.city valueForKey:@"Population"];

  // Get the lat/lon out of the dictionary and convert to floating point numbers
  CLLocationDegrees lat = [[self.city valueForKey:@"Latitude"] floatValue];
  CLLocationDegrees lon = [[self.city valueForKey:@"Longitude"] floatValue];

  // Make a region for the map based around the lat/lon
  MKCoordinateRegion region;
  region.center = CLLocationCoordinate2DMake(lat, lon);
  region.span = MKCoordinateSpanMake(0.5, 0.5);

  // Zoom the map on the point
  self.mapView.region = region;
}

- (void)viewDidUnload
{
  self.mapView = nil;
  self.cityPopulationLabel = nil;

  [super viewDidUnload];
}

#pragma mark Memory management
- (void)dealloc
{
  self.city = nil;
  self.mapView = nil;
  self.cityPopulationLabel = nil;

  [super dealloc];
}

@end
