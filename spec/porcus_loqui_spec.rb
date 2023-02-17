# frozen_string_literal: true

require "spec_helper"

RSpec.describe PorcusLoqui do
  describe "[]" do
    context "when it starts with two consonants " do
      it "moves the two consonants to the end of the word and adds 'ay' to the end" do
        expect(described_class["trash"]).to eq("ashtray")
      end
    end

    context "when it starts with a consonent and a vowel" do
      it "puts the first letter of the word at the end of the word and adds 'ay' to the end" do
        expect(described_class["pig"]).to eq("igpay")
      end
    end

    context "when it starts with a vowel" do
      it "adds the word 'way' at the end" do
        expect(described_class["eat"]).to eq("eatway")
      end
    end
  end
end
