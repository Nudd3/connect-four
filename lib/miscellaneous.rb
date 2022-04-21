# frozen_string_literal: false

# module containing the icons used when printing the board
module Miscellaneous
  def empty_circle
    "\u25cb"
  end

  def red_circle
    "\e[31m\u25cf\e[0m"
  end

  def blue_circle
    "\e[34m\u25cf\e[0m"
  end
end
