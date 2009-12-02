class Wordify::Token::Hundreds
  attr_reader :string, :number
  def initialize(string)
    @string, @number = string, string.to_i
  end
  
  def raw_tokens
    @raw_tokens ||= string.scan(/[0-9]/).map { |t| Wordify::Token::Unit.new(t) }
  end

  def tokens
    @tokens ||= ([Wordify::Token::Unit.new('0')]*(3-raw_tokens.size)) + raw_tokens
  end

  def size
    tokens.size
  end

  def hundreds
    tokens[0].zero? ? nil : "#{tokens[0].unit} hundred"
  end
  
  def tens
    Wordify::Token::Tens.new(tokens[1], tokens[2]).to_s
  end

  def group
    @group ||= [hundreds, tens].compact
  end

  def to_s
    return nil if number.zero?
    group.any? ? group.join(' and ') : nil
  end

  def eql?(other)
    to_s == other.to_s
  end
  alias_method :==, :eql?
  
  def <=>(other)
    to_s <=> other.to_s
  end
end
