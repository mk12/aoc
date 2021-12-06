// Copyright 2021 Mitchell Kember. Subject to the MIT License.

const std = @import("std");
const fmt = std.fmt;
const mem = std.mem;

const Depth = u16;

pub fn run(input: anytype, output: anytype) !void {
    var buf: [1024]u8 = undefined;
    var horiz: u64 = 0;
    var depth: u64 = 0;
    var aim: u64 = 0;
    while (try input.readUntilDelimiterOrEof(&buf, '\n')) |line| {
        const i = mem.indexOfScalar(u8, line, ' ') orelse return error.InvalidInput;
        const cmd = line[0..i];
        const val = try fmt.parseUnsigned(u64, line[i + 1 ..], 10);
        if (mem.eql(u8, cmd, "forward")) {
            horiz += val;
            depth += aim * val;
        } else if (mem.eql(u8, cmd, "down")) {
            aim += val;
        } else if (mem.eql(u8, cmd, "up")) {
            aim -= val;
        } else {
            return error.InvalidCommand;
        }
    }
    // Part 1:
    try fmt.format(output, "{}\n", .{horiz * aim});
    // Part 2:
    try fmt.format(output, "{}\n", .{horiz * depth});
}
