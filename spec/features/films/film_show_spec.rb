require 'rails_helper'
RSpec.describe 'the films index page', type: :feature do
# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes:
  it 'displays each film and all its attributes' do
    director = Director.create(name: 'Jordan Peele')
    film = director.films.create!(title: 'Get Out', oscar_nominated: true, oscar_wins: 0, budget: 2000000, revenue: 3000000, release_date: '2017-02-24', director_id: 1)
    visit "/films"

    expect(page).to have_content(film.title)
    expect(page).to have_content(film.oscar_nominated)
    expect(page).to have_content(film.oscar_wins)
    expect(page).to have_content(film.budget)
    expect(page).to have_content(film.revenue)
    expect(page).to have_content(film.release_date)
  end
end
