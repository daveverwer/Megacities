#import "MapViewController.h"

@implementation MapViewController

@synthesize city = _city;

#pragma mark View lifecycle
- (void)viewDidLoad
{
  [super viewDidLoad];
}

#pragma mark Memory management
- (void)dealloc
{
  self.city = nil;
  [super dealloc];
}

@end
