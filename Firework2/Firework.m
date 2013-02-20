//
// Created by vexus2 on 2013/02/20.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Firework.h"

@implementation Firework
{

}


- (void)draw
{
    const float PI = 3.14;
    const int FIRE_COUNT = 20;
    for (int i = 0; i < FIRE_COUNT; i++) {
        double angle = 2 * PI * i / FIRE_COUNT;
        double x = _center.x + cos(angle) * _radius;
        double y = _center.y + sin(angle) * _radius;
        [self drawOne:x y:y];
    }
}

- (void)next
{
    // 呼ばれるたびに3ポイントずつ半径を大きくする
    _radius += 3;
    [_view setNeedsDisplay];
}

- (void)step:(NSTimer *)theTimer
{
    [self next];
    if (_radius > 100) {
        [self stop];
        [_owner removeObject:self];
    }
}

- (void)stop
{
    [_livetimer invalidate];
    _livetimer = nil;
}

- (id)initWithCenter:(CGPoint)center owner:(NSMutableArray *)owner view:(UIView *)view
{
    self = [super init];
    if (self) {
        _center = center;
        _owner = owner;
        _view = view;
        _livetimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(step:) userInfo:nil repeats:YES];
    }
    return self;
}

- (void)drawOne:(double)x y:(double)y
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetBlendMode(context, kCGBlendModePlusLighter);
    [[UIColor colorWithRed:0.1 green:0.0 blue:0.0 alpha:1.0] setFill];

    const float FIREBALL_RADIUS = 5.0;
    const float FIREBALL_GRADATION_STEP = 2.0;
    CGRect rect = CGRectMake(x, y, FIREBALL_RADIUS * 2 + 1, FIREBALL_RADIUS * 2 + 1);
    for (float i = 0; i < FIREBALL_RADIUS; i += FIREBALL_GRADATION_STEP) {
        CGContextFillEllipseInRect(context, CGRectInset(rect, i, i));
    }
}


@end