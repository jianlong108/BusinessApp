//
//  RegistAndLoginViewController.m
//  我的控件集合
//
//  Created by Wangjianlong on 16/2/16.
//  Copyright © 2016年 autohome. All rights reserved.
//

#import "RegistAndLoginViewController.h"
//#import "UIColor+Wonderful.h"

@interface RegistAndLoginViewController ()



@property (nonatomic, strong) UITextField * userName;
@property (nonatomic, strong) UITextField * password;
@property (nonatomic, strong) UIButton * login;

@end

@implementation RegistAndLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor lightCyan];
    
    [self.view addSubview: self.userName];
    [self.view addSubview: self.password];
    [self.view addSubview: self.login];
}

- (void)viewDidAppear: (BOOL)animated
{
    [super viewDidAppear: animated];
    
    const CGFloat offset = CGRectGetWidth([UIScreen mainScreen].bounds);
    CGPoint accountCenter = self.userName.center;
    CGPoint passwordCenter = self.password.center;
    CGPoint startAccountCenter = CGPointMake(self.userName.center.x - offset, self.userName.center.y);
    CGPoint startPsdCenter = CGPointMake(self.password.center.x - offset, self.password.center.y);
    
    self.userName.center = startAccountCenter;
    self.password.center = startPsdCenter;
    
    [UIView animateWithDuration: 0.5 animations: ^{
        self.userName.center = accountCenter;
        self.userName.hidden = NO;
    } completion: nil];
    /**
     *  <#Description#>
     */
    [UIView animateWithDuration: 0.5 delay: 0.35 options:0 animations: ^{
        self.password.center = passwordCenter;
        self.password.hidden = NO;
    } completion: ^(BOOL finished) {
        [UIView animateWithDuration: 0.2 delay: 0 usingSpringWithDamping: 0.5 initialSpringVelocity: 0 options: 0 animations: ^{
            self.login.alpha = 1;
            CGPoint center = self.login.center;
            center.y -= 100;
            self.login.center = center;
        } completion: nil];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Getter
- (UITextField *)userName
{
    if (!_userName) {
        _userName = [self commonTextFieldWithPlaceholder: @"userName" size: CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds) - 100, 25)];
        _userName.center = CGPointMake(self.view.center.x, 200);
        _userName.hidden = YES;
    }
    return _userName;
}

- (UITextField *)password
{
    if (!_password) {
        _password = [self commonTextFieldWithPlaceholder: @"password" size: CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds) - 100, 25)];
        _password.center = CGPointMake(self.view.center.x, 250);
        _password.hidden = YES;
    }
    return _password;
}

- (UIButton *)login
{
    if (!_login) {
        _login = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, 120, 30)];
        _login.backgroundColor = [UIColor colorWithRed: 233/255. green: 123/255. blue: 123/255. alpha: 1];
        [_login setTitle: @"login" forState: UIControlStateNormal];
        _login.center = CGPointMake(self.view.center.x, 400);
        _login.alpha = 0;
    }
    return _login;
}

- (UITextField *)commonTextFieldWithPlaceholder: (NSString *)placeholder size: (CGSize)size
{
    UITextField * textField = [[UITextField alloc] initWithFrame: CGRectMake(0, 0, size.width, size.height)];
    
    textField.placeholder = placeholder;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    
    return textField;
}


@end

