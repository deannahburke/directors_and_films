class Director < ApplicationRecord
  has_many :films
  validates_presence_of :name, :birthdate, :hometown, :imdb_rating
  validates :active, inclusion: [true, false]
end
