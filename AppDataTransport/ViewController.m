//
//  ViewController.m
//  AppDataTransport
//
//  Created by 李思远 on 2019/2/20.
//  Copyright © 2019年 nuckyLee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *titleArray;
@end

@implementation ViewController

+ (ViewController *)controller {
    return [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ViewController"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell1"];
    
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"urls"];
    NSLog(@"urls = %@", str);
}

#pragma mark - data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"cell%ld", indexPath.row + 1] forIndexPath:indexPath];
    cell.textLabel.text = self.titleArray[indexPath.row];
    return cell;
}

#pragma mark - delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        //UIActivityViewController -- 该系统提供了一些标准服务，例如将项目复制到粘贴板、将内容发布到社交媒体站点、通过电子邮件或SMS发送项目等等。应用程序还可以定义定制服务。
        UIImage *imageToShareOne = [UIImage imageNamed:@"heart"];
        UIImage *imageToShareTwo = [UIImage imageNamed:@"BeautyStar"];
        NSArray *activityItems = @[imageToShareOne, imageToShareTwo];
        UIActivityViewController *controller = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
        [self presentViewController:controller animated:YES completion:nil];
    }
}

#pragma mark - lazy data
- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = [NSArray arrayWithObjects:@"UIActivityViewController", nil];
    }
    return _titleArray;
}
@end
