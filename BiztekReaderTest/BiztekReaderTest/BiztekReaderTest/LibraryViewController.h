#import <UIKit/UIKit.h>

@interface LibraryViewController : UIViewController
{
    UIScrollView* LibraryScrollView1, LibraryScrollView2;
    UIButton* buttonfilter1, buttonfilter2;
    UITableView* tableview1, tableview2;
    UITableViewCell* tableviewcell1,tableviewcell2;
}


@property (retain, nonatomic) IBOutlet UIScrollView* LibraryScrollView1,LibraryScrollView2; 
@property (retain, nonatomic) IBOutlet UIButton* buttonfilter1, buttonfilter2;
@property (retain, nonatomic) IBOUtlet UITableView* tableview1, tableview2;
@property (retain, nonatomic) IBOutlet UITableViewCell* tableviewcell1,tableviewcell2;

-(void)scrollViewDidScroll: (UIScrollView *)sender;
-(void)scrollViewWillBeginDragging: (UIScrollView *) sender;
- (IBAction)changePage:(id)sender;


@end