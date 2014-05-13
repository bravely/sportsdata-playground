class Eratosthenes
  def initialize(max_number)
    if max_number.is_a? Integer
      @max = max_number
    else
      fail "#{max_number} is not an Integer."
    end
  end

  def primes
    sieve = (0..@max).to_a
    sieve[0] = sieve[1] = nil
    sieve.each do |part|
      next unless part
      break if part * part > @max
      (part*part).step(@max, part) { |match| sieve[match] = nil }
    end
    sieve.compact
  end

end
