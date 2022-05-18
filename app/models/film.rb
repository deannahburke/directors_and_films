class Film < ApplicationRecord
  belongs_to :director
  validates_presence_of :title, :oscar_wins, :budget, :revenue, :release_date
  validates :oscar_nominated, inclusion:[true, false]

  def self.oscar_nod
    where(oscar_nominated: true)
  end

  def self.alphabetize
    order(:title)
  end

  def self.wins_over_threshold(quantity)
    where("oscar_wins > #{quantity}")
  end

end
