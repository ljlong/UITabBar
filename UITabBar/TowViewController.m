//
//  TowViewController.m
//  UITabBar
//
//  Created by lijunlong on 12-10-16.
//  Copyright (c) 2012年 lijunlong. All rights reserved.
//

#import "TowViewController.h"

@interface TowViewController ()

@end

@implementation TowViewController
@synthesize sbar,table,ary,result,sdc;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor orangeColor];
    
    self.sbar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    self.sbar.showsCancelButton = YES;//显示cancel按钮
    self.sbar.barStyle = UIBarStyleBlackTranslucent;//设置黑色透明
    self.sbar.placeholder = @"search";
    self.sbar.delegate = self;
    [self.view addSubview:self.sbar];
    self.sdc = [[UISearchDisplayController alloc] initWithSearchBar:sbar contentsController:self];//创建search控制器使用sbar
    self.sdc.searchResultsDataSource = self;
    self.sdc.searchResultsDelegate = self;
    
    self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, 320, 460-44-40) style:UITableViewStylePlain];
    self.table.delegate = self;
    self.table.dataSource = self;
    [self.view addSubview:self.table];
    
    NSString *file = [[NSBundle mainBundle] pathForResource:@"crayons" ofType:@"txt"];
    NSString *contentOffFile = [NSString stringWithContentsOfFile:file encoding:NSUTF8StringEncoding error:nil];
    self.ary = [contentOffFile componentsSeparatedByString:@"\n"];
    NSLog(@"%@",ary);
    
//    for (NSString *str in ary) {
//        NSArray *arr = [str componentsSeparatedByString:@"#"];
//    }
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.table) {
       return self.ary.count;
    }else{
        return self.result.count;
    }
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NSString *cont;
    if (tableView == self.table) {
        cont = [self.ary objectAtIndex:indexPath.row];
    }else{
        cont = [self.result objectAtIndex:indexPath.row];
    }
    
    
    //NSArray *ar = [[self.ary objectAtIndex:indexPath.row] componentsSeparatedByString:@"#"];
    NSArray *ar = [cont componentsSeparatedByString:@"#"];
    NSString *col = [ar objectAtIndex:1];
    cell.textLabel.textColor = [self getColorWithString:col];
    cell.textLabel.text = [ar objectAtIndex:0];
    return cell;
    
    
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF CONTAINS [cd] %@",self.sbar.text];
    self.result = [self.ary filteredArrayUsingPredicate:pre];
   // self.ary = self.result;
    [self.sdc.searchResultsTableView reloadData];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    UIColor *color = cell.textLabel.textColor;
//    UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_4_n.png"]];
//    imageV.backgroundColor = color;
    //UIImage
    //self.navigationItem.t = imageV;
    self.navigationController.navigationBar.tintColor = color;
    self.sbar.tintColor = color;
}

-(UIColor*)getColorWithString:(NSString*)hexString{
    NSRange rage = NSMakeRange(0, 2);
    unsigned int red ,green,blue ;
    [[NSScanner scannerWithString:[hexString substringWithRange:rage]] scanHexInt:&red];
    rage.location =2;
    [[NSScanner scannerWithString:[hexString substringWithRange:rage]] scanHexInt:&green];
    rage.location =4;
    [[NSScanner scannerWithString:[hexString substringWithRange:rage]] scanHexInt:&blue];
    
    UIColor *clo = [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
    NSLog(@"%0x,%0x,%0x",red,green,blue);
    return clo;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
