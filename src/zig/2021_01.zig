// Copyright 2021 Mitchell Kember. Subject to the MIT License.
// Advent of Code 2021
// Day 1: Sonar Sweep

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
    try fmt.format(output, "{}\n", .{part1.num_increases});
    // Part 2:
    try fmt.format(output, "{}\n", .{part2.num_increases});
}

fn Counter(comptime window_size: u64) type {
    return struct {
        const Self = @This();

        i: usize = 0,
        full: bool = false,
        buf: [window_size]Depth = undefined,
        sum: Depth = 0,
        num_increases: u64 = 0,

        fn init() Self {
            return .{};
        }

        fn addMeasurement(self: *Self, depth: Depth) void {
            if (!self.full) {
                self.sum += depth;
                self.buf[self.i] = depth;
                self.i = (self.i + 1) % window_size;
                self.full = self.i == 0;
                return;
            }
            const prev = self.sum;
            self.sum -= self.buf[self.i];
            self.sum += depth;
            self.buf[self.i] = depth;
            self.i = (self.i + 1) % window_size;
            if (self.sum > prev) {
                self.num_increases += 1;
            }
        }
    };
}
