//
//  SplashViewController.m
//  thingspine
//
//  Created by tblr-macmini19 on 17/02/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "SplashViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

static bool waiting = true;
@interface SplashViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *loaderImageView;
@property (nonatomic) AVPlayer *avPlayer;
@end

@implementation SplashViewController


static UIViewController *splashView;

static UIViewController *splashView;

+ (void)show2 {
}
+ (void)show {
  [self show2];
  
  UIWindow* window = [UIApplication sharedApplication].keyWindow;
  if (!window)
    window = [[UIApplication sharedApplication].windows objectAtIndex:0];
  if(splashView == nil && waiting){
    splashView = [[UIStoryboard storyboardWithName:@"LaunchScreen" bundle:nil]instantiateInitialViewController];
    [splashView setModalPresentationStyle:UIModalPresentationFullScreen];
    [window.rootViewController presentViewController: splashView animated:false completion:nil];
  }
}
+ (void)hide {
  dispatch_async(dispatch_get_main_queue(),
                 ^{
                   waiting = false;
                   if(splashView != nil){
                     [splashView dismissViewControllerAnimated:false completion:nil];
                     splashView = nil;
                   }
                 });
}


- (void)viewDidLoad {
    [super viewDidLoad];
  /*UIImage* flippedImage = [UIImage imageWithCGImage:self.bottleImageView.image.CGImage
                                              scale:self.bottleImageView.image.scale
                                        orientation:UIImageOrientationUpMirrored]; */
 // UIImage* flippedImage = [UIImage imageNamed:@"launch_fullbottle"];
  
  [self.loaderImageView setImage: nil];
  
  self.loaderImageView.animationImages =[self image];
  
  self.loaderImageView.animationDuration = 1.5f;
  self.loaderImageView.animationRepeatCount = 0;
  [self.loaderImageView startAnimating];
 // [self initPlayer];
}
-(NSMutableArray *)image{
  NSMutableArray * arr = [[NSMutableArray alloc]init];
   [arr addObject: [UIImage imageNamed:@"Group1"]];
   [arr addObject: [UIImage imageNamed:@"Group2"]];
   [arr addObject: [UIImage imageNamed:@"Group3"]];
  return arr;
}
@end
