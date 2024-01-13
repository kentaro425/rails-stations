class Movie < ApplicationRecord
  validates_uniqueness_of :name
end
