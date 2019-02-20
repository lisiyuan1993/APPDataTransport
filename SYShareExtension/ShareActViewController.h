//
//  ShareActViewController.h
//  SYShareExtension
//
//  Created by nuckylee on 2019/2/20.
//  Copyright © 2019 nuckyLee. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShareActViewController : UIViewController
- (void)onSelected:(void(^)(NSIndexPath *indexPath))handler;
@end

NS_ASSUME_NONNULL_END
