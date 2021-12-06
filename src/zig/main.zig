// Copyright 2021 Mitchell Kember. Subject to the MIT License.

const std = @import("std");

pub fn main() !void {
    // Read command-line arguments.
    var args = std.process.args();
    if (!args.skip()) unreachable;
    const test_num = args.nextPosix() orelse return error.TooFewArgs;
    const input_path = args.nextPosix() orelse return error.TooFewArgs;

    // Set up the input and output.
    var file = try std.fs.cwd().openFile(input_path, .{});
    defer file.close();
    var input = std.io.bufferedReader(file.reader()).reader();
    var output = std.io.getStdOut().writer();

    // Dispatch by date.
    const year_date = try std.fmt.parseUnsigned(u64, test_num, 10);
    return switch (year_date) {
        2021_01 => @import("2021_01.zig").run(input, output),
        2021_02 => @import("2021_02.zig").run(input, output),
        2021_03 => @import("2021_03.zig").run(input, output),
        else => error.InvalidYear,
    };
}
