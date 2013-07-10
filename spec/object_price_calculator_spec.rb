# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'object_price_calculator'

describe ObjectPriceCalculator do
  before(:each) do
    @dirt1 = Dirt.new('glob', 'I')
    @dirt2 = Dirt.new('pork', 'V')
    @dirt3 = Dirt.new('pish', 'X')
    @dirt4 = Dirt.new('tegj', 'L')
  end

  it "should give the price of the metal" do
    objects = [@dirt1, @dirt2, 'Gold']
    price = 57800
    @obj_price_calc = ObjectPriceCalculator.new(objects, price)
    metal_obj = @obj_price_calc.get_metal_object_with_price
    metal_obj.name.should == 'Gold'
    metal_obj.value.should == 14450

    objects = [@dirt1, @dirt1, 'Silver']
    price = 34
    @obj_price_calc = ObjectPriceCalculator.new(objects, price)
    metal_obj = @obj_price_calc.get_metal_object_with_price
    metal_obj.name.should == 'Silver'
    metal_obj.value.should == 17

    objects = [@dirt3, @dirt3, 'Iron']
    price = 3910
    @obj_price_calc = ObjectPriceCalculator.new(objects, price)
    metal_obj = @obj_price_calc.get_metal_object_with_price
    metal_obj.name.should == 'Iron'
    metal_obj.value.should == 195.5
  end

  it "should calculate the price of the object(metal or/with dirt)" do
    objects = [@dirt3, @dirt4, @dirt1, @dirt1]
    @obj_price_calc = ObjectPriceCalculator.new(objects)
    @obj_price_calc.get_dirt_count_in_integer.should == 42

    objects = [@dirt1, @dirt1, 'Silver']
    price = 34
    @obj_price_calc = ObjectPriceCalculator.new(objects, price)
    metal_obj = @obj_price_calc.get_metal_object_with_price
    objects = [@dirt1, @dirt2, metal_obj]
    @obj_price_calc = ObjectPriceCalculator.new(objects)
    @obj_price_calc.get_object_price.should == 68

    objects = [@dirt1, @dirt2, 'Gold']
    price = 57800
    @obj_price_calc = ObjectPriceCalculator.new(objects, price)
    metal_obj = @obj_price_calc.get_metal_object_with_price
    objects = [@dirt1, @dirt2, metal_obj]
    @obj_price_calc = ObjectPriceCalculator.new(objects)
    @obj_price_calc.get_object_price.should == 57800

    objects = [@dirt3, @dirt3, 'Iron']
    price = 3910
    @obj_price_calc = ObjectPriceCalculator.new(objects, price)
    metal_obj = @obj_price_calc.get_metal_object_with_price
    objects = [@dirt1, @dirt2, metal_obj]
    @obj_price_calc = ObjectPriceCalculator.new(objects)
    @obj_price_calc.get_object_price.should == 782
  end

  it "should return nil if garbage object is passed" do
    @dirt5 = Dirt.new('abcd', 'T')
    @dirt6 = Dirt.new('pqrs', 'R')
    objects = [@dirt3, @dirt3, 'Stone']
    price = 1000
    @obj_price_calc = ObjectPriceCalculator.new(objects, price)
    metal_obj = @obj_price_calc.get_metal_object_with_price
    metal_obj.should be_nil
    objects = [@dirt1, @dirt2, metal_obj]
    @obj_price_calc = ObjectPriceCalculator.new(objects)
    @obj_price_calc.get_object_price.should be_nil
  end
end

