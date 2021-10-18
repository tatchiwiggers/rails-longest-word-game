require "open-uri"

class GamesController < ApplicationController
  VOWELS = %w(A E I O U Y)

  def home
  end

  def new
    # generates 5 arrays of vowels then samples 1 vowel oout of each array
    @letters = Array.new(5) { VOWELS.sample }
    # generates an array from A to Z, subtracts the 5 vowels
    # then samples one random letter 5 times and throws
    # inside the existing letters array
    @letters += Array.new(5) { (('A'..'Z').to_a - VOWELS).sample }
    # now we have an array with a total of 10 letters
    # shuffles all the letters inside the existing array
    @letters.shuffle!
  end

  def score
    @letters = params[:letters].split
    @word = (params[:word] || "").upcase
    @included = included?(@word, @letters)
    @english_word = english_word?(@word)
  end

  private

  def included?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end

  def english_word?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end
end
