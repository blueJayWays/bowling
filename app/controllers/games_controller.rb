class GamesController < ApplicationController

  def create
    @game = Game.create!
    9.times do |i|
      frame = Frame.new(game_id: @game.id)
      @game.frames << frame.play!
    end
    @game.frames << Frame.new(game_id: @game.id).last_frame!
  end

  def index
    create
    @game
  end
end
