//
//  PlayersViewController.h
//  Ratings
//
//  Created by SangChan on 2014. 8. 25..
//  Copyright (c) 2014년 Spring. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerDetailsViewController.h"

@interface PlayersViewController : UITableViewController <PlayerDetailsViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *players;

@end
