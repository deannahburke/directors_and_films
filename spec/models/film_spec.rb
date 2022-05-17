require 'rails_helper'

RSpec.describe Film, type: :model do
  describe 'relationships' do
    it {should belong_to :director}
  end
  describe 'validations' do
    it { should validate_presence_of :title}
    it { should validate_presence_of :oscar_wins}
    it { should validate_presence_of :budget}
    it { should validate_presence_of :revenue}
    it { should validate_presence_of :release_date}
    it { should allow_value(true).for(:oscar_nominated) }
    it { should allow_value(false).for(:oscar_nominated) }
  end

  describe 'class methods' do
    it 'returns films index with only oscar nominated films' do
      # As a visitor
      # When I visit the child index
      # Then I only see records where the boolean column is `true`
      director_1 = Director.create!(name: 'Jordan Peele', birthdate: '1979-02-21', hometown: 'New York', active: true, imdb_rating: 16)

      film_1 = director_1.films.create!(title: 'Get Out', oscar_nominated: true, oscar_wins: 0, budget: 2000000, revenue: 3000000, release_date: '2017-02-24')

      film_2 = director_1.films.create!(title: 'Us', oscar_nominated: false, oscar_wins: 0, budget: 2750000, revenue: 2800000, release_date: '2019-03-22')

      film_3 = director_1.films.create!(title: 'Nope', oscar_nominated: true, oscar_wins: 0, budget: 1500000, revenue: 37500000, release_date: '2022-05-18')

      expect(Film.oscar_nod).to eq([film_1, film_3])
    end
    # As a visitor
    # When I visit the Parent's children Index Page
    # Then I see a link to sort children in alphabetical order
    # When I click on the link
    # I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order
    it 'can sort films alphabetically' do
      director_1 = Director.create!(name: 'Jordan Peele', birthdate: '1979-02-21', hometown: 'New York', active: true, imdb_rating: 16)

      film_1 = director_1.films.create!(title: 'Get Out', oscar_nominated: true, oscar_wins: 0, budget: 2000000, revenue: 3000000, release_date: '2017-02-24')

      film_2 = director_1.films.create!(title: 'Us', oscar_nominated: false, oscar_wins: 0, budget: 2750000, revenue: 2800000, release_date: '2019-03-22')

      film_3 = director_1.films.create!(title: 'Nope', oscar_nominated: true, oscar_wins: 0, budget: 1500000, revenue: 37500000, release_date: '2022-05-18')

      expect(Film.alphabetize).to eq([film_1, film_3, film_2])
    end
  end
end
