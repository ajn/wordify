class Wordify::Constructor
  attr_reader :number
  
  def initialize(number)
    @number = number
  end
  
  def to_sentence
    if unreadable? || out_of_range?
      sentence = number.to_s
    else
      sentence = []
      tokens_in_hundreds.each_with_index do |h, i|
        sentence << (qnts[i] and i+1 != qnts.size ? "#{h} #{qnts[i]}" : h) if h
      end

      last = sentence.pop
      prev = sentence.compact
      sentence = if qnts.detect{ |q| last.include?(q) }
        [prev, last].flatten.join(', ')
      else
        [(prev.any? ? prev.join(', ') : nil), last].compact.join(' and ')
      end
      sentence += ' ' + tokenised_decimals if decimals
    end
    sentence
  end
  alias_method :to_s, :to_sentence
    
  def eql?(other)
    to_sentence == other.to_sentence
  end
  alias_method :==, :eql?
  
  def <=>(other)
    to_sentence <=> other.to_sentence
  end
    
  def out_of_range?
    tokens.size > 23
  end
  
  def unreadable?
    number.to_s.match(/[\+\-]/) != nil
  end
    
  def parts
    @parts ||= number.to_s.split('.')
  end
  
  def tokens
    @tokens ||= parts[0].reverse.scan(/([0-9]{1,3})/).flatten.map { |i| i.reverse }.reverse
  end
  
  def tokens_in_hundreds
    @tokens_in_hundreds ||= tokens.map { |token| Wordify::Token::Hundreds.new(token).to_s }
  end

  def decimals
    @decimals ||= parts[1] ? ".#{parts[1]}" : nil
  end
  
  def tokenised_decimals
    @decimals_to_tokens ||= decimals ? Wordify::Tokeniser.new(decimals).to_s : nil
  end
  
  def qnts
    Wordify.qnts.first(tokens_in_hundreds.size).reverse
  end

end
