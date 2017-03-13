//
//  PickersViewController.h
//  YZCityPickers

//  仿美团 地址选择器

//  Created by Shin on 2017/1/31.
//  Copyright © 2017年 YZ.Shin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ChosenCity)(NSString *city);

@interface PickersViewController : UIViewController

//segmenet
@property(nonatomic,strong) UISegmentedControl *segmentControl ;

//搜索框
@property(nonatomic,strong) UISearchBar *searchBar ;

//国内tableview
@property(nonatomic,strong) UITableView *inlandTableView ;

//海外tableview
@property(nonatomic,strong) UITableView *overseasTableView ;

//block
@property(nonatomic,copy) ChosenCity chosenCity ;

- (void)chooseCity:(ChosenCity)city;


@end
