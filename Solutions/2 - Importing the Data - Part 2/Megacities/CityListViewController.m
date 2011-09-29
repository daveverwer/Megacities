#import "CityListViewController.h"

@implementation CityListViewController

@synthesize cities = _cities;

#pragma mark View lifecycle
- (void)viewDidLoad
{
  [super viewDidLoad];

  NSBundle *mainBundle = [NSBundle mainBundle];
  NSString *citiesFilePath = [mainBundle pathForResource:@"Cities"
                                                  ofType:@"plist"];
  self.cities = [NSArray arrayWithContentsOfFile:citiesFilePath];

  NSDictionary *cityDictionary = [self.cities objectAtIndex:0];
  NSLog(@"City name: %@", [cityDictionary valueForKey:@"Name"]);
  NSLog(@"City population: %@", [cityDictionary valueForKey:@"Population"]);
}

#pragma mark Table view data source
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
  return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  // Grab a cell either by attempting to reuse an existing cell or by creating
  // a new cell with a default style. This code is inserted in to all new table
  // view controllers by default by the Apple table view controller template.
  static NSString *cellID = @"Cell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                   reuseIdentifier:cellID] autorelease];
  }

  return cell;
}

#pragma mark Table view delegate
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

#pragma mark Memory management
- (void)dealloc
{
  self.cities = nil;
  [super dealloc];
}

@end
