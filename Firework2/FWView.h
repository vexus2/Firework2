//
// Created by vexus2 on 2013/02/20.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface FWView : UIView
{
    NSMutableArray *_fireworks;
    NSTimer *_updateTimer;
}
- (void)requestUpdate:(NSTimer *)timer;

- (void)stop;


@end