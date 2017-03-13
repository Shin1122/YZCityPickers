//
//  ViewController.m
//  YZCityPickers
//
//  Created by Shin on 2017/1/31.
//  Copyright © 2017年 YZ.Shin. All rights reserved.
//

#import "ViewController.h"
#import "PickersViewController.h"

@interface ViewController (){
    
    UIButton * _addressBtn;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _addressBtn = ({
        UIButton *_ = [[UIButton alloc]init];
        _.frame = CGRectMake(CGRectGetWidth(self.view.frame)/2-100, CGRectGetHeight(self.view.frame)/2-20, 200, 40);
        [_ setTitle:@"请选择地址" forState:UIControlStateNormal];
        [_ setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self.view addSubview:_];
        _;
    });
    
    [_addressBtn addTarget:self action:@selector(chooseCitys) forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void)chooseCitys{
    
    PickersViewController *pickers= [[PickersViewController alloc]init];
    [self presentViewController:pickers animated:YES completion:^{}];
    
    //回调
    [pickers chooseCity:^(NSString *city) {
       
        [_addressBtn setTitle:city forState:UIControlStateNormal];
        
    }];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
