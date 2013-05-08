//
//  OneViewController.m
//  UITabBar
//
//  Created by lijunlong on 12-10-16.
//  Copyright (c) 2012年 lijunlong. All rights reserved.
//

#import "OneViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface OneViewController ()

@end

@implementation OneViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - textView delegate
//获得焦点
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    NSLog(@"%s",__FUNCTION__);
    return  YES;
}
//
- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    NSLog(@"%s",__FUNCTION__);
    return  YES;
}
//开始编辑状态
- (void)textViewDidBeginEditing:(UITextView *)textView{
    NSLog(@"%s",__FUNCTION__);
}
//结束编辑状态
- (void)textViewDidEndEditing:(UITextView *)textView{
    NSLog(@"%s",__FUNCTION__);
}
//文字输入时
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    NSLog(@"%s",__FUNCTION__);
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
    }
    return  YES;
}
//文字输入完成
- (void)textViewDidChange:(UITextView *)textView{
    NSLog(@"%s",__FUNCTION__);
}

- (void)textViewDidChangeSelection:(UITextView *)textView{
    NSLog(@"%s",__FUNCTION__);
}




- (void)viewDidLoad
{
    //self.navigationItem.rightBarButtonItem
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor redColor];
    
    UITextField *field = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    field.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:field];
    
    UITextView *testView = [[UITextView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    testView.layer.cornerRadius = 20;//设置圆角
    testView.layer.borderWidth = 2;//设置边框粗细
    testView.layer.borderColor = [UIColor grayColor].CGColor;//设置边框颜射
    testView.delegate = self;
   // UIButton
    
    [self.view addSubview:testView];
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithTitle:@"done" style:UIBarButtonSystemItemCancel target:self action:@selector(regin)];
    UIBarButtonItem *btn1 = [[UIBarButtonItem alloc] initWithTitle:@"done" style:UIBarButtonItemStyleDone target:self action:@selector(regin)];
    UIBarButtonItem *btn2 = [[UIBarButtonItem alloc] initWithTitle:@"done" style:UIBarButtonItemStyleDone target:self action:@selector(regin)];
    UIBarButtonItem *spacebtn1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    
    UIToolbar *bar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 50, 320, 50)];
    bar.barStyle = UIBarStyleBlackOpaque;
    //
    
    UIBarButtonItem *spacebtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        NSArray *aa = [NSArray arrayWithObjects:btn1,spacebtn,btn,spacebtn1,btn2,nil];
    bar.items = aa;
    //testView.inputAccessoryView = bar;
}

//-(void)regin:(id) sender{
//   //UIToolbar *b = (UIToolbar *)[sender superclass];
//    [sender resignFirstResponder];
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
