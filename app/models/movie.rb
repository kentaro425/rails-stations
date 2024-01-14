class Movie < ApplicationRecord
  has_many :schedules, dependent: :destroy
  validates_uniqueness_of :name
end
