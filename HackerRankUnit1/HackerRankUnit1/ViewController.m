//
//  ViewController.m
//  HackerRankUnit1
//
//  Created by Andrews, John L. on 5/29/18.
//  Copyright © 2018 HackerRank. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
//  [self lettersChangeToMakeAnagramFrom: @[@"a", @"a", @"a", @"b", @"b", @"b"]];
//  [self lettersChangeToMakeAnagramFrom: @[@"x", @"y", @"y", @"x"]];
  [self lettersChangeToMakeAnagramFrom: @[@"a", @"b", @"c"]];
}

- (int)lettersChangeToMakeAnagramFrom: (NSArray *) array {
  int arraySize = [array count];
  // from examples, seems like array must be even
  if (arraySize % 2 != 0) {
    NSLog(@"return -1");
    return -1;
  }
  int midPoint = arraySize / 2;
  NSArray* leftArray = [array subarrayWithRange:(NSMakeRange(0, midPoint))];
  
  int letterChanges = 0;
  for (int i = midPoint; i < arraySize; i++) {
    if (![leftArray containsObject: array[i]]) {
      letterChanges++;
    }
  }
  NSLog(@"%d", letterChanges);
  return letterChanges;
}
@end
