// Copyright 2021 Mitchell Kember. Subject to the MIT License.
// Advent of Code 2021
// Day 3: Binary Diagnostic

const std = @import("std");
const fmt = std.fmt;
const math = std.math;

// The test input uses 12-bit numbers.
const Number = u12;

// The test input has 1000 lines. We can count up to that in `u16`.
const Count = u16;

pub fn run(input: anytype, output: anytype) !void {
    // Build a binary max heap where a left branch indicates a 0 bit, a right
    // branch indicates a 1 bit, and node values count numbers with that prefix.
    var heap = [_]Count{0} ** (2 << @bitSizeOf(Number));
    var i: usize = 0;
    while (true) {
        const byte = input.readByte() catch |err| switch (err) {
            error.EndOfStream => break,
            else => |e| return e,
        };
        heap[i] += 1;
        switch (byte) {
            '0' => i = i * 2 + 1,
            '1' => i = i * 2 + 2,
            '\n' => i = 0,
            else => return error.InvalidInput,
        }
    }

    // Calculate gamma by taking the sum of the left (zero) children along each
    // row and checking if it's less than half the total count. If so, then it's
    // less than the sum of the right children, and the mode is 1. Otherwise, 0.
    const half_total_count = heap[0] / 2;
    var gamma: Number = 0;
    i = 1;
    while (i < heap.len - 1) {
        var zero_count: Count = 0;
        const end = i * 2;
        while (i < end) : (i += 2) {
            zero_count += heap[i];
        }
        const mode = @boolToInt(zero_count <= half_total_count);
        gamma = gamma << 1 | mode;
    }

    // Epsilon is just the bitwise NOT of gamma. To calculate the product of
    // gamma and epsilon, we need more bits to avoid overflow.
    const epsilon = ~gamma;
    const power_consumption = @as(u64, gamma) * @as(u64, epsilon);

    // Part 1:
    try fmt.format(output, "{}\n", .{power_consumption});

    // Calculate the oxygen generator rating and CO2 scrubber rating by
    // descending down the heap, taking the most/least common branch each time.
    var oxygen: u64 = 0;
    i = 0;
    while (i < heap.len / 2) {
        const left = i * 2 + 1;
        const right = i * 2 + 2;
        const bit = bitCriteria(heap[left], heap[right], .gt, 1);
        oxygen = oxygen << 1 | bit;
        i = left + bit;
    }
    var co2: u64 = 0;
    i = 0;
    while (i < heap.len / 2) {
        const left = i * 2 + 1;
        const right = i * 2 + 2;
        const bit = bitCriteria(heap[left], heap[right], .lt, 0);
        co2 = co2 << 1 | bit;
        i = left + bit;
    }
    const life_support_rating = oxygen * co2;

    // Part 2:
    try fmt.format(output, "{}\n", .{life_support_rating});
}

// Given the counts `c0`/`c1` of numbers with a 0/1 bit, return the one that
// compares `op` to the other, or `default` if they are the same. If `c0` or
// `c1` is zero, considers it an unset node and returns the other branch.
fn bitCriteria(c0: Count, c1: Count, op: math.CompareOperator, default: u1) u1 {
    if (c0 == 0 and c1 == 0) unreachable;
    if (c0 == 0) return 1;
    if (c1 == 0) return 0;
    if (c0 == c1) return default;
    if (math.compare(c0, op, c1)) return 0;
    return 1;
}
