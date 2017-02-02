//
//  PickersViewController.m
//  YZCityPickers
//
//  Created by Shin on 2017/1/31.
//  Copyright © 2017年 YZ.Shin. All rights reserved.
//

#import "PickersViewController.h"

#define GREEN [UIColor colorWithRed:0.13 green:0.75 blue:0.68 alpha:1.0]  //绿色
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width


@interface PickersViewController ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>{
    
    //X按钮
    UIButton *_exitButton;
    
    //选中-区县列表
//    UIView *_chosenView;
    
    //城市列表
    NSMutableArray *_citys;
    
    //热门城市列表
    NSMutableArray *_topCitys;
    
    //导航列表
    NSMutableArray *_indexArr;
    
        
}

@end

@implementation PickersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    //加工数据
    [self makeCitys];
    
    //布局视图
    [self setUpViews];
    
}

//页面布局
- (void)setUpViews{
    
    //1.自定义导航栏背景
    UIView *naviBack = ({
        UIView *_ = [[UIView alloc]init];
        _.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 64);
        _.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1.0];
        [self.view addSubview:_];
        
        //导航栏分割线
        UIView *line = ({
            UIView *_=[[UIView alloc]init];
            _.frame = CGRectMake(0, 63.5, CGRectGetWidth(self.view.frame), 0.5);
            _.backgroundColor = [UIColor colorWithRed:0.75 green:0.75 blue:0.75 alpha:1.0];
            _;
        
        });
        [_ addSubview:line];
        
        _;
    });
    
    //2.X按钮
    _exitButton = ({
    
        UIButton *_ = [[UIButton alloc]init];
        _.frame = CGRectMake(10,27,30,30);
        [_ setImage:[UIImage imageNamed:@"Exit"] forState:UIControlStateNormal];
        [naviBack addSubview:_];
        [_ addTarget:self action:@selector(exit) forControlEvents:UIControlEventTouchUpInside];
        _;
    
    });
    
    //3.分段控制器
    _segmentControl = ({
        UISegmentedControl *_=[[UISegmentedControl alloc]initWithItems:@[@"国内",@"海外"]];
        _.frame = CGRectMake(SCREENWIDTH/2-SCREENWIDTH*0.2, 27, SCREENWIDTH*0.4, 33);
        _.tintColor = GREEN;
        [_ setSelectedSegmentIndex:0];
        [_ setWidth:SCREENWIDTH*0.2 forSegmentAtIndex:0];
        [_ setWidth:SCREENWIDTH*0.2 forSegmentAtIndex:1];
        [naviBack addSubview:_];
        
        //点击方法
        [_ addTarget:self action:@selector(selectedSegment:) forControlEvents:UIControlEventValueChanged];
        
        _;
    });
    
    //4.选中/定位/搜索视图
//    _chosenView = ({
//    
//        UIView *_ = [[UIView alloc]init];
//        _.backgroundColor = [UIColor whiteColor];
//        
//        UIView *line = ({
//            UIView *_ = [[UIView alloc]init];
//            _.frame = CGRectMake(0, 40, SCREENWIDTH, 0.5);
//            _.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.00];
//            _;
//        
//        });
//        [_ addSubview:line];
//        /* 测试代码*/
//        _.frame = CGRectMake(0, 64, SCREENWIDTH, 40);
////        [self.view addSubview:_];
//        
//        _;
//    
//    });
    
    //5.搜索框
    _searchBar = ({
        UISearchBar *_=[[UISearchBar alloc]init];
        _.frame = CGRectMake(0, 64, SCREENWIDTH, 40);
        _.barStyle = UIBarStyleDefault;
        _.searchBarStyle = UISearchBarStyleMinimal;
        _.placeholder = @"输入城市名或拼音查询";
        UITextField *searchField=[_ valueForKey:@"_searchField"];
        searchField.backgroundColor = [UIColor colorWithRed:0.92 green:0.93 blue:0.93 alpha:1.0];
        [searchField setValue:[UIColor grayColor]forKeyPath:@"_placeholderLabel.textColor"];
        _.barTintColor = [UIColor whiteColor];
        _.delegate = self;
        
        UIView *line = ({
            UIView *_ = [[UIView alloc]init];
            _.frame = CGRectMake(0, 39.5, SCREENWIDTH, 0.5);
            _.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.00];
            _;
            
        });

        [self.view addSubview:_];
        [_ addSubview:line];
        _;
    });
    
    
    //5.国内列表
    
    _inlandTableView = ({
        UITableView *_ = [[UITableView alloc]initWithFrame:CGRectMake(0, 104, SCREENWIDTH, self.view.frame.size.height-64) style:UITableViewStylePlain];
        _.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        
        _.delegate = self;
        _.dataSource = self;
        
        
        [self.view addSubview:_];
        _;
    });
    
    
    //6.海外列表
    _overseasTableView = ({
        UITableView *_ = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREENWIDTH, self.view.frame.size.height-64) style:UITableViewStylePlain];
        
        
        
//        [self.view addSubview:_];
        _;
    });
 
    
}


//制作数据
- (void)makeCitys{
   
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"CityData" ofType:@"plist"];
    _citys = [NSMutableArray arrayWithContentsOfFile:plistPath];
    
    _indexArr = @[].mutableCopy;
    
    for (NSDictionary *cityInfo in _citys) {
        
        //导航列表
        [_indexArr addObject:cityInfo[@"initial"]];
        
    }
    
    
    //热门城市列表
//    NSMutableArray *_topCitys;
    
    
    
    
    
}



//分段控制器切换方法
- (void)selectedSegment:(UISegmentedControl *)sender{
    
    switch (sender.selectedSegmentIndex) {
        case 0:{
            
        }
            break;
            
        case 1:{
            
        }
            break;
    }
    
}

//选中城市后的返回事件
- (void)chooseCityFinish:(UIButton *)sender{
    
    
    if (self.chosenCity != nil) {
        self.chosenCity(sender.titleLabel.text);
    }
    
}

- (void)chooseCity:(ChosenCity)city{
    
    self.chosenCity = city;
    
}

//search bar delegate
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    
    searchBar.showsCancelButton = YES;
    
//    UITextField *textField = [searchBar valueForKey:@"_searchField"];
    
    UIButton *cancelBtn = [searchBar valueForKey:@"cancelButton"];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:14];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    
    [searchBar resignFirstResponder];
    searchBar.showsCancelButton = NO;
    
}



//tableview datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [_citys[section][@"citys"]count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    /* cell的重用队列*/
    static NSString *cellIdenfier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdenfier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
//    cell.selectedBackgroundView.backgroundColor = [UIColor redColor];
    
    cell.textLabel.text = _citys[indexPath.section][@"citys"][indexPath.row][@"city_name"];
    
    return  cell;
    
}

//tableview delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return _citys.count;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.chosenCity != nil) {
        self.chosenCity([tableView cellForRowAtIndexPath:indexPath].textLabel.text);
        [self exit];
        
    }
    
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    
    return _indexArr;
    
}



-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *header = [[UIView alloc]init];
//    header.frame = CGRectMake(0, 0, SCREENWIDTH, 20);
    header.backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1.0];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(12, 10, 10, 10)];
    label.textColor = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1.0];
    label.text = _indexArr[section];
    label.font = [UIFont systemFontOfSize:12];
    [header addSubview:label];
    
    return header;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 30.0;
    
}


//退出该页
- (void)exit{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
