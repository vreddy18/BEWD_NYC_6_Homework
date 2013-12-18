class SecretNumber
  attr_reader :guesses, :number
  def initialize(number=nil)
    @number = number
    @number = 4 unless @number # Random number between 1 and 10
    @guesses = 3
  end

  def greeting
    return "Welcome to the secret number game!"
  end

  def starting_instructions
    return "You have three guesses to guess the right number."
  end

  def play
    greeting 
    starting_instructions
    @guesses.downto(1) do |number_of_guesses|
      puts "You have #{number_of_guesses} guesses!"
      puts "Please make a guess:"
      guess = gets.chomp.to_i
      return if correct_number?(guess)
      if guess < @number 
        puts "Guess higher!"
      else
        puts "Guess lower!"
      end
    end
    puts "Sorry! You did not guess correctly!"
  end

  def correct_number?(guess)
    if @number == guess
        return true
        puts "Congratulations! You win!"
    else
        return false
  end
end

private
# Don't touch anything below this line
def ____(*args)
  abort "Incomplete File. Go back and fill in ____"
end