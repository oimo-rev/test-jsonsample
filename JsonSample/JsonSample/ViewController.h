//
//  ViewController.h
//  JsonSample
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <NSURLSessionTaskDelegate,UITableViewDelegate, UITableViewDataSource>
{
    @private NSMutableData *mutableData;
}

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (weak,nonatomic) NSMutableArray *items;
@property (strong, nonatomic) NSMutableArray *homeInfoList;

@end

//
//@interface TestBean : NSObject
//{
//    NSString *idx;
//    NSString *name;
//    NSString *content;
//}
//@property (nonatomic, copy) NSString *idx;
//@property (nonatomic, copy) NSString *name;
//@property (nonatomic, copy) NSString *content;
//@end