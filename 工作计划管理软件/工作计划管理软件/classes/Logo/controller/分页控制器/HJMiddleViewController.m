//
//  HJMiddleViewController.m
//  分页控制器
//
//  
//

#import "HJMiddleViewController.h"
#import "MiddleTableViewCell.h"
#import "SleepPlan.h"


@interface HJMiddleViewController ()
@property(nonatomic,strong) NSMutableArray *array;
@end

@implementation HJMiddleViewController

-(NSMutableArray*)array
{
    if (!_array) {
        _array = [NSMutableArray array];
    }
    return _array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //注册
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MiddleTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"SleepCell"];
    self.tableView.rowHeight = 120;
    self.view.backgroundColor = YAHGlobalBg;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //刷新数据列表
    self.array=YAHSleeplist;
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MiddleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SleepCell"];
    cell.sleepPlan = self.array[indexPath.row];
    return cell;
}

@end
