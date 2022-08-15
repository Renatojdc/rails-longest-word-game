require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10).join
  end

  def score
    @user_input = params[:input]
    @word = params[:letters]
    @include = include?(@word, @user_input)
    @english_word = english_word?(@user_input)
    # if @letters.include?(user_input) ? @score = english_word?(user_input) : @score = 'Invalid word. Try again.'
  end

  def home
  end

  private

  def include?(word, letters)
    word.chars.all? do |letter|
      word.count(letter) <= letters.count(letter)
    end
  end

  def english_word?(word)
    file_open = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    file_json = JSON.parse(file_open.read)
    file_json['found']
  end
end
