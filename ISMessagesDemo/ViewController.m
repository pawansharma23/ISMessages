//
//  ViewController.m
//  ISMessagesDemo
//
//  Created by Ilya Inyushin on 09.09.16.
//  Copyright © 2016 Ilya Inyushin. All rights reserved.
//

#import "ViewController.h"
#import "ISMessages.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField* titleField;
@property (weak, nonatomic) IBOutlet UITextField* messageField;
@property (weak, nonatomic) IBOutlet UISwitch *animSwitcher;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title = @"ISMessages Example";
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard:)];
    tapGesture.cancelsTouchesInView = NO;
    [self.tableView addGestureRecognizer:tapGesture];
   
}

#pragma mark - UITableViewDelegate & UITableDataSource Methods

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    UIView* bgSelectionView = [UIView new];
    bgSelectionView.backgroundColor = [UIColor colorWithRed:240./255. green:240./255. blue:240./255. alpha:1.];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView endEditing:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.section) {
        case 0: {
            if (indexPath.row == 0) {
                [ISMessages showCardAlertWithTitle:_titleField.text
                                           message:_messageField.text
                                         iconImage:nil
                                          duration:3.f
                                       hideOnSwipe:YES
                                         hideOnTap:YES
                                         alertType:ISAlertTypeSuccess];
                
                
            }
            
            if (indexPath.row == 1) {
                [ISMessages showCardAlertWithTitle:_titleField.text
                                           message:_messageField.text
                                         iconImage:nil
                                          duration:3.f
                                       hideOnSwipe:YES
                                         hideOnTap:YES
                                         alertType:ISAlertTypeError];
                
                
            }
            
            if (indexPath.row == 2) {
                [ISMessages showCardAlertWithTitle:_titleField.text
                                           message:_messageField.text
                                         iconImage:nil
                                          duration:3.f
                                       hideOnSwipe:YES
                                         hideOnTap:YES
                                         alertType:ISAlertTypeWarning];
                
                
            }
            
            if (indexPath.row == 3) {
                [ISMessages showCardAlertWithTitle:_titleField.text
                                           message:@"This is simple extension for presenting system-wide notifications from top of device screen."
                                         iconImage:nil
                                          duration:3.f
                                       hideOnSwipe:YES
                                         hideOnTap:YES
                                         alertType:ISAlertTypeInfo];
                
                
            }
            
            break;
        }
        case 2: {
            
            if (indexPath.row == 0) {
                [ISMessages hideAlertAnimated:_animSwitcher.isOn];
            }
            
            break;
        }
        default:
            break;
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - UITextFieldDelegate Methods

- (void)hideKeyboard:(UITapGestureRecognizer*)tapGesture {
    [self.tableView endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
