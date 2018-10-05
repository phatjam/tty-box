RSpec.describe TTY::Box, ':border option' do
  it "creates frame with double lines and no position" do
    box = TTY::Box.frame(
      width: 35, height: 4,
      border: :thick
    )

    expect(box).to eq([
      "╔═════════════════════════════════╗\n",
      "║                                 ║\n",
      "║                                 ║\n",
      "╚═════════════════════════════════╝\n"
    ].join)
  end

  it "creates frame with double lines" do
    box = TTY::Box.frame(
      top: 0, left: 0,
      width: 35, height: 4,
      border: :thick
    )

    expect(box).to eq([
      "\e[1;1H╔═════════════════════════════════╗",
      "\e[2;1H║\e[2;35H║",
      "\e[3;1H║\e[3;35H║",
      "\e[4;1H╚═════════════════════════════════╝"
    ].join)
  end

  it "creates frame with without top & bottom borders" do
    box = TTY::Box.frame(
      top: 0, left: 0,
      width: 35, height: 4,
      border: {
        type: :thick,
        top: false,
        bottom: false
      }
    ) { "Hello Piotr!" }

    expect(box).to eq([
      "\e[2;1H║Hello Piotr!                     \e[2;35H║",
      "\e[3;1H║\e[3;35H║",
    ].join)
  end

  it "creates frame without left & right borders" do
    box = TTY::Box.frame(
      top: 0, left: 0,
      width: 35, height: 4,
      border: {
        left: false,
        right: false
      }
    ) { "Hello Piotr!" }

    expect(box).to eq([
      "\e[1;1H┌─────────────────────────────────┐",
      "Hello Piotr!                     ",
      "\e[4;1H└─────────────────────────────────┘"
    ].join)
  end

  it "creates frame with all corners changed to cross" do
    box = TTY::Box.frame(
      width: 10, height: 4,
      border: {
        top: :line,
        top_left: :cross,
        top_right: :cross,
        bottom: :line,
        bottom_left: :cross,
        bottom_right: :cross
      }
    )

    expect(box).to eq([
      "┼────────┼\n",
      "│        │\n",
      "│        │\n",
      "┼────────┼\n"
    ].join)
  end

  it "fails to recognise border value" do
    expect {
      TTY::Box.frame(border: {left: :unknown})
    }.to raise_error(ArgumentError, "Invalid border value: 'unknown' for :left")
  end

  it "fails to recognise border option" do
    expect {
     TTY::Box.frame(width: 35, height: 4, border: [:unknown])
    }.to raise_error(ArgumentError, "Wrong value `[:unknown]` for :border configuration option")
  end
end
