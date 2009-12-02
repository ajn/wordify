class Wordify::Token::Unit
  attr_reader :character
  def initialize(char)
    @character = char
  end
  
  def number
    point? ? nil : character.to_i
  end
  
  def point?
    character == '.'
  end
  
  def unit?
    not point?
  end
  
  def zero?
    character == '0'
  end
  
  def unit
    @unit ||= point? ? 'point' : Wordify.units[character.to_i]
  end
  alias_method :to_s, :unit
  
  def eql?(other)
    character == other.character
  end
  alias_method :==, :eql?
  
  def <=>(other)
    character <=> other.character
  end
end
