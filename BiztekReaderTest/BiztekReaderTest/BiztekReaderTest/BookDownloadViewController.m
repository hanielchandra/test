#import "BookDownloadViewController.h"


@implementation BookDownloadViewController
@synthesize webview;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setWebview:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (void)dealloc {
    //[webview release];
    //[super dealloc];
}

- (IBAction)download:(id)sender {
    NSData *pdfData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://172.16.70.120/bizcodeigniter/index.php/bizBook"]];
    
    //Store the Data locally as PDF File
    
    NSString *resourceDocPath = [[NSString alloc] initWithString:[[[[NSBundle mainBundle]  resourcePath] stringByDeletingLastPathComponent] stringByAppendingPathComponent:@"Documents"]];
    
    NSString *filePath = [resourceDocPath stringByAppendingPathComponent:@"testPdf.pdf"];
    
    [pdfData writeToFile:filePath atomically:YES];
    
    
    //Now create Request for the file that was saved in your documents folder
    
    NSURL *url = [NSURL fileURLWithPath:filePath];
    
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    [webview setUserInteractionEnabled:YES];
    
    
    [webview loadRequest:requestObj];
    
}
@end