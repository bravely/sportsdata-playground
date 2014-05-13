class LCMService

  def lcm(a, b)
    if a.nil? || b.nil?
      return nil
    end
    if (a < 1) || (b < 1)
      return nil
    end
    return (a / gcd(a,b)) * b
  end

  private

  def gcd(a, b)
    if a < b
      a, b = b, a
    end
    loop do
      remainder = a % b
      if remainder == 0
        return b
      else
        a, b = b, remainder
      end
    end
  end

end
