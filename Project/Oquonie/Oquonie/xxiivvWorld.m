//
//  xxiivvViewController.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2013-07-08.
//  Copyright (c) 2013 XXIIVV. All rights reserved.
//

#import "xxiivvWorld.h"

@implementation xxiivvViewController (world)



- (void) worldStart
{
	worldNode = [NSMutableArray arrayWithObjects:@"",nil];
	int myCount = 0;
	while ( myCount < 150 )	{ myCount++; worldNode[myCount] = [NSArray arrayWithObjects: @"1", @"1", @"1", @"1", @"1", @"1", @"1", @"1", @"1", @"1", @"1", nil];	}
	
	worldNode[1] = [NSArray arrayWithObjects:
					@"3",@"2",@"3",
					@"3",@"2",@"3",
					@"3",@"2",@"3",
					@"wall.1",@"wall.1",@"wall.1",@"1",@"wall.1",@"door.1",@"wall.1",
					@"0", @"0",
					@"0", @"2",@"0", @"0",
					nil];
	worldNode[2] = [NSArray arrayWithObjects:
					@"2",@"2",@"2",
					@"2",@"1",@"2",
					@"2",@"2",@"2",
					@"wall.1",@"wall.1",@"wall.1",@"1",@"wall.1",@"wall.1",@"wall.1",
					@"1",@"0",
					@"0",@"0",@"1", @"0",
					nil];
}


- (void) worldUpdate
{
	
}



- (void) eventStart
{
	worldEvent = [NSMutableArray arrayWithObjects:@"",nil];
	int myCount = 0;
	while ( myCount < 150 )	{ myCount++; worldEvent[myCount] = [NSMutableArray arrayWithObjects: @"", nil];	}
	
	// 0 posX
	// 1 posY
	// 2 tile image
	// 3 dialog
	// 4 warp
	
	worldEvent[1][0] = [NSArray arrayWithObjects: @"1",@"-1",@"blocker.1", @"Dialog",@"", nil]; // table
	worldEvent[1][1] = [NSArray arrayWithObjects: @"0",@"2",@"", @"",@"2", nil]; // Door to 2
	
	worldEvent[2][0] = [NSArray arrayWithObjects: @"-1",@"-1",@"blocker.1", @"",@"", nil];
	worldEvent[3][0] = [NSArray arrayWithObjects: @"",@"",@"", @"",@"", nil];
	
}


- (void) eventUpdate
{

}


- (void) roomStart
{
	self.floor00.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",worldNode[userLocation][4]] ];
	self.floor1e.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",worldNode[userLocation][8]] ];
	self.floore1.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",worldNode[userLocation][0]] ];
	self.floor10.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",worldNode[userLocation][1]] ];
	self.floor01.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",worldNode[userLocation][5]] ];
	self.floor0e.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",worldNode[userLocation][3]] ];
	self.floore0.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",worldNode[userLocation][7]] ];
	self.floor11.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",worldNode[userLocation][2]] ];
	self.flooree.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",worldNode[userLocation][6]] ];
	self.step1.image = [UIImage imageNamed:[NSString stringWithFormat:@"step.%@.l.png",worldNode[userLocation][16]] ];
	self.step2.image = [UIImage imageNamed:[NSString stringWithFormat:@"step.%@.r.png",worldNode[userLocation][17]] ];
	self.wall1l.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.r.png",worldNode[userLocation][9]] ];
	self.wall2l.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.r.png",worldNode[userLocation][10]] ];
	self.wall3l.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.r.png",worldNode[userLocation][11]] ];
	self.beam.image   = [UIImage imageNamed:[NSString stringWithFormat:@"beam.%@.png",worldNode[userLocation][12]] ];
	self.wall1r.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.l.png",worldNode[userLocation][13]] ];
	self.wall2r.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.l.png",worldNode[userLocation][14]] ];
	self.wall3r.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.l.png",worldNode[userLocation][15]] ];
	
	// create events
	
	self.blocker1.hidden = YES;
	
	if( ![worldEvent[userLocation][0][2] isEqual:@""] ){
		for (NSArray *test in worldEvent[userLocation]) {
			if( [test[2] isEqual:@""] ){ continue; } // Skip if no graphic
			int posX = [test[0] intValue];
			int posY = [test[1] intValue];
			self.blocker1.hidden = NO;
			self.blocker1.frame = [self tileLocation:1 :posX :posY];
		}
	}
	
	
}

- (void) roomUpdate
{

	
}


@end