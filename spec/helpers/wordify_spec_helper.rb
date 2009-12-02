module WordifySpecHelper
  def unit_token(i)
    Wordify::Token::Unit.new(i)
  end
  
  def tens_token(tens, unit)
    Wordify::Token::Tens.new(unit_token(tens), unit_token(unit))
  end
  
  def constructor(number)
    Wordify::Constructor.new(number)
  end
end
