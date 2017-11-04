//
//  BMNewFeatureController.m

//

#import "BMNewFeatureController.h"
#import "LKMainTool.h"
#import "UIImageView+BM.h"
#import "BMStartViewController.h"
const CGFloat kMaxFeatureCount = 3;

@interface BMNewFeatureController () <UIScrollViewDelegate,UIGestureRecognizerDelegate>
{
    UIPageControl *_pageControl;
}
@end

@implementation BMNewFeatureController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = YES;
    
    
    //添加scrollview
    [self setupScrollView];
    
    //添加pageControl
    [self setupPageControl];
    
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

/*- (void)enterApplication
{
    NSString *version = [NSBundle mainBundle].infoDictionary[(__bridge NSString *)kCFBundleVersionKey];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:version forKey:@"previewFeatureVersion"];
    [userDefaults synchronize];
    BMStartController *startVC = [[BMStartController alloc]init];
    UINavigationController *startVCNav = [[UINavigationController alloc] initWithRootViewController:startVC];
    
    kWindow.rootViewController = startVCNav;
}
*/
-(void)enterApplication:(UIGestureRecognizer*)sender{
    UIImageView *imageView=(UIImageView*)sender.view;
    if (imageView.tag==kMaxFeatureCount-1) {
        NSString *version = [NSBundle mainBundle].infoDictionary[(__bridge NSString *)kCFBundleVersionKey];
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:version forKey:@"previewFeatureVersion"];
        [userDefaults synchronize];
        BMStartViewController *startVC = [[BMStartViewController alloc]init];
        UINavigationController *startVCNav = [[UINavigationController alloc] initWithRootViewController:startVC];
        
        kWindow.rootViewController = startVCNav;

    }

}
#pragma mark - 私有方法
- (void)setupScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.bounces = YES;
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    // 添加新特性图片
    for (int i = 0; i < kMaxFeatureCount; i++) {
        NSString *imgName = [NSString stringWithFormat:@"%d.jpg",i+1];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:imgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        imageView.origin = CGPointMake(kScreen_Width * i, 0);
        imageView.size = CGSizeMake(kScreen_Width, kScreen_Height);
        if (i==kMaxFeatureCount-1) {
            imageView.userInteractionEnabled=YES;
            UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(enterApplication:)];
            tap.delegate=self;
            imageView.tag=i;
            [imageView addGestureRecognizer:tap];
        }
        [scrollView addSubview:imageView];
    }
    scrollView.contentSize = CGSizeMake(kScreen_Width * kMaxFeatureCount, 0);
    [self.view addSubview:scrollView];
    
  }

- (void)setupPageControl
{
    UIPageControl *control = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 30.f)];
    control.center = CGPointMake(kScreen_Width * 0.5, kScreen_Height * 0.7);
    control.numberOfPages = kMaxFeatureCount;
    control.pageIndicatorTintColor = [UIColor whiteColor];
    control.currentPageIndicatorTintColor = [UIColor greenColor];

    [self.view addSubview:control];
    _pageControl = control;
    _pageControl.hidden=YES;
}

#pragma mark - scrollview代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSUInteger page = (scrollView.contentOffset.x / kScreen_Width) + 0.5;
    _pageControl.currentPage = page;

    
    
}



#pragma  mark UIGestureRecognizerDelegate
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    return YES;
    
}
@end
