class Frame < ApplicationRecord
  belongs_to :game

  def roll(pins = 10)
    rand(pins + 1)
  end

  def first_roll
    self.first = roll
  end

  def strike?
    self.first == 10
  end

  def second_strike?
    self.second == 10
  end

  def second_roll
    self.second = roll(10 - self.first) unless strike?
  end

  def third_roll
    self.third = roll(10 - self.second)
  end

  def spare?
    strike? ? false : self.first + self.second == 10
  end

  def last_frame!
    first_roll
    if strike?
      self.second = roll
      second_strike? ? self.third = roll : third_roll
    else
      second_roll
      if spare?
        self.third = roll
      end
    end
    self if self.save
  end

  def play!
    first_roll
    second_roll
    self if self.save
  end
end
