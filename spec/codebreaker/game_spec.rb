require 'spec_helper'

module Codebreaker
  describe Game do
    let(:output) { double('output').as_null_object }
    let(:game)   { Game.new(output) }

    describe "#start" do
      after(:each) { game.start('1234') }

      it "sends a welcome messgae" do
        output.should_receive(:puts).with("Welcome to Codebreaker! [Enter 'g' to give up]")
      end

      it "prompts for the first guess" do
        output.should_receive(:puts).with('Enter guess:')
      end
    end

    describe "#guess" do
      before(:each) { game.start('1234') }
      after(:each)  { game.guess('1234') }

      it "sends a mark to output" do
        output.should_receive(:puts).with('++++')
      end

      context "wining condition" do
        it "sends a wining message" do
          output.should_receive(:puts).with("Congratulations! You're Winner!")
        end

        it "sends a request for next round" do
          output.should_receive(:puts).with("Another round? [y/n]")
        end
      end
    end
  end
end
