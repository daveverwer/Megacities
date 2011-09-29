#import "CityListViewController.h"

@implementation CityListViewController

@synthesize cities = _cities;

#pragma mark View lifecycle
- (void)viewDidLoad
{
  [super viewDidLoad];

  self.title = @"Megacities";

  NSBundle *mainBundle = [NSBundle mainBundle];
  NSString *citiesFilePath = [mainBundle pathForResource:@"Cities"
                                                  ofType:@"plist"];
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
  // Grab a cell either by attempting to reuse an existing cell or by creating
  // a new cell with a default style. This code is inserted in to all new table
  // view controllers by default by the Apple table view controller template.
  static NSString *cellID = @"Cell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                   reuseIdentifier:cellID] autorelease];
  }

  NSDictionary *city = [self.cities objectAtIndex:indexPath.row];
  cell.textLabel.text = [city valueForKey:@"Name"];

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
