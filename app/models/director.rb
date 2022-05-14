class Director < ApplicationRecord
  has_many :films
  validates_presence_of :name, :birthdate, :hometown, :imdb_rating
  validates :active, inclusion: [true, false]

  def self.most_recently_created
    order(created_at: :desc)
  end

  def count_films
  end 
end
