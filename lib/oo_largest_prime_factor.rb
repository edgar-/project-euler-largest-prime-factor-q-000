# Enter your object-oriented solution here!

# Enter your procedural solution here!
require 'pry'

class LargestPrimeFactor
  def initialize(number)
    @number = number
    @prime_nums=[3]
  end
    
  def number
    return 2 if @number == 2

    while @number % 2 == 0
      @number = @number/2
    end

    while @number % 3 == 0
      @number = @number/3
    end

    while true
      #binding.pry
      next_prime = next_prime_number
      if @number > next_prime
        while @number % next_prime == 0 && @number != next_prime
          @number =  @number / next_prime
        end
      else
        return @number
      end
    end
  end

  def next_prime_number
    current_num = @prime_nums[-1] + 2

    while true
      if is_prime?(current_num)
        @prime_nums << current_num #Take it somewhere else goddamnit! A method is supposed to do ONE thing
        return current_num
      else
        current_num += 2
      end
    end
  end

  def is_prime?(number)
    return true if @prime_nums.all? {|pm| number % pm > 0 }
    false
  end
end