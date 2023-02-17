# frozen_string_literal: true

require_relative "porcus_loqui/version"
require "set"

module PorcusLoqui
  class Error < StandardError; end

  def self.[](string)
    string.split(" ").map do |word|
      translate(word)
    end.join(" ")
  end

  def self.translate(word)
    characters = word.chars

    if CONSONENTS.member?(characters[0]) && VOWELS.member?(characters[1])
      characters.rotate!
      "#{characters.join("")}ay"
    elsif CONSONENTS.member?(characters[0]) && CONSONENTS.member?(characters[1])
      2.times { characters.rotate! }
      "#{characters.join("")}ay"
    else
      "#{word}way"
    end
  end

  private

  VOWELS = %w[A E I O U a e i o u].to_set.freeze
  CONSONENTS = ((("A".."Z").to_a + ("a".."z").to_a).to_set - VOWELS).freeze
end
