#import <UIKit/UIKit.h>

@interface StoreHomeViewController: UIViewController
{
    UIScrollView* storeScrollView;
    UIPageControl* storePageControl;
}

@property (strong, nonatomic) IBOutlet UIScrollView *storeScrollView;
@property (strong, nonatomic) IBOutlet UIPageControl *storePageControl;

-(void)scrollViewDidScroll: (UIScrollView *)sender;
-(void)scrollViewWillBeginDragging: (UIScrollView *) sender;
-(void)scrollViewWillBeginDragging: (UIScrollView *) sender;
- (IBAction)changePage:(id)sender;

@end
