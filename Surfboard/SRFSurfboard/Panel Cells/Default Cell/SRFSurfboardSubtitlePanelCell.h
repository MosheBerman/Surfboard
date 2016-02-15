//
//  SRFSurfboardSubtitlePanelCell.h
//  Surfboard
//
//  Created by Sidhant Gandhi on 12/3/14.
//  Copyright (c) 2014 Moshe Berman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SRFSurfboardPanel.h"

@interface SRFSurfboardSubtitlePanelCell : UICollectionViewCell

/**
 *  An outlet for the text view.
 */

@property (weak, nonatomic) IBOutlet UILabel *textView;

/**
 *  An outlet for the subtitle.
 */

@property (weak, nonatomic) IBOutlet UILabel *subTitle;

/**
 *  The button at the bottom of the view.
 */

@property (weak, nonatomic) IBOutlet UIButton *actionButton;

/**
 *  The panel contents to be displayed.
 */

@property (nonatomic, strong) SRFSurfboardPanel *panel;

@end
