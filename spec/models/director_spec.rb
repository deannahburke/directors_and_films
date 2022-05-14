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

  describe 'instance methods' do
    describe '#most_recently_created' do
        it 'returns Directors index sorted by most recently created' do
            director_1 = Director.create!(name: 'Luke Swenson', birthdate: '1979-02-21', hometown: 'New York', active: true, imdb_rating: 16)

            director_2 = Director.create!(name: 'Chloe Zhao', birthdate: '1982-03-31', hometown: 'Bejing', active: true, imdb_rating: 20)

            director_3 = Director.create!(name: 'Alfred Hitchcock', birthdate: '1899-08-13', hometown: 'London', active: false, imdb_rating: 3)

        expect(Director.most_recently_created.to_a).to eq([director_3, director_2, director_1])
      end
    end
  end
end
