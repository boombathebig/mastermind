class Computer
    def initialize()
        @computer_code = []
        self.create_code
        self.get_code
    end
    
    def create_code
        4.times do
            @computer_code.push(1+rand(6))
        end
    end

    def get_code
        return @computer_code
    end
end


