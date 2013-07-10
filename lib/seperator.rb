# This class seperates metal and dirt.
# Assuming that metal and dirt collectively are passed as array to this class.

require 'substance'
require 'metal'
require 'dirt'

class Seperator
  def initialize(objects)
    @seperator = objects
  end

  def get_metal
    metal = @seperator.last unless @seperator.last.is_a?(Dirt)
    metal if (metal and !get_valid_metal(metal).empty?)
  end

  def get_metal_obj
    metal = @seperator.last unless @seperator.last.is_a?(Dirt)
    metal if (metal and !get_valid_metal_obj(metal).empty?)
  end

  def get_dirt
    dirt = @seperator - [(@seperator.last.is_a?(Metal)? get_metal_obj : get_metal)]
    dirt unless get_valid_dirt(dirt).empty?
  end

  def get_valid_metal(metal)
    Metal::VALUABLE_METAL & [metal.downcase]
  end

  def get_valid_metal_obj(metal)
    Metal::VALUABLE_METAL & [metal.name.downcase]
  end

  def get_valid_dirt(dirt)
    Dirt::VALUABLE_DIRT & dirt.collect{|d| d.name if d.is_a?(Dirt)}
  end
end