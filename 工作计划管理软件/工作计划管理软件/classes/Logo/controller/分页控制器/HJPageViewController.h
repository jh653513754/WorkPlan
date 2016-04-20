//
//  HJPageViewController.h
//  分页控制器
//
// 
//

#import <UIKit/UIKit.h>

@interface HJPageViewController : UIViewController

@property (nonatomic, copy) NSString *leftMenuTitle;
@property (nonatomic, copy) NSString *middleMuneTitle;
@property (nonatomic, copy) NSString *rightMuneTitle;

@property (nonatomic, strong) UITableViewController *leftController;
@property (nonatomic, strong) UITableViewController *middleController;
@property (nonatomic, strong) UITableViewController *rightController;

@end
