# Enter your procedural solution here!
require 'pry'

prime_nums = [3]

def largest_prime_factor(input, prime_nums=[3])
  return 2 if input == 2
  
  while input % 2 == 0
    input = input/2
  end

  while input % 3 == 0
    input = input/3
  end

  while true
    #binding.pry
    next_prime = next_prime_number(prime_nums)
    if input > next_prime
      while input % next_prime == 0 && input != next_prime
        input =  input / next_prime
      end
    else
      return input
    end
  end
end

def next_prime_number(prime_nums)
  current_num = prime_nums[-1] + 2

  while true
    if is_prime?(prime_nums, current_num)
      prime_nums << current_num #Take it somewhere else goddamnit! A method is supposed to do ONE thing
      return current_num
    else
      current_num += 2
    end
  end
end

def is_prime?(prime_nums, number)
  return true if prime_nums.all? {|pm| number % pm > 0 }
  false
end
