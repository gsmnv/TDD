require 'spec_helper'

module Codebreaker
  describe Game do
    let(:output) { double('output').as_null_object }
    let(:game)   { Game.new(output) }

    describe "#start" do
      it "sends a welcome messgae" do
        output.should_receive(:puts).with("Welcome to Codebreaker! [Enter 'g' to give up]")
        game.start('1234')
      end

      it "prompts for the first guess" do
        output.should_receive(:puts).with('Enter guess:')
        game.start('1234')
      end
    end

    describe "#guess" do
      it "sends a mark to output" do
        game.start('1234')
        output.should_receive(:puts).with('++++')
        game.guess('1234')
      end

      context "wining condition" do
        it "sends a wining message" do
          game.start('1234')
          output.should_receive(:puts).with("Congratulations! You're Winner!")
          game.guess('1234')
        end

        it "sends a request for next round" do
          game.start('1234')
          output.should_receive(:puts).with("Another round? [y/n]")
          game.guess('1234')
        end
      end
    end
  end
end
