# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'roman_to_arabic'

describe RomanToArabic do
  it "should retun the integer euivalent of the roman numder" do
    @roman_to_arabic = RomanToArabic.new('VI')
    @roman_to_arabic.to_integer.should == 6

    @roman_to_arabic = RomanToArabic.new('XIX')
    @roman_to_arabic.to_integer.should == 19

    @roman_to_arabic = RomanToArabic.new('MCMXLIV')
    @roman_to_arabic.to_integer.should == 1944
  end

  it "should raise RomanNumeralError for invalid roman number" do
    lambda{RomanToArabic.new('1234').to_integer}.should raise_error(RomanNumeralError, 'Roman numeral is invalid')

    lambda{RomanToArabic.new('MKILCV').to_integer}.should raise_error(RomanNumeralError, 'Roman numeral is invalid')

    lambda{RomanToArabic.new('CCCC').to_integer}.should raise_error(RomanNumeralError, 'Roman numeral is invalid')

    lambda{RomanToArabic.new('ASFVI').to_integer}.should raise_error(RomanNumeralError, 'Roman numeral is invalid')

    lambda{RomanToArabic.new('IMMM').to_integer}.should raise_error(RomanNumeralError, 'Roman numeral is invalid')
  end
end

