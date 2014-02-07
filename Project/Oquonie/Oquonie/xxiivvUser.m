//
//  xxiivvViewController+xxiivvUser.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 1/10/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "xxiivvUser.h"
#import "xxiivvSettings.h"

@implementation xxiivvViewController (xxiivvUser)

-(void)userStart
{
	NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
	
	if( [[defaults objectForKey:@"userLocation"] intValue]>0 ){
		[self userLoad];
	}
	else{
		[self userNew];
	}
}

-(void)userSave
{
	NSLog(@"   USER | Saving..     | Please hold");
	
	// Package
	NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
	
	[defaults setObject:[NSString stringWithFormat:@"%d",userLocation] forKey:@"userLocation"];
	[defaults setObject:[NSString stringWithFormat:@"%d",userPositionX] forKey:@"userPositionX"];
	[defaults setObject:[NSString stringWithFormat:@"%d",userPositionY] forKey:@"userPositionY"];
	[defaults setObject:[NSString stringWithFormat:@"%d",userPositionZ] forKey:@"userPositionZ"];
	[defaults setObject:[NSString stringWithFormat:@"%d",userCharacter] forKey:@"userCharacter"];
	[defaults setObject:[NSString stringWithFormat:@"%d",userGameCompleted] forKey:@"userGameCompleted"];
	
	[defaults setObject:userSpriteState forKey:@"userSpriteState"];
	[defaults setObject:userSpriteOrientationHorizontal forKey:@"userSpriteOrientationHorizontal"];
	[defaults setObject:userSpriteOrientationVertical forKey:@"userSpriteOrientationVertical"];
	
	[defaults setObject:userSpellbook forKey:@"userSpellbook"];
	[defaults setObject:userStorageEvents forKey:@"userStorageEvents"];
	
	[defaults synchronize];
}

-(void)userLoad
{
	NSLog(@"   USER | Loading..    | Please hold");
	
	NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
	
	userLocation = [[defaults objectForKey:@"userLocation"] intValue];
	userPositionX = [[defaults objectForKey:@"userPositionX"] intValue];
	userPositionY = [[defaults objectForKey:@"userPositionY"] intValue];
	userPositionZ = [[defaults objectForKey:@"userPositionZ"] intValue];
	userCharacter = [[defaults objectForKey:@"userCharacter"] intValue];
	userGameCompleted = [[defaults objectForKey:@"userGameCompleted"] intValue];
	
	userSpriteState = [defaults objectForKey:@"userSpriteState"];
	userSpriteOrientationHorizontal = [defaults objectForKey:@"userSpriteOrientationHorizontal"];
	userSpriteOrientationVertical = [defaults objectForKey:@"userSpriteOrientationVertical"];
	
	userSpellbook = [defaults objectForKey:@"userSpellbook"];
	userStorageEvents = [defaults objectForKey:@"userStorageEvents"];
	
}
-(void)userNew
{
	userPositionX = userCharacterX;
	userPositionY = userCharacterY;
	userCharacter = userCharacterId;
	userLocation = userCharacterLocation;
	
	userSpriteState = @"stand";
	userSpriteOrientationHorizontal = @"l";
	userSpriteOrientationVertical = @"f";
	userMoveEnabled = 1;
	userDialogActive = 0;
	
    // New event storage
    userStorageEvents = [NSMutableArray arrayWithObjects:@"",nil];
    int myCount = 0;
    while ( myCount < 40 )	{ myCount++; userStorageEvents[myCount] = @"";	}
	
	// User Spellbook
	userSpellbook = [NSMutableArray arrayWithObjects:@[@"",@""],@[@"",@""],@[@"",@""],nil];
}

@end
