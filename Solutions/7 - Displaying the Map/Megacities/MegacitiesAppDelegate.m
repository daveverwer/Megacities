#import "MegacitiesAppDelegate.h"

@implementation MegacitiesAppDelegate

@synthesize window = _window;
@synthesize navigationController = _navigationController;

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window.rootViewController = self.navigationController;
  [self.window makeKeyAndVisible];
  return YES;
}

- (void)dealloc
{
  self.window = nil;
  self.navigationController = nil;
  [super dealloc];
}

@end
