require File.expand_path("#{File.dirname(__FILE__)}/../../spec_helper")

describe Wordify::Token::Tens do
  
  it 'should accept only unit tokens as parameters' do
    lambda { Wordify::Token::Tens.new('1', '1') }.should raise_error('Invalid tokens')
    lambda { tens_token('1', '1') }.should_not raise_error('Invalid tokens')
  end
  
  it 'should be valid only if both :tens and :unit are unit tokens' do
    dt = tens_token('1', '1')
    dt.should be_valid
    dt.instance_variable_set(:@unit, '1')
    dt.should_not be_valid
    
    dt = tens_token('1', '1')
    dt.should be_valid
    dt.instance_variable_set(:@tens, '1')
    dt.should_not be_valid
  end
  
  it 'should have accessor method for :unit' do
    tens_token('1', '2').unit.should == unit_token('2')
  end

  it 'should have accessor method for :tens' do
    tens_token('1', '2').tens.should == unit_token('1')
  end
  
  it 'should be a teen if number is equal to 1' do
    tens_token('1', '2').should be_teen
    tens_token('1', '2').should_not be_ten
  end
  
  it 'should be a ten if number is more than 1' do
    tens_token('2', '1').should be_ten
    tens_token('2', '1').should_not be_teen
  end
  
  describe 'to_s' do
    it 'should return nil if both the unit and tens are 0' do
      tens_token('0', '0').to_s.should == nil
    end
    
    it 'should return the unit in words if tens is 0' do
      tens_token('0', '1').to_s.should == 'one'
      tens_token('0', '3').to_s.should == 'three'
      tens_token('0', '5').to_s.should == 'five'
      tens_token('0', '7').to_s.should == 'seven'
      tens_token('0', '9').to_s.should == 'nine'
    end
    
    it 'should return the teen in words if tens is 1' do
      tens_token('1', '0').to_s.should == 'ten'
      tens_token('1', '3').to_s.should == 'thirteen'
      tens_token('1', '5').to_s.should == 'fifteen'
      tens_token('1', '7').to_s.should == 'seventeen'
      tens_token('1', '9').to_s.should == 'nineteen'
    end
    
    it 'should return the ten only in words if ten is more than 1 and unit is 0' do
      tens_token('1', '0').to_s.should == 'ten'
      tens_token('3', '0').to_s.should == 'thirty'
      tens_token('5', '0').to_s.should == 'fifty'
      tens_token('7', '0').to_s.should == 'seventy'
      tens_token('9', '0').to_s.should == 'ninety'
    end

    it 'should return the ten and unit in words if both ten is more than 1 and unit more than 0' do
      tens_token('2', '1').to_s.should == 'twenty one'
      tens_token('3', '3').to_s.should == 'thirty three'
      tens_token('5', '5').to_s.should == 'fifty five'
      tens_token('7', '7').to_s.should == 'seventy seven'
      tens_token('9', '9').to_s.should == 'ninety nine'
    end
  end
end
