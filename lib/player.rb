# frozen_string_literal: false

# player class
class Player
  attr_accessor :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def to_s
    "#{@name}, #{@symbol}"
  end
end
