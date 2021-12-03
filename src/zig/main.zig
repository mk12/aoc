// Copyright 2021 Mitchell Kember. Subject to the MIT License.

const std = @import("std");

pub fn main() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = &arena.allocator;
    var args = std.process.args();
    if (!args.skip()) unreachable;
    const test_num = args.nextPosix() orelse return error.TooFewArgs;
    const input_path = args.nextPosix() orelse return error.TooFewArgs;
    var it = std.mem.split(u8, test_num, "_");
    const yearStr = it.next() orelse return error.InvalidTestNum;
    const dayStr = it.next() orelse return error.InvalidTestNum;
    const year = try std.fmt.parseInt(u64, yearStr, 10);
    const day = try std.fmt.parseInt(u64, dayStr, 10);
    var file = try std.fs.cwd().openFile(input_path, .{});
    defer file.close();
    var input = std.io.bufferedReader(file.reader()).reader();
    var output = std.io.getStdOut().writer();
    switch (year) {
        2021 => switch (day) {
            1 => return @import("2021_01.zig").run(allocator, input, output),
            else => return error.InvalidDay,
        },
        else => return error.InvalidYear,
    }
}
