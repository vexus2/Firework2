//
// Created by vexus2 on 2013/02/20.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "FWView.h"

@interface Firework : NSObject
{
    UIView *_view;
    float _radius;
    CGPoint _center;
    NSTimer *_livetimer;
    NSMutableArray *_owner;
}

- (void)draw;

- (void)next;

- (void)step:(NSTimer *)theTimer;

- (void)stop;

- (id)initWithCenter:(CGPoint)center owner:(NSMutableArray *)owner view:(UIView *)view;


@end

