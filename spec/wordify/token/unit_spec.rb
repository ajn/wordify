require File.expand_path("#{File.dirname(__FILE__)}/../../spec_helper")

describe Wordify::Token::Unit do
  it 'should accept a character' do
    lambda { unit_token('1') }.should_not raise_error
  end
  
  it 'should have accessor method for :character' do
    unit_token('1').character.should == '1'
  end
    
  describe 'number' do
    it 'should return character as an integer if it is not a point (\'.\')' do
      unit_token('1').number.should == 1
    end

    it 'should return nil if character is a point (\'.\')' do
      unit_token('.').number.should be_nil
    end
  end

  describe 'point?' do
    it 'should return true if character is a point (\'.\')' do
      unit_token('.').should be_point
    end

    it 'should return false if character is not a point (\'.\')' do
      unit_token('1').should_not be_point
    end
  end
  
  describe 'unit?' do
    it 'should return true if character is not a point (\'.\')' do
      unit_token('1').should be_unit
    end

    it 'should return false if character is a point (\'.\')' do
      unit_token('.').should_not be_unit
    end
  end
  
  describe 'zero?' do
    it 'should return true if character is 0' do
      unit_token('0').should be_zero
    end

    it 'should return false if character is not 0' do
      unit_token('.').should_not be_zero
      unit_token('1').should_not be_zero
    end
  end
  
  describe 'unit' do
    it 'should return \'point\' if unit token is a point' do
      unit_token('.').to_s.should == 'point'
    end
    
    it 'should return number in words if unit token anything but a point' do
      unit_token('1').unit.should == 'one'
      unit_token('3').unit.should == 'three'
      unit_token('5').unit.should == 'five'
      unit_token('7').unit.should == 'seven'
      unit_token('9').unit.should == 'nine'
    end
    
    it 'should be aliased as :to_s' do
      unit_token('1').to_s.should == 'one'
      unit_token('3').to_s.should == 'three'
      unit_token('5').to_s.should == 'five'
      unit_token('7').to_s.should == 'seven'
      unit_token('9').to_s.should == 'nine'
    end
  end
end
