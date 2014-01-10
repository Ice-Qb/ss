require 'spec_helper'
# require_relative 'match_stdout.rb'
require_relative 'csv_parser.rb'
require_relative 'teachers.csv'

describe Teacher do 
  it should respond_to :discipline 
end