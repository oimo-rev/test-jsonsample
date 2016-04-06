//
//  ViewController.m
//  JsonSample
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.items = [NSMutableArray array];
    _tableView.delegate = self;
    _tableView.dataSource = self;

    [self parseAndDic];

}


- (void)parseAndDic {
    
    NSError *error = nil;
    NSURL *jsonUrl = [NSURL URLWithString:@"http://fbc-web.heteml.jp/yowbow_test/yowbow_sample.json"];
    NSData *jsonData = [NSData dataWithContentsOfURL:jsonUrl options:kNilOptions error:&error];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];

    int num = 0;
    for (NSDictionary *resDictionary in jsonDictionary) {
        NSLog(@"%@ ,%@",[resDictionary objectForKey:@"name"],[resDictionary objectForKey:@"content"]);
//        self.items[num] = @{@"name":[resDictionary objectForKey:@"name"],
//                              @"content":[resDictionary objectForKey:@"content"]};
        NSMutableDictionary *mdic = [@{@"name":resDictionary[@"name"]} mutableCopy];
        [self.homeInfoList addObject:mdic];
        num++;
    }
    
    // リロード
    [self.tableView reloadData];
    
//    // *** どっかのサンプル ***
//    NSArray *array = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
//
//    NSDictionary *dic;
//    for (NSDictionary *obj in array)
//    {
//        dic = obj;
//    }

//    // *** ログ出力のみ ***
//    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
//    NSDictionary *dataDictionary;
//    for( NSDictionary * json in jsonDictionary )
//    {
//        NSLog(@"%@ ,%@ , %@",  [json objectForKey:@"id"],[json objectForKey:@"name"],[json objectForKey:@"content"] );
//    }

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch(section) {
        case 0:return @"section1 ٩(•౪• ٩)"; break;
        case 1:return @"section2 ٩(•౪• ٩)"; break;
        case 2:return @"section3 ٩(•౪• ٩)"; break;
        default:return @"comments ٩(•౪• ٩)"; break;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return [self.items count];
//    return [self.homeInfoList count];
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:
(NSIndexPath *)indexPath
{
    // サンプルを使用
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
//    NSDictionary *item = [self.items objectAtIndex:indexPath.row];
    NSDictionary *item = [self.homeInfoList objectAtIndex:indexPath.row];
    cell.textLabel.text = [item objectForKey:@"name"];
    cell.contentView.backgroundColor = [UIColor orangeColor];
    return cell;

    // もともと自分で書いてたソース
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//    }
////    cell.textLabel.text = @"騙されたと思ってタップっ！";
//    NSDictionary *item = [self.items objectAtIndex:indexPath.row];
//    cell.textLabel.text = [[item objectForKey:@"name"] objectForKey:@"content"];
//    cell.contentView.backgroundColor = [UIColor orangeColor];
//    return cell;
}

@end
