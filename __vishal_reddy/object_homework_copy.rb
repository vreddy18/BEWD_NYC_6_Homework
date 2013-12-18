require "minitest/spec"
require "minitest/autorun"

class Duck
  attr_accessor :name, :color
  def initialize (name, color)
   @name = name
   @color = color
  end

  def quack
    "Quack! I'm #{@name}, the #{@color} duck."
  end

  def backwards_quack
    "Quack! I'm #{@name}, the #{@color} duck.".reverse
  end

  def commodore_quack
    @name = "Commodore Quack"
  end

  def turn_blue
    @color = "Blue"
  end

  def big_quack
    "QUACK! My name is #{@name.upcase}!"
  end
end

describe Duck do
  it "quacks like a duck" do
    kosta = Duck.new("Kosta", "Teal")
    kosta.quack.must_equal "Quack! I'm Kosta, the Teal duck."
  end

  it "quacks in reverse" do
    jean_luc = Duck.new("Jean-luc", "Pink")
    jean_luc.backwards_quack.must_equal ".kcud kniP eht ,cul-naeJ m'I !kcauQ"
  end

  it "changes the name of the duck" do
    commodore_quack = Duck.new("Jean-luc", "Green")
    commodore_quack.name = "Commodore Quack"
    commodore_quack.name.must_equal "Commodore Quack"
  end
  it "turns blue" do
    quinnie = Duck.new("Quinnie", "Gray")
    quinnie.turn_blue
    quinnie.color.must_equal "Blue"
  end

  it "quacks his name loudly" do
    velma = Duck.new("Velma", "Gray")
    velma.big_quack.must_equal "QUACK! My name is VELMA!"
  end
end
