require 'rails_helper'

RSpec.describe 'the directors index page', type: :feature do
  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system
  it 'displays the name of each director name' do
    director = Director.create(name: 'Jordan Peele', birthdate: '1979-02-21', hometown: 'New York', active: true, imdb_rating: 16)
    visit "/directors"

    expect(page).to have_content(director.name)
  end
end
