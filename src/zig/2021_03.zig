// Copyright 2021 Mitchell Kember. Subject to the MIT License.

const std = @import("std");
const fmt = std.fmt;
const math = std.math;

// The test input has 1000 lines, which we can count to in u16.
const Value = u16;

pub fn run(input: anytype, output: anytype) !void {
    // Build a max heap where a left branch indicates a 0 bit, a right branch
    // indicates a 1 bit, and values are the number of numbers with that prefix.
    // The test input has 12-bit numbers, so our tree has height 13.
    const height = 13;
    var heap = [_]Value{0} ** (1 << height);
    var i: usize = 0;
    var size: u64 = 0;
    while (true) {
        const byte = input.readByte() catch |err| switch (err) {
            error.EndOfStream => break,
            else => |e| return e,
        };
        heap[i] += 1;
        switch (byte) {
            '0' => i = i * 2 + 1,
            '1' => i = i * 2 + 2,
            '\n' => {
                i = 0;
                size += 1;
            },
            else => return error.InvalidInput,
        }
    }

    // Calculate gamma and epsilon by taking the sum of the left (zero) children
    // along each row and checking if it's less than half the total size. If so,
    // it is less than the sum of the right children, and the mode is 1.
    var gamma: u64 = 0;
    var epsilon: u64 = 0;
    var level: u64 = 1;
    i = 1;
    while (level < height) : (level += 1) {
        var numZero: u64 = 0;
        const nextRow = i * 2 + 1;
        while (i < nextRow) : (i += 2) {
            numZero += heap[i];
        }
        const mode = @boolToInt(numZero * 2 <= size);
        gamma = gamma << 1 | mode;
        epsilon = epsilon << 1 | ~mode;
    }

    // Part 1:
    try fmt.format(output, "{}\n", .{gamma * epsilon});

    // Calculate the oxygen generator rating by descending down the heap, taking
    // the most common branch each time, or 1 if they are the same.
    var oxygen: u64 = 0;
    level = 1;
    i = 0;
    while (level < height) : (level += 1) {
        const zeroChild = i * 2 + 1;
        const oneChild = i * 2 + 2;
        oxygen <<= 1;
        switch (bitCriteria(heap[zeroChild], heap[oneChild], .gt, 1)) {
            0 => i = zeroChild,
            1 => {
                i = oneChild;
                oxygen |= 1;
            }
        }
    }

    // Calculate the CO2 scrubber rating in a similar way. However, here we need
    // to be careful because a 0 value in the heap means an empty node, whereas
    // the least common bit must occur in at least one number.
    var co2: u64 = 0;
    level = 1;
    i = 0;
    while (level < height) : (level += 1) {
        const zeroChild = i * 2 + 1;
        const oneChild = i * 2 + 2;
        co2 <<= 1;
        switch (bitCriteria(heap[zeroChild], heap[oneChild], .lt, 0)) {
            0 => i = zeroChild,
            1 => {
                i = oneChild;
                co2 |= 1;
            }
        }
    }

    // Part 2:
    try fmt.format(output, "{}\n", .{oxygen * co2});
}

fn bitCriteria(c0: Value, c1: Value, op: math.CompareOperator, default: u1) u1 {
    if (c0 == 0 and c1 == 0) unreachable;
    if (c0 == 0) return 1;
    if (c1 == 0) return 0;
    if (c0 == c1) return default;
    if (math.compare(c0, op, c1)) return 0;
    return 1;
}
