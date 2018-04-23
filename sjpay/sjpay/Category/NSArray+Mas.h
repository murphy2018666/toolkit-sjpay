//
//  NSArray+Mas.h
//  sjpay
//
//  Created by sjzf on 11/04/2018.
//  Copyright © 2018 sjzf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface  NSArray(NSArray_Mas)

- (MAS_VIEW *)star_commonSuperviewOfViews;
- (NSArray *)mas_distributeSudokuViewsWithFixedItemWidth:(CGFloat)fixedItemWidth
                                         fixedItemHeight:(CGFloat)fixedItemHeight
                                        fixedLineSpacing:(CGFloat)fixedLineSpacing
                                   fixedInteritemSpacing:(CGFloat)fixedInteritemSpacing
                                               warpCount:(NSInteger)warpCount
                                              topSpacing:(CGFloat)topSpacing
                                           bottomSpacing:(CGFloat)bottomSpacing
                                             leadSpacing:(CGFloat)leadSpacing
                                             tailSpacing:(CGFloat)tailSpacing ;
@end
