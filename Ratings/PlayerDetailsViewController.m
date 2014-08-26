//
//  PlayerDetailsViewController.m
//  Ratings
//
//  Created by SangChan on 2014. 8. 25..
//  Copyright (c) 2014년 Spring. All rights reserved.
//

#import "PlayerDetailsViewController.h"
#import "Player.h"

@implementation PlayerDetailsViewController
{
    NSString *game;
}

@synthesize delegate;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        NSLog(@"init PlayerDetailsViewController");
        game = @"Chess";
    }
    
    return self;
}

- (void)dealloc
{
    NSLog(@"dealloc PlayerDetailsViewController");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.detailLabel.text = game;
}

- (IBAction)cancel:(id)sender
{
    [self.delegate playerDetailsViewControllerDidCancel:self];
}
- (IBAction)done:(id)sender
{
    Player *player = [[Player alloc] init];
	player.name = self.nameTextField.text;
	player.game = game;
	player.rating = 1;
    [self.delegate playerDetailsViewController:self didAddPlayer:player];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        [self.nameTextField becomeFirstResponder];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PickGame"]) {
        GamePickerViewController *gamePickerViewController = segue.destinationViewController;
        gamePickerViewController.delegate = self;
        gamePickerViewController.game = game;
    }
}

- (void)gamePickerViewController:(GamePickerViewController *)controller didSelectGame:(NSString *)theGame
{
    game = theGame;
    self.detailLabel.text = game;
    [self.navigationController popViewControllerAnimated:YES];
}

@end
