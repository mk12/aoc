// Copyright 2021 Mitchell Kember. Subject to the MIT License.

const std = @import("std");

// This buffer is big enough for the solution that needs the most memory. We do
// not use heap allocations anywhere.
var buffer: [4096]u8 = undefined;

pub fn main() !void {
    // Read command-line arguments.
    var args = std.process.args();
    if (!args.skip()) unreachable;
    const test_num = args.nextPosix() orelse return error.TooFewArgs;
    const input_path = args.nextPosix() orelse return error.TooFewArgs;

    // Set up the allocator, input, and output.
    var allocator = std.heap.FixedBufferAllocator.init(&buffer).allocator();
    var file = try std.fs.cwd().openFile(input_path, .{});
    defer file.close();
    var input = std.io.bufferedReader(file.reader()).reader();
    var output = std.io.getStdOut().writer();

    // Dispatch by date.
    const year_date = try std.fmt.parseUnsigned(u64, test_num, 10);
    return switch (year_date) {
        2021_01 => @import("2021_01.zig").run(allocator, input, output),
        // 2021_02 => @import("2021_02.zig").run(allocator, input, output),
        // 2021_03 => @import("2021_03.zig").run(allocator, input, output),
        // 2021_04 => @import("2021_04.zig").run(allocator, input, output),
        else => error.InvalidDate,
    };
}
