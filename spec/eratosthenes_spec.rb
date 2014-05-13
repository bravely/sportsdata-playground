require File.join(File.dirname(__FILE__), "../lib/eratosthenes.rb")

=begin
  Sieve of Eratosthenes algorithm for finding all prime numbers up to N. http://en.wikipedia.org/wiki/Sieve_of_Eratosthenes

  Algorithm description:

  A prime number is a natural number which has exactly two distinct natural number divisors: 1 and itself.
  To find all the prime numbers less than or equal to a given integer n by Eratosthenes' method:

  1. Create a list of consecutive integers from 2 through n: (2, 3, 4, ..., n).
  2. Initially, let p equal 2, the first prime number.
  3. Starting from p, enumerate its multiples by counting to n in increments of p, 
     and mark them in the list (these will be 2p, 3p, 4p, etc.; the p itself should not be marked).
  4. Find the first number greater than p in the list that is not marked. If there was no such number, stop. 
     Otherwise, let p now equal this new number (which is the next prime), and repeat from step 3.
     When the algorithm terminates, all the numbers in the list that are not marked are prime.

  The main idea here is that every value for p is prime, 
  because we have already marked all the multiples of the numbers less than p. 
  Note that some of the numbers being marked may have already been marked earlier (e.g. 15 will be marked both for 3 and 5).

  As a refinement, it is sufficient to mark the numbers in step 3 starting from p2, 
  as all the smaller multiples of p will have already been marked at that point. 
  This means that the algorithm is allowed to terminate in step 4 when p2 is greater than n.[1]
  
  Another refinement is to initially list odd numbers only, (3, 5, ..., n), and count in increments of 2p in step 3, 
  thus marking only odd multiples of p.
=end


describe "Sieve of Eratosthenes algorithm for finding all prime numbers" do
  
  it "should generate list, including only 2" do
    service = Eratosthenes.new(2)
    service.primes.should == [2]
  end

  it "should generate list, including 2 and 3" do
    service = Eratosthenes.new(3)
    service.primes.should == [2, 3]

    service = Eratosthenes.new(4)
    service.primes.should == [2, 3]
  end

  it "should generate list of prime numbers upto 11" do
    service = Eratosthenes.new(11)
    service.primes.should == [2,3,5,7,11]
  end

  it "should generate list of prime numbers upto 109" do
    service = Eratosthenes.new(111)
    service.primes.should == [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,
                              79,83,89,97,101,103,107,109]
  end
  
end