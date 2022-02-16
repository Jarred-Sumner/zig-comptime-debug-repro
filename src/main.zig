const std = @import("std");

const Options = struct { name: usize = 99 };

pub fn MyComptimeType(comptime opts: Options) type {
    return struct {
        foo: u32 = 0,
        pub fn print(this: @This()) void {
            _ = opts;
            std.mem.doNotOptimizeAway(&this.foo);
        }
    };
}

pub fn main() anyerror!void {
    var ab = Comptime{};
    ab.print();

    var cd = Comptime2{};
    cd.print();
}

const Comptime = MyComptimeType(Options{});
const Comptime2 = MyComptimeType(Options{ .name = 100 });
