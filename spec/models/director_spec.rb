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
end
