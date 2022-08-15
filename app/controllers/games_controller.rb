class GamesController < ApplicationController
  def new
    @letters = [('A'..'Z')].map(&:to_a).flatten
  end

  def score
  end

  def home
  end
end
