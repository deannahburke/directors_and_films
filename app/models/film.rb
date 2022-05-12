class Film < ApplicationRecord
  belongs_to :director
  validates_presence_of :title, :oscar_wins, :budget, :revenue, :release_date
  validates :oscar_nominated, inclusion:[true, false]
end
