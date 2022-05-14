require 'rails_helper'

RSpec.describe 'the director films index page', type: :feature do
  # As a visitor
  # When I visit '/parents/:parent_id/child_table_name'
  # Then I see each Child that is associated with that Parent with each Child's attributes:
  it 'displays the films associated with each director and each films attributes' do
    director = Director.create!(name: 'Jordan Peele', birthdate: '1979-02-21', hometown: 'New York', active: true, imdb_rating: 16)
    film = director.films.create!(title: 'Get Out', oscar_nominated: true, oscar_wins: 0, budget: 2000000, revenue: 3000000, release_date: '2017-02-24', director_id: 1)

    visit "/directors/#{director.id}/films"

    expect(page).to have_content('Get Out')
    expect(page).to have_content(true)
    expect(page).to have_content(0)
    expect(page).to have_content(2000000)
    expect(page).to have_content(3000000)
    expect(page).to have_content('2017-02-24')
  end

  # As a visitor
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Child Index
  it 'links to films index page' do
    director = Director.create!(name: 'Jordan Peele', birthdate: '1979-02-21', hometown: 'New York', active: true, imdb_rating: 16)
    film = director.films.create!(title: 'Get Out', oscar_nominated: true, oscar_wins: 0, budget: 2000000, revenue: 3000000, release_date: '2017-02-24', director_id: 1)

    visit "/directors/#{director.id}/films"

    click_on "Films Index"

    expect(current_path).to eq("/films")
  end 
end
