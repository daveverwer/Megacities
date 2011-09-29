#import "CityListViewController.h"
#import "MapViewController.h"

@implementation CityListViewController

@synthesize cities = _cities;

#pragma mark View lifecycle
- (void)viewDidLoad
{
  [super viewDidLoad];

  // Set a title for this view controller
  self.title = @"Megacities";

  // Load the city data in from the plist file
  NSBundle *mainBundle = [NSBundle mainBundle];
  NSString *citiesFilePath = [mainBundle pathForResource:@"Cities" ofType:@"plist"];
  self.cities = [NSArray arrayWithContentsOfFile:citiesFilePath];
}

#pragma mark Table view data source
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
  return [self.cities count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *cellID = @"Cell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                   reuseIdentifier:cellID] autorelease];
  }

  NSDictionary *city = [self.cities objectAtIndex:indexPath.row];
  cell.textLabel.text = [city valueForKey:@"Name"];
  cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
  return cell;
}

#pragma mark Table view delegate
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  MapViewController *controller = [[MapViewController alloc] init];
  controller.city = [self.cities objectAtIndex:indexPath.row];
  [self.navigationController pushViewController:controller animated:YES];
  [controller release]; controller = nil;
}

#pragma mark Memory management
- (void)dealloc
{
  self.cities = nil;
  [super dealloc];
}

@end
