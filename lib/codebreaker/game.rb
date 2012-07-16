module Codebreaker
  class Game

    def initialize(output)
      @output = output
    end

    def start(secret)
      @winner = false
      @secret = secret
      @output.puts "Welcome to Codebreaker! [Enter 'g' to give up]"
      @output.puts 'Enter guess:'
    end

    def guess(guess)
      marker = Marker.new(@secret, guess)
      @output.puts '+' * marker.exact_match_count +
                   '-' * marker.number_match_count
      win if guess == @secret
    end

    def win?
      @winner
    end

    private

    def win
      @winner = true
      @output.puts "Congratulations! You're Winner!"
      @output.puts "Another round? [y/n]"
    end
  end
end
