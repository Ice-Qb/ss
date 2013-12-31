require 'spec_helper'
require_relative '../../task3_brackets_balance.rb'
require_relative 'match_stdout.rb'

describe 'brackets methods' do
  it 'is not bracket' do
    'a'.should_not be_open_bracket
    'bsf'.should_not be_closed_bracket
  end

  context 'open bracket' do
    it 'is open bracket' do
      '('.should be_open_bracket
    end

    it 'is not open bracket' do
      ']'.should_not be_open_bracket
    end
  end

  context 'closed bracket' do
    it 'is closed bracket' do
      ']'.should be_closed_bracket
    end

    it 'is not open bracket' do
      '('.should_not be_closed_bracket
    end
  end

  context 'brackets balance' do
    it 'is balanced' do
      '([()]{()})'.should be_brackets_balanced
    end

    it 'is not balanced' do
      '([()]{()}'.should_not be_brackets_balanced
      '([)]'.should_not be_brackets_balanced
      ']()'.should_not be_brackets_balanced
    end
  end
end