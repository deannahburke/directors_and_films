require 'rails_helper'

RSpec.describe 'the films show page', type: :feature do
# As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes:
  it 'displays the film and attribute by id' do
    director = Director.create!(name: 'Jordan Peele', birthdate: '1979-02-21', hometown: 'New York', active: true, imdb_rating: 16)
    film = director.films.create!(title: 'Get Out', oscar_nominated: true, oscar_wins: 0, budget: 2000000, revenue: 3000000, release_date: '2017-02-24', director_id: 1)
    visit "/films/#{film.id}"

    expect(page).to have_content(film.title)
    expect(page).to have_content(film.oscar_nominated)
    expect(page).to have_content(film.oscar_wins)
    expect(page).to have_content(film.budget)
    expect(page).to have_content(film.revenue)
    expect(page).to have_content(film.release_date)
  end

end
