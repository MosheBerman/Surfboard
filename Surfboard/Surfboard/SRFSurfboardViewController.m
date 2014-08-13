//
//  MBSurfboardViewController.m
//  Surfboard
//
//  Created by Moshe on 8/10/14.
//  Copyright (c) 2014 Moshe Berman. All rights reserved.
//

#import "SRFSurfboardViewController.h"
#import "SRFSurfboardPanelCell.h"   //  the panel cell
#import "SRFSurfboardPanel.h"

/**
 *  An identifier for surfboard cells.
 */

static NSString *kSurfboardPanelIdentifier = @"com.mosheberman.surfboard-panel";

/**
 *  An extension of the surfbord view controller.
 */

@interface SRFSurfboardViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

/**
 *  An array of configuration elements.
 */

@property (nonatomic, strong) NSArray *panels;

@end

@implementation SRFSurfboardViewController

#pragma mark - Initializers

/** ---
 *  @name Initializers
 *  ---
 */

/**
 *  Instantiates a new surfboard with an array of panel objects.
 *
 *  @param configuration An array of panels.
 *  @return An SRFSurfboardViewController.
 */

- (instancetype)initWithPathToConfiguration:(NSString *)path
{

    NSArray *panels = [SRFSurfboardViewController panelsFromConfigurationAtPath:path];
    
    self = [self initWithPanels:panels];
    
    if (self)
    {
        
    }
    
    return self;
}

/**
 *  Instantiates a new surfboard with an array of panel objects.
 *
 *  @param panels An array of panels.
 *  @return An SRFSurfboardViewController.
 */

- (instancetype)initWithPanels:(NSArray *)panels
{
    self = [super initWithCollectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
    
    if (self)
    {
        _panels = panels;
    }
    
    return self;
}

#pragma mark - View Lifecycle

/** ---
 *  @name View Lifecycle
 *  ---
 */

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /**
     *  Configure the layout.
     */
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionViewLayout;
    
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    /**
     *  Register a nib for the surfboard panel class.
     */
    
    UINib *nib = [UINib nibWithNibName:@"SRFSurfboardPanelCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:kSurfboardPanelIdentifier];
    
    /**
     *  Wire up the delegate and data source.
     */
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}

#pragma mark - UICollectionViewDataSource

/** ---
 *  @name UICollectionViewDataSource
 *  ---
 */


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger count = self.panels.count;
    
    return count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SRFSurfboardPanelCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kSurfboardPanelIdentifier forIndexPath:indexPath];
    
    //  TODO: Apply panel contents here.
    
    if (indexPath.row > 0 && indexPath.row < self.panels.count)
    {
        SRFSurfboardPanel *panel = self.panels[indexPath.row];
        
        cell.textView.text = panel.text;
        cell.imageView.image = panel.image;
        
        [cell.actionButton setTitle:panel.buttonTitle forState:UIControlStateNormal];

        //  Hide the button on panels with no title.
        cell.actionButton.hidden = (panel.buttonTitle == nil);
    }
    
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

/** ---
 *  @name UICollectionViewDelegateFlowLayout
 *  ---
 */

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.collectionView.bounds.size;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0f;
}

#pragma mark - Setters

/** ---
 *  @name Setters
 *  ---
 */

/**
 *  Sets the panels and reloads the surfboard.
 *
 *  @param panels An array of panels.
 */

- (void)setPanels:(NSArray *)panels
{
    _panels = panels;
    [[self collectionView] reloadSections:[NSIndexSet indexSetWithIndex:0]];
}


#pragma mark - Load Panels from Configuration

/** ---
 *  @name Load Panels From Configuration
 *  ---
 */

/**
 *  Loads panels out from a given path.
 *
 *  @param path The path from which to load the panel configuration.
 *
 *  @return An array of panels.
 */

+ (NSArray *)panelsFromConfigurationAtPath:(NSString *)path
{
    NSData *panelData = [[NSData alloc] initWithContentsOfFile:path];
    
    NSMutableArray *panels = [[NSMutableArray alloc] init];
    
    if (panelData)
    {
        NSArray *panelDictionaries = [NSJSONSerialization JSONObjectWithData:panelData options:0 error:nil];
        
        /**
         *  Iterate the panel dictionaries and "inflate" them into objects.
         */
        
        for (NSDictionary *panelDictionary in panelDictionaries)
        {
            SRFSurfboardPanel *panel = [[SRFSurfboardPanel alloc] initWithConfiguration:panelDictionary];
            [panels addObject:panel];
        }
    }
    
    return panels;
}

@end
