//
//  ViewController.m
//  Surfboard
//
//  Created by Moshe on 8/7/14.
//  Copyright (c) 2014 Moshe Berman. All rights reserved.
//

#import "ViewController.h"
#import "SRFSurfboard.h"

@interface ViewController () <SRFSurfboardDelegate>

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /**
     *  Set the background color to look like there's some kind of mist in the icon.
     */
    
    self.view.backgroundColor = [UIColor colorWithRed:0.06 green:0.15 blue:0.63 alpha:1.00];
    
    /**
     *  Find the buttons in the view and give them some kind of affordance.
     */
    
    for (UIView *view in self.view.subviews)
    {
        if ([view isKindOfClass:[UIButton class]])
        {
            view.layer.cornerRadius = 5.0f;
            view.layer.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.25].CGColor;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    return [super shouldPerformSegueWithIdentifier:identifier sender:sender];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    SRFSurfboardViewController *surfboard = segue.destinationViewController;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"panels" ofType:@"json"];
    NSArray *panels = [SRFSurfboardViewController panelsFromConfigurationAtPath:path];
    [surfboard setPanels:panels];

    surfboard.delegate = self;
    
    surfboard.backgroundColor = self.view.backgroundColor;
}

#pragma mark - SRFSurfboardDelegate

/** ---
 *  @name SRFSurfboardDelegate
 *  ---
 */

- (void)surfboard:(SRFSurfboardViewController *)surfboard didTapButtonAtIndexPath:(NSIndexPath *)indexPath
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)surfboard:(SRFSurfboardViewController *)surfboard didShowPanelAtIndex:(NSInteger)index
{
//    NSLog(@"Index: %i", index);
}

@end
