$:.unshift(File.dirname(__FILE__)) unless $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))
module Wordify; end

require 'wordify/token'
require 'wordify/tokeniser'
require 'wordify/constructor'

module Wordify
  class << self
    def units; %w[zero one two three four five six seven eight nine]; end
    def teens; %w[ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen]; end
    def tens;  %w[zero ten twenty thirty fourty fifty sixty seventy eighty ninety]; end
    def qnts
      %w[hundred thousand million billion trillion quadrillion quintillion] + 
      %w[sextillion septillion octillion nonillion decillion undecillion]  +
      %w[duodecillion tredecillion quattuordecillion quindecillion sexdecillion] +
      %w[septendecillion octodecillion novemdecillion vigintillion centillion]
    end
  end

  module Numeric
    def in_words(options={})
      options[:tokens] ? tokenise : construct_sentence
    end
    
    protected
    
      def construct_sentence
        Wordify::Constructor.new(self).to_sentence
      end

      def tokenise
        Wordify::Tokeniser.new(self).to_s
      end
  end
end

class Numeric; include Wordify::Numeric; end
