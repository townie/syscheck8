class Car < ActiveRecord::Base

  belongs_to :manufacture

  validates :year, presence: true, numericality: { greater_than_or_equal_to: 1980, less_than_or_equal_to: 2015 }
  validates :mileage, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 500000 }
  validates :color, presence: true
end
