class Movie < ActiveRecord::Base
  class << self;  attr_reader :ratings end
  @ratings = ['G', 'PG', 'PG-13', 'R']
end
