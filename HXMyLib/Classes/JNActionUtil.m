//
//  JNActionUtil.m
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/10/22.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "JNActionUtil.h"

static DismissAction _dismissBlock;

@implementation JNActionUtil
/**
 *  自定义 AlertView
 *
 *  @param title          标题
 *  @param message        内容
 *  @param actions        操作
 *  @param vc             呈现的控制器
 *  @param clickItemBlock 回调
 */
+ (void)showAlertTitle:(NSString *)title
               message:(NSString *)message
               actions:(NSArray *)actions
                    vc:(UIViewController *)vc
                 block:(DismissAction)clickItemBlock {
    
    _dismissBlock = clickItemBlock;
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    // Actions
    for (NSInteger nn=0; nn<actions.count; nn++) {
        NSString *actionName = actions[nn];
        UIAlertAction *action = [UIAlertAction actionWithTitle:actionName style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            _dismissBlock(nn);
        }];
        
        [alert addAction:action];
    }
    
    [vc presentViewController:alert animated:YES completion:nil];
}

/**
 *  自定义 SheetView
 *
 *  @param title          标题
 *  @param actions        操作
 *  @param vc             呈现的控制器
 *  @param clickItemBlock 回调
 */
+ (void)showSheetTitle:(NSString *)title
               actions:(NSArray *)actions
                    vc:(UIViewController *)vc
                 block:(DismissAction)clickItemBlock {
    
    _dismissBlock = clickItemBlock;
    
    UIAlertController *sheet = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    for (NSInteger nn=0; nn<actions.count; nn++) {
        NSString *actionName = actions[nn];
        UIAlertAction *action = [UIAlertAction actionWithTitle:actionName style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            _dismissBlock(nn);
        }];
        
        [sheet addAction:action];
    }
    
    [vc presentViewController:sheet animated:YES completion:nil];
}
@end
