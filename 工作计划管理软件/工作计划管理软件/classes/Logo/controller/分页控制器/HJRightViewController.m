//
//  HJRightViewController.m
//  分页控制器
//
//
//

#import "HJRightViewController.h"
#import "RightTableViewCell.h"
#import "AlwaysDoGoal.h"

@interface HJRightViewController ()
@property(nonatomic,strong)NSMutableArray *Array;
@end

@implementation HJRightViewController
-(NSMutableArray*)SleepArray
{
    if (!_Array) {
        _Array = [NSMutableArray array];
    }
    return _Array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //注册
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([RightTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"RightCell"];
    self.tableView.rowHeight = 120;
    self.view.backgroundColor = YAHGlobalBg;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //刷新数据列表
    self.Array=YAHAlwaysDolist;
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.Array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RightCell"];
    cell.DoGoal = self.Array[indexPath.row];
    return cell;
}


@end
