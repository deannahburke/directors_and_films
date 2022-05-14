require 'rails_helper'

RSpec.describe 'the directors show page', type: :feature do
  # As a visitor
  # When I visit '/parents/:id'
  # Then I see the parent with that id including the parent's attributes:
  # - data from each column that is on the parent table
  it 'displays the director id and attributes' do
    director = Director.create!(name: 'Jordan Peele', birthdate: '1979-02-21', hometown: 'New York', active: true, imdb_rating: 16)
    visit "/directors/#{director.id}"

    expect(page).to have_content('Jordan Peele')
    expect(page).to have_content('1979-02-21')
    expect(page).to have_content('New York')
    expect(page).to have_content(true)
    expect(page).to have_content(16)
  end

  # As a visitor
  # When I visit a parent's show page
  # I see a count of the number of children associated with this parent
  it 'displays the count of films associated with the director' do
    director = Director.create!(name: 'Jordan Peele', birthdate: '1979-02-21', hometown: 'New York', active: true, imdb_rating: 16)

    film_1 = director.films.create!(title: 'Get Out', oscar_nominated: true, oscar_wins: 0, budget: 2000000, revenue: 3000000, release_date: '2017-02-24', director_id: 1)

    film_2 = director.films.create!(title: 'Us', oscar_nominated: false, oscar_wins: 0, budget: 2750000, revenue: 2800000, release_date: '2019-03-22', director_id: 1)

    visit "/directors/#{director.id}"

    expect(page).to have_content("Films by Jordan Peele: 2")
  end

  # As a visitor
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Child Index
  it 'links to films index page' do
    director = Director.create!(name: 'Jordan Peele', birthdate: '1979-02-21', hometown: 'New York', active: true, imdb_rating: 16)
    
    visit "/directors/#{director.id}"

    click_on "Films Index"

    expect(current_path).to eq("/films")
  end
end
