require File.expand_path("#{File.dirname(__FILE__)}/spec_helper")

describe Wordify do
  
  it 'should have a list of units' do
    Wordify.units.should == %w[zero one two three four five six seven eight nine]
  end
  
  it 'should have a list of teens' do
    Wordify.teens.should == %w[ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen]
  end
  
  it 'should have a list of tens' do
    Wordify.tens.should == %w[zero ten twenty thirty fourty fifty sixty seventy eighty ninety]
  end
  
  it 'should have a list of quantities (qnts)' do
    qnts  = %w[hundred thousand million billion trillion quadrillion quintillion] + 
            %w[sextillion septillion octillion nonillion decillion undecillion]  +
            %w[duodecillion tredecillion quattuordecillion quindecillion sexdecillion] +
            %w[septendecillion octodecillion novemdecillion vigintillion centillion]
    Wordify.qnts.should == qnts
  end
  
  describe Wordify::Numeric do
    it 'should be included into Numeric class' do
      Numeric.included_modules.should include(Wordify::Numeric)
    end
    
    describe 'in_words' do
      it 'should construct a sentence by default' do
        123.45.in_words.should == 'one hundred and twenty three point four five'
      end

      it 'should tokenize when the :tokens option is passed' do
        123.45.in_words(:tokens => true).should == 'one two three point four five'        
      end
    end
  end
  
end