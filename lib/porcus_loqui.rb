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
    potential_cluster = characters.take(2).join
    if CONSONENT_CLUSTERS.member?(potential_cluster.downcase)
      characters.rotate! until VOWELS.member?(characters.first)
      "#{characters.join("")}ay"
    else
      word
    end
  end

  private

  VOWELS = %w(A E I O U a e i o u).to_set.freeze
  CONSONENT_CLUSTERS = %w(bl br ch ck cl cr dr fl fr gh gl gr ng ph pl pr qu sc sh sk sl sm sn sp st sw th tr tw wh wr).to_set.freeze
  CONSONENTS = ((("A".."Z").to_a + ("a".."z").to_a).to_set - VOWELS).freeze
end
