require 'seperator'

describe Seperator do
  before(:each) do
    @dirt1 = Dirt.new('glob', 'I')
    @dirt2 = Dirt.new('pork', 'V')
    @dirt3 = Dirt.new('pish', 'X')
    @dirt4 = Dirt.new('tegj', 'L')
    objects = [@dirt1, @dirt1, 'Silver']
    @seperator = Seperator.new(objects)
  end

  it "should extract the metal if valid" do
    metal = @seperator.get_metal
    metal.should == 'Silver'
  end

  it "should not extract the metal if not valid" do
    objects = [@dirt1, @dirt2, 'Stone']
    @seperator = Seperator.new(objects)
    metal = @seperator.get_metal
    metal.should be_nil
  end

  it "should extract the dirt if valid" do
    dirt = @seperator.get_dirt
    dirt.should == [@dirt1, @dirt1]
  end

  it "should not extract the dirt if not valid" do
    @dirt5 = Dirt.new('abcd', 'S')
    @dirt6 = Dirt.new('pqrs', 'R')
    objects = [@dirt5, @dirt6, 'Silver']
    @seperator = Seperator.new(objects)
    dirt = @seperator.get_dirt
    dirt.should be_nil
  end
end

