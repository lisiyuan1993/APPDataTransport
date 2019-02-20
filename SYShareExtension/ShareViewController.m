//
//  ShareViewController.m
//  SYShareExtension
//
//  Created by 李思远 on 2019/2/20.
//  Copyright © 2019年 nuckyLee. All rights reserved.
//

#import "ShareViewController.h"

@interface ShareViewController ()

@end

@implementation ShareViewController

//isContentValid是用来判断内容是否可用的,这里可以做一些校验，比如我们分享的内容是否符合要分享的要求，如果返回false，那么在上图的Post按钮就无法点击了。因为一旦返回false，则说明分享内容不符合要求，也就无法Post了。
- (BOOL)isContentValid {
    // Do validation of contentText and/or NSExtensionContext attachments here
    return YES;
}

- (void)didSelectPost {
    // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
    
    // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
    [self.extensionContext completeRequestReturningItems:@[] completionHandler:nil];
}

- (NSArray *)configurationItems {
    // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
    return @[];
}

@end
