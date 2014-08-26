//
//  PlayersViewController.m
//  Ratings
//
//  Created by SangChan on 2014. 8. 25..
//  Copyright (c) 2014년 Spring. All rights reserved.
//

#import "PlayersViewController.h"
#import "Player.h"
#import "PlayerCell.h"

@implementation PlayersViewController

@synthesize players;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.players count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell==nil) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//    }
//    
//    return cell;
    PlayerCell *cell = (PlayerCell *)[tableView dequeueReusableCellWithIdentifier:@"PlayerCell"];
    Player *player = [self.players objectAtIndex:indexPath.row];
    cell.nameLabel.text = player.name;
    cell.gameLabel.text = player.game;
    cell.ratingImageView.image = [self imageForRating:player.rating];
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.players removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (UIImage *)imageForRating:(int)rating
{
    switch (rating) {
        case 1: return [UIImage imageNamed:@"1StarSmall.png"];
        case 2: return [UIImage imageNamed:@"2StarsSmall.png"];
        case 3: return [UIImage imageNamed:@"3StarsSmall.png"];
        case 4: return [UIImage imageNamed:@"4StarsSmall.png"];
        case 5: return [UIImage imageNamed:@"5StarsSmall.png"];
    }
    return nil;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddPlayer"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        PlayerDetailsViewController *playerDetailsViewController = [[navigationController viewControllers] objectAtIndex:0];
        playerDetailsViewController.delegate = self;
    }
}

- (void)playerDetailsViewControllerDidCancel:(PlayerDetailsViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)playerDetailsViewController:(PlayerDetailsViewController *)controller didAddPlayer:(Player *)player
{
	[self.players addObject:player];
	NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[self.players count] - 1 inSection:0];
	[self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
	[self dismissViewControllerAnimated:YES completion:nil];
}
- (void)playerDetailsViewControllerDidSave:(PlayerDetailsViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
