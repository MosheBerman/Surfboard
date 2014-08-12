//
//  SRFSurfboardPanel.h
//  Surfboard
//
//  Created by Moshe on 8/12/14.
//  Copyright (c) 2014 Moshe Berman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SRFSurfboardPanelCell : UICollectionViewCell

/**
 *  An outlet for the text view.
 */

@property (weak, nonatomic) IBOutlet UITextView *textView;

/**
 *  An outlet for the image view.
 */

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

/**
 *  The button at the bottom of the view.
 */

@property (weak, nonatomic) IBOutlet UIButton *actionButton;

@end
