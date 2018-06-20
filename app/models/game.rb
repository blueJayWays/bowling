class Game < ApplicationRecord
  has_many :frames

  def finished?
    self.frames.count == 10
  end

  def calculate_score
    score = 0
    self.frames[0..-2].each_with_index do |frame, i|
      if frame.strike?
        score += 10 + next_frame(i).first
        score += get_second_value(i)
      elsif frame.spare?
        score += 10 + next_frame(i).first
      else
        score += frame.first + frame.second
      end
      @frames_score << score
    end
    total_score
  end

  def next_frame(index)
    self.frames[index+1]
  end

  def get_second_value(index)
    if next_frame(index).second.nil?
      return next_frame(index+1).first
    else
      return next_frame(index).second
    end
  end

  def last_score
    last = self.frames.last
    score = last.first + last.second
    score = score+last.third unless last.third.nil?
    score
  end

  def frames_score
    @frames_score = []
    calculate_score
    @frames_score
  end

  def total_score
    self.score = @frames_score.last + last_score
    self.save
  end
end
