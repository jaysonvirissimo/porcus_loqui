# frozen_string_literal: true

require_relative "porcus_loqui/version"


module PorcusLoqui
  class Error < StandardError; end

  def self.[](string)
    string.split(" ").map do |word|
      translate(word)
    end.join(" ")
  end

  def self.translate(word)
    word
  end
end
