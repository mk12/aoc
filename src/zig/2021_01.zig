// Copyright 2021 Mitchell Kember. Subject to the MIT License.

const std = @import("std");
const fmt = std.fmt;

const Depth = u16;

pub fn run(input: anytype, output: anytype) !void {
    var buf: [1024]u8 = undefined;
    var part1 = Counter(1).init();
    var part2 = Counter(3).init();
    while (try input.readUntilDelimiterOrEof(&buf, '\n')) |line| {
        const depth = try fmt.parseUnsigned(Depth, line, 10);
        part1.addMeasurement(depth);
        part2.addMeasurement(depth);
    }
    // Part 1:
    try fmt.format(output, "{}\n", .{part1.numIncreases});
    // Part 2:
    try fmt.format(output, "{}\n", .{part2.numIncreases});
}

fn Counter(comptime windowSize: u64) type {
    return struct {
        const Self = @This();

        i: usize = 0,
        full: bool = false,
        buf: [windowSize]Depth = undefined,
        sum: Depth = 0,
        numIncreases: u64 = 0,

        fn init() Self {
            return .{};
        }

        fn addMeasurement(self: *Self, depth: Depth) void {
            if (!self.full) {
                self.sum += depth;
                self.buf[self.i] = depth;
                self.i = (self.i + 1) % windowSize;
                self.full = self.i == 0;
                return;
            }
            const prev = self.sum;
            self.sum -= self.buf[self.i];
            self.sum += depth;
            self.buf[self.i] = depth;
            self.i = (self.i + 1) % windowSize;
            if (self.sum > prev) {
                self.numIncreases += 1;
            }
        }
    };
}
