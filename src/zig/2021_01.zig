// Copyright 2021 Mitchell Kember. Subject to the MIT License.

const std = @import("std");

const Depth = u16;

pub fn run(allocator: *std.mem.Allocator, input: anytype, output: anytype) anyerror!void {
    var list = std.ArrayList(Depth).init(allocator);
    defer list.deinit();
    var buf: [1024]u8 = undefined;
    while (try input.readUntilDelimiterOrEof(&buf, '\n')) |line| {
        try list.append(try std.fmt.parseInt(Depth, line, 10));
    }
    // Part 1:
    try std.fmt.format(output, "{}\n", .{countIncreases(list.items, 1)});
    // Part 2:
    try std.fmt.format(output, "{}\n", .{countIncreases(list.items, 3)});
}

fn countIncreases(list: []Depth, windowSize: u64) u64 {
    var sum: Depth = 0;
    var i: u64 = 0;
    while (i < windowSize) : (i += 1) {
        sum += list[i];
    }
    var prev = sum;
    var count: u64 = 0;
    while (i < list.len) : (i += 1) {
        sum -= list[i - windowSize];
        sum += list[i];
        if (sum > prev) {
            count += 1;
        }
        prev = sum;
    }
    return count;
}
