require File.expand_path("#{File.dirname(__FILE__)}/../spec_helper")

describe Wordify::Constructor do
  it 'should accept a :number as a argument' do
    lambda { constructor(123.45) }.should_not raise_error
  end
  
  it 'should have :number as an accessor method' do
    constructor(123.45).number.should == 123.45
  end
  
  it 'should have an array of :parts (integer and decimals)' do
    constructor(123.45).parts.should == ['123', '45']
  end
  
  it 'should have an array of :tokens' do
    constructor(1234567890).tokens.should == ['1', '234', '567', '890']
  end
  
  it 'should have an array of :tokens_in_hundreds' do
    constructor(1234567890).tokens_in_hundreds.should == [
      'one', 
      'two hundred and thirty four', 
      'five hundred and sixty seven', 
      'eight hundred and ninety'
    ]
  end
  
  describe 'decimals' do
    it 'should return decimal string when number is a float' do
      constructor(123.456).decimals.should == '.456'
    end
    
    it 'should return nil when number is an integer' do
      constructor(123).decimals.should == nil
    end
  end
  
  describe 'tokenised_decimals' do
    it 'should return decimals in words when number is a float' do
      constructor(123.456).tokenised_decimals.should == 'point four five six'
    end
    
    it 'should return nil when number is an integer' do
      constructor(123).tokenised_decimals.should == nil
    end
  end
  
  it 'should return only necessary quantities (qnts) in reverse' do
    constructor(1234567).qnts.should == %w[million thousand hundred]
  end
  
  describe 'to_sentence' do
    it 'should return full string with decimals when float' do
      constructor(123456007.890).to_sentence.should == 'one hundred and twenty three million, four hundred and fifty six thousand and seven point eight nine'
    end

    it 'should return full string without decimals when integer' do
      constructor(1234567890).to_sentence.should == 'one billion, two hundred and thirty four million, five hundred and sixty seven thousand, eight hundred and ninety'
    end
  end
  
end
