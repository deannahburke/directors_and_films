require 'rails_helper'
RSpec.describe 'the films index page', type: :feature do
# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes:
  it 'displays each film and all its attributes' do
    director = Director.create!(name: 'Jordan Peele', birthdate: '1979-02-21', hometown: 'New York', active: true, imdb_rating: 16)
    film = director.films.create!(title: 'Get Out', oscar_nominated: true, oscar_wins: 0, budget: 2000000, revenue: 3000000, release_date: '2017-02-24', director_id: 1)
    visit "/films"

    expect(page).to have_content('Get Out')
    expect(page).to have_content(true)
    expect(page).to have_content(0)
    expect(page).to have_content(2000000)
    expect(page).to have_content(3000000)
    expect(page).to have_content('2017-02-24')
  end
end
