//
//  ViewController.m
//  Surfboard
//
//  Created by Moshe on 8/7/14.
//  Copyright (c) 2014 Moshe Berman. All rights reserved.
//

#import "ViewController.h"
#import "SRFSurfboardViewController.h"

@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
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
    
    surfboard.collectionView.backgroundColor = self.view.backgroundColor;
}
@end
