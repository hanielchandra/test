#import "StoreHomeViewController.h"

@implementation StoreHomeViewController
@synthesize storeScrollView;
@synthesize storePageControl;

bool pageControlBeingUsed;

- (void)viewDidLoad
{    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    pageControlBeingUsed = NO;
    
    NSArray *colors = [NSArray arrayWithObjects:[UIColor redColor], [UIColor blueColor], [UIColor greenColor], nil];
    
    for (int i= 0;i<colors.count; i++)
    {
        CGRect frame;
        frame.origin.x = self.storeScrollView.frame.size.width *i;
        frame.origin.y = 0;
        frame.size = self.storeScrollView.frame.size;
        
        UIView *subView = [[UIView alloc] initWithFrame:frame];
        [subView setBackgroundColor: [colors objectAtIndex:i]];
        [self.storeScrollView addSubview:subView];
        //NSLog(@"%d",i);
    }
    
    self.storeScrollView.contentSize = CGSizeMake(self.storeScrollView.frame.size.width * colors.count, self.storeScrollView.frame.size.height);
}

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    NSLog(@"%d", pageControlBeingUsed);
    if (pageControlBeingUsed == NO)
    {
        CGFloat pageWidth = self.storeScrollView.frame.size.width;
        int page = floor((self.storeScrollView.contentOffset.x - pageWidth/2)/ pageWidth)+1;
        self.storePageControl.currentPage = page;
    }    
}

- (void)viewDidUnload
{
    [self setStoreScrollView:nil];
    [self setStorePageControl:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (IBAction)changePage:(id)sender {
    CGRect frame;
    frame.origin.x = self.storeScrollView.frame.size.width * self.storePageControl.currentPage;
    frame.origin.y = 0;
    frame.size = self.storeScrollView.frame.size;
    [self.storeScrollView scrollRectToVisible:frame animated:YES];
    pageControlBeingUsed = YES;
}

- (void)scrollViewWillBeginDragging: (UIScrollView *) sender
{
    pageControlBeingUsed = NO;
}

- (void)scrollViewWillBeginDecelerating: (UIScrollView *) sender
{
    pageControlBeingUsed = NO;
}

@end