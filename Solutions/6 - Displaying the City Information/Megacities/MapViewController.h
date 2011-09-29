@interface MapViewController : UIViewController

@property (nonatomic, retain) NSDictionary *city;
@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) IBOutlet UILabel *cityPopulationLabel;

@end
