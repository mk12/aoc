// Copyright 2021 Mitchell Kember. Subject to the MIT License.

const std = @import("std");

pub fn main() !void {
    // Set up an arena allocator to use in solutions.
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = &arena.allocator;

    // Read command-line arguments.
    var args = std.process.args();
    if (!args.skip()) unreachable;
    // const test_num = args.nextPosix() orelse return error.TooFewArgs;
    const input_path = args.nextPosix() orelse return error.TooFewArgs;

    // Parse YEAR_DATE argument.
    // var it = std.mem.split(u8, test_num, "_");
    // const yearStr = it.next() orelse return error.InvalidTestNum;
    // const dayStr = it.next() orelse return error.InvalidTestNum;
    // const year = try std.fmt.parseInt(u64, yearStr, 10);
    // const day = try std.fmt.parseInt(u64, dayStr, 10);

    // Set up the input and output.
    var file = try std.fs.cwd().openFile(input_path, .{});
    defer file.close();
    var input = std.io.bufferedReader(file.reader()).reader();
    var output = std.io.getStdOut().writer();

    // Dispatch to the specified solution.
    const f = @import("2021_01.zig");
    var solution: *fn(*std.mem.Allocator, anytype, anytype) anyerror!void = undefined;
    solution = &f.run;
    // switch (year) {
    //     2021 => switch (day) {
    //         1 => f.run,
    //         else => return error.InvalidDay,
    //     },
    //     else => return error.InvalidYear,
    // };
    return solution(allocator, input, output);
}
