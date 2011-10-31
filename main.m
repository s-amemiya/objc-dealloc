
#import <Foundation/Foundation.h>

@class MyClass;
@interface Composited : NSObject {
	__weak MyClass *myClass_;
}
- (id)initWithMyClass:(MyClass *)myClass;
- (void)func;
@end

@interface MyClass : NSObject {
	Composited *composited_;
}
- (void)func;
@end

@implementation Composited

- (id)initWithMyClass:(MyClass *)myClass
{
	self = [super init];
	if (self) {
		myClass_ = myClass;
	}
	return self;
}

- (void)dealloc { NSLog(@"Composited's dealloc."); }

- (void)func
{
	NSLog(@"Composited's func");
	[myClass_ func];
}

@end

@implementation MyClass

- (id)init
{
    self = [super init];
    if (self) {
        composited_ = [[Composited alloc] initWithMyClass:self];
    }
    return self;
}

- (void)dealloc
{
	[composited_ func];
	NSLog(@"MyClass's dealloc.");
}

- (void)func { NSLog(@"MyClass's func"); }

@end

static void test()
{
	MyClass *mc = [[MyClass alloc] init];
}

int main()
{
	test();
	return 0;
}