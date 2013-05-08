//
//  TowViewController.h
//  UITabBar
//
//  Created by lijunlong on 12-10-16.
//  Copyright (c) 2012年 lijunlong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TowViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
@property(retain,nonatomic)UISearchBar *sbar;
@property(retain,nonatomic)UITableView *table;
@property(retain,nonatomic)NSArray *ary;
@property(retain,nonatomic)NSArray *result;
@property(retain,nonatomic)UISearchDisplayController *sdc;
@end
