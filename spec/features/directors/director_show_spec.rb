require 'rails_helper'

RSpec.describe 'the directors show page' do
  # As a visitor
  # When I visit '/parents/:id'
  # Then I see the parent with that id including the parent's attributes:
  # - data from each column that is on the parent table
  it 'displays the director id and attributes' do
    director = Director.create(name: 'Jordan Peele', birthdate: '1979-02-21', hometown: 'New York', active: true, imdb_rating: 16)
    visit "/directors/#{director.id}"

    expect(page).to have_content(director.name)
    expect(page).to have_content(director.birthdate)
    expect(page).to have_content(director.hometown)
    expect(page).to have_content(director.active)
    expect(page).to have_content(director.imdb_rating)
  end
end
