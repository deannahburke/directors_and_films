require 'rails_helper'

RSpec.describe Director, type: :model do
  describe 'relationships' do
    it { should have_many :films }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :birthdate }
    it { should validate_presence_of :hometown }
    it { should validate_presence_of :imdb_rating }
    it { should allow_value(true).for(:active) }
  end

  describe 'class methods' do
    it 'returns Directors index sorted by most recently created' do
      director_1 = Director.create!(name: 'Jordan Peele', birthdate: '1979-02-21', hometown: 'New York', active: true, imdb_rating: 16)

      director_2 = Director.create!(name: 'Chloe Zhao', birthdate: '1982-03-31', hometown: 'Bejing', active: true, imdb_rating: 20)

      director_3 = Director.create!(name: 'Alfred Hitchcock', birthdate: '1899-08-13', hometown: 'London', active: false, imdb_rating: 3)

      expect(Director.most_recently_created.to_a).to eq([director_3, director_2, director_1])
      expect(Director.most_recently_created.to_a).to_not eq([director_1, director_2, director_3])
    end

    describe 'instance methods' do
      it 'shows number of films made by director' do
        director_1 = Director.create!(name: 'Jordan Peele', birthdate: '1979-02-21', hometown: 'New York', active: true, imdb_rating: 16)

        film_1 = director_1.films.create!(title: 'Get Out', oscar_nominated: true, oscar_wins: 0, budget: 2000000, revenue: 3000000, release_date: '2017-02-24', director_id: 1)

        film_2 = director_1.films.create!(title: 'Us', oscar_nominated: false, oscar_wins: 0, budget: 2750000, revenue: 2800000, release_date: '2019-03-22', director_id: 1)

        director_2 = Director.create!(name: 'Chloe Zhao', birthdate: '1982-03-31', hometown: 'Bejing', active: true, imdb_rating: 20)

        film_3 = director_2.films.create!(title: 'Nomadland', oscar_nominated: true, oscar_wins: 3, budget: 5000000, revenue: 39500000, release_date: '2021-02-19', director_id: 2)

        expect(director_1.count_films).to eq(2)
        expect(director_2.count_films).to eq(1)
      end
    end
  end
end
