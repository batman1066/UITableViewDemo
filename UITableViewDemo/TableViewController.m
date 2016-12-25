//
//  TableViewController.m
//  UITableViewDemo
//
//  Created by yang ming on 2016/12/4.
//  Copyright © 2016年 yang ming. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()<UITableViewDataSource>

@end



@implementation TableViewController
- (void)setDataListData {
    if(self.dataList==nil){
        self.dataList=[NSMutableArray array];
        for (int i=0; i<100000; i++) {
            NSString *numberString=[NSString stringWithFormat:@"%d",i];
            [self.dataList addObject:numberString];
        }
    }
  }
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    [self setDataListData];
    return self.dataList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    [self setDataListData];
    UITableViewCell *uiTableViewCell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    
    /*
     static NSString *cellId=@"cell";
     UITableViewCell *uiTableViewCell=[tableView dequeueReusableCellWithIdentifier:cellId];
     if(uiTableViewCell==nil){
     uiTableViewCell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
     }
     */
    
    
    
    
    NSString *numberString=self.dataList[indexPath.row];
    uiTableViewCell.textLabel.text=numberString;
    uiTableViewCell.detailTextLabel.text=numberString;
    uiTableViewCell.imageView.image= [UIImage imageNamed:@"image"];
    uiTableViewCell.accessoryType=UITableViewCellAccessoryCheckmark;
    /*
     UITableViewCellStyleDefault,	// Simple cell with text label and optional image view (behavior of UITableViewCell in iPhoneOS 2.x)
     UITableViewCellStyleValue1,		// Left aligned label on left and right aligned label on right with blue text (Used in Settings)
     UITableViewCellStyleValue2,		// Right aligned label on left with blue text and left aligned label on right (Used in Phone/Contacts)
     UITableViewCellStyleSubtitle	// Left aligned label on top and left aligned label on bottom with gray text (Used in iPod).
     };             // available in iPhone OS 3.0
     
     */
    /*
     UITableViewCellAccessoryNone,                                                      // don't show any accessory view
     UITableViewCellAccessoryDisclosureIndicator,                                       // regular chevron. doesn't track
     UITableViewCellAccessoryDetailDisclosureButton __TVOS_PROHIBITED,                 // info button w/ chevron. tracks
     UITableViewCellAccessoryCheckmark,                                                 // checkmark. doesn't track
     UITableViewCellAccessoryDetailButton NS_ENUM_AVAILABLE_IOS(7_0)  __TVOS_PROHIBITED // info button. tracks
     */
    
    return uiTableViewCell;

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *message=[NSString stringWithFormat:@"第%ld段，第%ld行",indexPath.section,indexPath.row ];
    
    UIAlertView *uiAlertView=[[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [uiAlertView show];
    
}
- (nullable NSArray <UITableViewRowAction *>*)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *action1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"添加" handler:nil];
    UITableViewRowAction *action2 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"移动" handler:nil];
    UITableViewRowAction *action3 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:
    ^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        //NumberGroup *numberGroup1 = self.dataList[indexPath.section];
        //NSLog(@"indexPath.row:%d",indexPath.row);
        //[numberGroup1.groupNumbers removeObjectAtIndex:indexPath.row];
        [self.dataList removeObjectAtIndex:indexPath.row];
        [tableView reloadData];
        
    }];
    UITableViewRowAction *action4 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"刷新" handler:
                                     ^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
                                         [tableView reloadData];
                                         
                                     }];
    NSArray *actionArray = @[action1,action2,action3,action4];
    return actionArray;
    
}
@end
