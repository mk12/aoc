// Copyright 2021 Mitchell Kember. Subject to the MIT License.
// Advent of Code 2021
// Day 4: Giant Squid

const std = @import("std");
const fmt = std.fmt;
const heap = std.heap;

// Bingo numbers are from 0 to 99. This fits in `u7`.
const Number = u7;

// Bingo boards are 5 by 5.
const SideLength = 5;
const Size = SideLength * SideLength;

// TODO
const Cell = packed struct {
    number: Number,
    marked: bool,
};

// TODO
const Board = [Size]Cell;

var buffer: [4096]u8 = undefined;

pub fn run(input: anytype, output: anytype) !void {
    const allocator = heap.FixedBufferAllocator.init(&buffer).allocator();

    // Parse the list of bingo draws.
    var draws = std.ArrayList(Number).init(allocator);
    {
        var num: Number = 0;
        while (true) {
            const byte = try input.readByte();
            switch (byte) {
                '0'...'9' => num = num * 10 + @intCast(Number, byte - '0'),
                ',', '\n' => {
                    try draws.append(num);
                    num = 0;
                    if (byte == '\n') break;
                },
                else => return error.InvalidInput,
            }
        }
    }

    // Parse the bingo boards.
    var boards = std.ArrayList(Board).init(allocator);
    while (true) {
        const newline = input.readByte() catch |err| switch (err) {
            error.EndOfStream => break,
            else => |e| return e,
        };
        if (newline != '\n') return error.InvalidInput;
        const board = try boards.addOne();
        var i: usize = 0;
        while (i < Size) : (i += 1) {
            const byte1 = try input.readByte();
            var num: Number = switch (byte1) {
                ' ' => 0,
                '0'...'9' => @intCast(Number, byte1 - '0'),
                else => return error.InvalidInput,
            };
            const byte2 = try input.readByte();
            switch (byte2) {
                '0'...'9' => num = num * 10 + @intCast(Number, byte2 - '0'),
                else => return error.InvalidInput,
            }
            switch (try input.readByte()) {
                ' ', '\n' => {},
                else => return error.InvalidInput,
            }
            board[i] = .{ .number = num, .marked = false };
        }
    }

    const score = blk: {
        for (draws.items) |draw| {
            for (boards.items) |*board| {
                for (board) |*cell| {
                    if (cell.number == draw) cell.marked = true;
                }
                if (won(board)) {
                    var sum: u64 = 0;
                    for (board) |cell| {
                        if (!cell.marked) sum += cell.number;
                    }
                    break :blk sum * draw;
                }
            }
        }
        return error.NoWinner;
    };

    // Part 1:
    try fmt.format(output, "{}\n", .{score});

    // Part 2:
    try fmt.format(output, "{}\n", .{score});
}

fn won(board: *const Board) bool {
    {
        var i: usize = 0;
        outer: while (i < SideLength) : (i += 1) {
            var j: usize = 0;
            while (j < SideLength) : (j += 1) {
                if (!board[i * SideLength + j].marked) continue :outer;
            }
            return true;
        }
    }
    {
        var i: usize = 0;
        outer: while (i < SideLength) : (i += 1) {
            var j: usize = 0;
            while (j < SideLength) : (j += 1) {
                if (!board[j * SideLength + i].marked) continue :outer;
            }
            return true;
        }
    }
    return false;
}
