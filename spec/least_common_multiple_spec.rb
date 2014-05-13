require File.join(File.dirname(__FILE__), "../lib/lcm.rb")

=begin
The least common multiple of a set of integers is the smallest positive integer that is a multiple of all of the integers in the set.

http://en.wikipedia.org/wiki/Least_common_multiple

Write a function that takes an array of integers and efficiently calculates and returns the LCM.
=end

describe "Least Common Multiple" do
  before(:all) do
    @service = LCMService.new
  end

  it "should not calculate LCM for a zero or nil argument" do
    @service.lcm(0,4).should be_nil
    @service.lcm(2, nil).should be_nil
  end

  it "should not calculate LCM for negative arguments" do
    @service.lcm(4, -6).should be_nil
  end

  it "should calculate LCM of 4 and 6" do
    @service.lcm(4,6).should == 12
  end

end
