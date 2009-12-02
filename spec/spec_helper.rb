lib_path = File.expand_path("#{File.dirname(__FILE__)}/../lib")
$LOAD_PATH.unshift lib_path unless $LOAD_PATH.include?(lib_path)
require 'spec'
require File.expand_path("#{lib_path}/wordify.rb")
Spec::Runner.configure do |config|
  require "#{File.dirname(__FILE__)}/helpers/wordify_spec_helper"
  include WordifySpecHelper
end
