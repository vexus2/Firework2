//
// Created by vexus2 on 2013/02/20.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "FWView.h"
#import "Firework.h"


@implementation FWView
{

}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _fireworks = [[NSMutableArray alloc] init];
    }
    self.backgroundColor = [UIColor blackColor];
    return self;
}

- (void)drawRect:(CGRect)rect
{
    for (Firework *f in _fireworks) {
        [f draw];
    }
}

/**
* 指の画面上の座標を特定し、これを中心としてFireworksインスタンスを生成
* 作成したFireworksインスタンスを_fireworksに登録
*/
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{

    if (_updateTimer == nil) {
        _updateTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(requestUpdate:) userInfo:nil repeats:YES];
    }

    //指の位置にFirewokを作成
    UITouch *t = [touches anyObject];
    CGPoint pt = [t locationInView:self];

    static CGPoint lastpt = {0, 0};
    double dx = lastpt.x - pt.x;
    double dy = lastpt.y - pt.y;
    // 一つ前のFireworksオブジェクトより50px離れていなければ生成しない
    if (sqrt(dx * dx + dy * dy) <= 50) {
        return;
    }

    lastpt = pt;

    Firework *f = [[Firework alloc] initWithCenter:pt owner:_fireworks view:self];
    [_fireworks addObject:f];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _fireworks = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)dealloc
{
    for (Firework *f in _fireworks) {
        [f stop];
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
}

- (void)requestUpdate:(NSTimer *)timer
{
    [self setNeedsDisplay];
}

- (void)stop
{
    [_updateTimer invalidate];
    _updateTimer = nil;
    for (Firework *f in _fireworks) {
        [f stop];
    }
    [_fireworks removeAllObjects];
}

@end