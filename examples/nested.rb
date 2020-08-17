# frozen_string_literal: true

require_relative "../lib/tty-box"

box_mini = TTY::Box.frame "Drawing a box in", "terminal emulator", padding: 3, align: :center, count: 1
box = TTY::Box.frame box_mini, box_mini, padding: 3, align: :center, count: 7
box1 = TTY::Box.frame "Drawing a box in", "terminal emulator", padding: 3, align: :center, count: 2
main_box = TTY::Box.frame(box, box1)

puts main_box
