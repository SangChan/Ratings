//
//  GamePickerViewController.h
//  Ratings
//
//  Created by SangChan on 2014. 8. 25..
//  Copyright (c) 2014년 Spring. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GamePickerViewController;

@protocol GamePickerViewControllerDelegate <NSObject>
- (void)gamePickerViewController:(GamePickerViewController *)controller didSelectGame:(NSString *)game;
@end

@interface GamePickerViewController : UITableViewController

@property (nonatomic, weak) id <GamePickerViewControllerDelegate> delegate;
@property (nonatomic, strong) NSString *game;

@end
