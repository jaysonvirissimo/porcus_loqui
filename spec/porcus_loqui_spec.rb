# frozen_string_literal: true

require "spec_helper"

RSpec.describe PorcusLoqui do
  it "has a version number" do
    expect(PorcusLoqui::VERSION).not_to be nil
  end

  describe "[]" do
    xit "translates to Pig Latin" do
      {
        # "hello" => "ellohay",
        # "eat" => "eatway",
        #"yellow" => "yellowway", # Why not ellowyay?
        # "eat world" => "eatway orldway",
        "Hello" => "Ellohay",
        # "Apples" => "Applesway",
        # "eat… world?!" => "eatway… orldway?!",
        "school" => "oolschay",
        "quick" => "ickquay",
        "she’s great!" => "e’sshay eatgray!",
        "HELLO" => "ELLOHAY",
        "Hello There" => "Ellohay Erethay"
      }.each do |english, pig_latin|
        expect(described_class[english]).to eq(pig_latin)
      end
    end
  end

  describe ".translate" do
    context "when it starts with a consonent cluster" do
      specify do 
        expect(described_class["trash"]).to eq("ashtray")
      end
    end

    context "when it starts with a consonent (not in a cluster)" do
      specify do
        expect(described_class["pig"]).to eq("igpay")
      end
    end

    context "when it starts with a vowel" do
      specify do
        expect(described_class["eat"]).to eq("eatway")
      end
    end
  end
end
