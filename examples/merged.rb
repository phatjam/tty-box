# frozen_string_literal: true

require_relative "../lib/tty-box"

box1 = TTY::Box.frame("First Box", "With Two Lines", padding: 3, align: :center)
box2 = TTY::Box.frame("Second Box", padding: 3, align: :center)
box3 = TTY::Box.frame("Third Box", "With Three Lines", "Just Because", padding: 3, align: :center)

merged = TTY::Box.merge_boxes(box1, box2)
merged = TTY::Box.merge_boxes(merged, box3)
puts merged
