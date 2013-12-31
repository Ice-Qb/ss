require 'spec_helper'
require_relative '../../task1_fibonacci.rb'
require_relative 'match_stdout.rb'

describe 'fibonacci' do
  it 'iterative' do
    expect { fib(6) }.to match_stdout( "1\n2\n3\n5\n8\n13\n" )
  end
  
  it 'recursive' do
    fib_rec(11).should == 144
  end

  it 'range' do
    expect { fib_range(4, 10) }.to match_stdout( "5\n8\n" )
  end
  
end