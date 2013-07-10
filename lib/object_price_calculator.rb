# Class to calculate the price of metal and metal with dirt.

require 'substance'
require 'metal'
require 'dirt'
require 'seperator'
require 'roman_to_arabic'

class ObjectPriceCalculator
  def initialize(object, price=nil)
    @object = object
    @price = price
  end

  def get_metal_object_with_price
    seperator_obj ||= Seperator.new(@object)
    metal = seperator_obj.get_metal
    unless metal.nil?
      metal_price = @price/get_dirt_count_in_integer.to_f 
      @metal ||= Metal.new(metal,metal_price)
    end
  end

  def get_object_price
    seperator_obj ||= Seperator.new(@object)
    dirt_count = get_dirt_count_in_integer
    metal_obj = seperator_obj.get_metal_obj
    price = (dirt_count * metal_obj.value) unless metal_obj.nil?
  end

  def get_dirt_count_in_roman
    dirt_count = ''
    seperator_obj ||= Seperator.new(@object)
    dirt = seperator_obj.get_dirt
    dirt.each{ |d| dirt_count << d.value if d.is_a?(Dirt)}
    dirt_count
  end

  def get_dirt_count_in_integer
    roman_count = get_dirt_count_in_roman
    RomanToArabic.new(roman_count).to_integer
  end
end
