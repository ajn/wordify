class Wordify::Token::Tens
  attr_reader :tens, :unit
  def initialize(*unit_tokens)
    @tens, @unit = unit_tokens
    raise StandardError,  'Invalid tokens' unless valid?
  end
  
  def ten?
    tens.number > 1
  end
  
  def teen?
    tens.number == 1
  end
  
  def valid?
    tens.is_a?(Wordify::Token::Unit) and unit.is_a?(Wordify::Token::Unit)
  end
  
  def to_s
    chars = []
    if ten?
      chars << Wordify.tens[tens.number]
      chars << unit.unit unless unit.zero?
    elsif teen?
      chars << Wordify.teens[unit.number]
    else
      chars << unit.unit unless unit.zero?
    end
    chars.any? ? chars.join(' ') : nil
  end
  
  def eql?(other)
    to_s == other.to_s
  end
  alias_method :==, :eql?
  
  def <=>(other)
    to_s <=> other.to_s
  end
end
