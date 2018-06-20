require 'rails_helper'

RSpec.describe Frame, type: :model do
  frame = Frame.new

  it "rolls the first time" do
    first_roll = frame.first_roll
    expect(first_roll).to be <= 10
  end

  it "rolls the second time" do
    second_roll = frame.second_roll
    expect(second_roll).to be_nil if frame.strike?
    expect(second_roll).to be <= 10 unless frame.strike?

  end

  it "rolls the third time" do
    third_roll = frame.roll
    expect(third_roll).to be <= 10
    expect(third_roll).not_to be_nil
  end

  it "is a strike" do
    frame.first = 10
    expect(frame.strike?).to be true
  end

  it "is a spare" do
    frame.first = rand(10)
    frame.second = 10-frame.first
    expect(frame.spare?).to be true
  end

  it "is a spare" do
    frame.first = rand(10)
    frame.second = 10-frame.first
    expect(frame.spare?).to be true
  end
end
