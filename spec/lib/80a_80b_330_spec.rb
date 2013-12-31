require 'spec_helper'
require_relative 'match_stdout.rb'
require_relative '../../task2_80a_80b_330.rb'

describe 'task 330' do 
  it 'perfect number' do
    expect { 6.perfect }.to match_stdout( "6 consists of 1 2 3 \n6 is perfect\n" )
  end  
end

describe 'task 80' do
  it 'part a, b' do
    expect { 578.digits_count }.to match_stdout( "578 consists of 5 7 8 and has 3 digits\nsum is 20\n" )
  end
end