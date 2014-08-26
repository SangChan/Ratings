//
//  GamePickerViewController.m
//  Ratings
//
//  Created by SangChan on 2014. 8. 25..
//  Copyright (c) 2014년 Spring. All rights reserved.
//

#import "GamePickerViewController.h"

@implementation GamePickerViewController
{
    NSArray *games;
    NSUInteger selectedIndex;
}

@synthesize delegate, game;

- (void)viewDidLoad
{
    [super viewDidLoad];
    games = [NSArray arrayWithObjects:@"Angry Birds",@"Chess",@"Russian Roulette",@"Spin the Bottle",@"Texas Hold'em Poker",@"Tic-Tac-Toe", nil];
    selectedIndex = [games indexOfObject:self.game];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    games = nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [games count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GameCell"];
    cell.textLabel.text = [games objectAtIndex:indexPath.row];
    if (indexPath.row == selectedIndex)
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    else
        cell.accessoryType = UITableViewCellAccessoryNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (selectedIndex != NSNotFound) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:selectedIndex inSection:0]];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    selectedIndex = indexPath.row;
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    NSString *theGame = [games objectAtIndex:indexPath.row];
    [self.delegate gamePickerViewController:self didSelectGame:theGame];
}

@end
