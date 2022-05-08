Pegs = {
    1 => "\e[42m 1 \e[0m",
    2 => "\e[43m 2 \e[0m",
    3 => "\e[44m 3 \e[0m",
    4 => "\e[45m 4 \e[0m",
    5 => "\e[46m 5 \e[0m",
    6 => "\e[47m 6 \e[0m"
    }
    
    def colorize(hint)
        hint_colorized= String.new("")
        hint.each do |n|
            unless n == nil
            hint_colorized += Pegs[n]
        end
    end
        puts hint_colorized
    end

Clue_colors = {
    "X" => "\e[91m\u25CF\e[0m ",
    "O" => "\e[37m\u25CB\e[0m "
    }

def colorize_clue(clue)
    clue_colorized = String.new("")
    clue_array = clue.split("")
    clue_array.each do |n|
        clue_colorized += Clue_colors[n]
    end
    puts clue_colorized
end

