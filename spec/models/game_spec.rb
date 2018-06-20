require 'rails_helper'

RSpec.describe Game, type: :model do

  describe "Suggested test cases" do

    before(:each) do
       game = Game.new
     end

    it "12 rolls 12 strikes" do
      game = Game.new
      10.times do |i|
        frame = Frame.new(game_id: game.id)
        frame.first = 10
        game.frames << frame
      end
       game.frames.last.second = 10
       game.frames.last.third = 10
       game.frames_score
       expect(game.score).to be 300
    end

    it "20 rolls: 10 pairs of 9 and miss" do
      game = Game.new
      10.times do |i|
        frame = Frame.new(game_id: game.id)
        frame.first = 9
        frame.second = 0
        game.frames << frame
      end
       game.frames_score
       expect(game.score).to be 90
    end

    it "21 rolls: 10 pairs of 5 and spare, with a final 5" do
      game = Game.new
      10.times do |i|
        frame = Frame.new(game_id: game.id)
        frame.first = 5
        frame.second = 5
        game.frames << frame
      end
        game.frames.last.third = 5
       game.frames_score
       expect(game.score).to be 150
    end
  end

end
