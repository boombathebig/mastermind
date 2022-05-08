
def new_game()
    $turn = 1
    computer = Computer.new()
    player = Player.new()
    @game_code= computer.get_code
    p computer.get_code
    until (player.win? == true) || $turn == 13
        round(player)
        $turn +=1
    end
    if (player.win? == true)
        play_again?()
    end
    if ($turn == 13)
        play_again?()
    end
end

def round(player)
    player.get_guess()
    colorize(player.guess)
    player.guess_compare(@game_code)
    colorize_clue(player.hint)
    player.win?
end

def play_again?()
    puts "Would you like to play again? Please enter y or n."
    play_again = gets.chomp.downcase
    if play_again == "y"
        new_game()
    elsif play_again == "n"
        puts "Thanks for playing, have a great day!"
        exit
    else
        play_again?()
    end
end 

class Player
    attr_accessor :guess, :hint

    def initialize
        @guess= ""
        @hint = ""
        @win = false
    end

    def get_guess()
        puts "Turn #{$turn}. Please enter your guess, four numbers (1-6)."
        @guess = gets.chomp
        if %r{\d{4,}}.match(@guess)
            @guess= @guess.split("")
            @guess= @guess.map {|n| n.to_i}
            return @guess
        else 
            get_guess()
        end
    end
    
    def guess_compare(code)
        compare_code = Array.new(code)
        @guess.each_index do|n|
            if compare_code.include?(@guess[n]) && compare_code[n] == @guess[n]
                @hint += "X"
                compare_code[n]= "X"
            end
        end
        @guess.each_index do|n|
            if compare_code.include?(@guess[n])
                @hint +="O"
                compare_code[compare_code.find_index(@guess[n])]= "O"
            end
        end
    end

    def win?
        if @hint == "XXXX"
            return true
        else
            @hint = ""
            return false
        end
    end
end

new_game()

