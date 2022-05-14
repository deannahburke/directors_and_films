require 'rails_helper'

RSpec.describe 'the directors index page', type: :feature do
  it 'displays the name of each director name' do
    # For each parent table
    # As a visitor
    # When I visit '/parents'
    # Then I see the name of each parent record in the system
    director = Director.create!(name: 'Jordan Peele', birthdate: '1979-02-21', hometown: 'New York', active: true, imdb_rating: 16)
    visit "/directors"

    expect(page).to have_content("Jordan Peele")
  end

  it 'displays the time of creation of each director record' do
    # As a visitor
    # When I visit the parent index,
    # I see that records are ordered by most recently created first
    # And next to each of the records I see when it was created
    director = Director.create!(name: 'Jordan Peele', birthdate: '1979-02-21', hometown: 'New York', active: true, imdb_rating: 16)
    visit "/directors"

    expect(page).to have_content(director.created_at)
  end
end
