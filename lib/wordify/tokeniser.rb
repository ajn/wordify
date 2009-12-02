class Wordify::Tokeniser
  attr_reader :number

  def initialize(number)
    @number = number
  end
  
  def to_s
    unreadable? ? number.to_s : tokens.map { |t| t.to_s }.join(' ')
  end
  
  def eql?(other)
    to_s == other.to_s
  end
  alias_method :==, :eql?
  
  def <=>(other)
    to_s <=> other.to_s
  end
  
  def unreadable?
    number.to_s.match(/[\+\-]/) != nil
  end
  
  def tokens
    @tokens ||= number.to_s.scan(/(.)/).flatten.map { |char| Wordify::Token::Unit.new(char) }
  end
  
end
