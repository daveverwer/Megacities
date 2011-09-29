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

  CLLocationDegrees lat = [[self.city valueForKey:@"Latitude"] floatValue];
  CLLocationDegrees lon = [[self.city valueForKey:@"Longitude"] floatValue];

  MKCoordinateRegion region;
  region.center = CLLocationCoordinate2DMake(lat, lon);
  region.span = MKCoordinateSpanMake(0.5, 0.5);
  self.mapView.region = region;
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
