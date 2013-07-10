# Substance class with name and value. The state of substance object is immutable.
class Substance
  def initialize(name, value)
    @name = name
    @value = value
  end

  def name
    @name
  end

  def value
    @value
  end
end