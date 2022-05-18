require 'rails_helper'

RSpec.describe 'the directors index page', type: :feature do

  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system

  it 'displays the name of each director name' do
    director = Director.create!(name: 'Jordan Peele', birthdate: '1979-02-21', hometown: 'New York', active: true, imdb_rating: 16)
    visit "/directors"

    expect(page).to have_content("Jordan Peele")
  end

  # As a visitor
  # When I visit the parent index,
  # I see that records are ordered by most recently created first
  # And next to each of the records I see when it was created

  it 'displays the time of creation of each director record' do
    director = Director.create!(name: 'Jordan Peele', birthdate: '1979-02-21', hometown: 'New York', active: true, imdb_rating: 16)
    visit "/directors"

    expect(page).to have_content(director.created_at.strftime("%m-%e-%y %H:%M"))
  end

  # As a visitor
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Child Index

  it 'has a link to the films index page' do
    visit "/directors"

    click_on "Films Index"

    expect(current_path).to eq("/films")
  end

  # As a visitor
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Parent Index

  it 'has a link to the director index page' do
    visit "/directors"

    click_on "Director Index"

    expect(current_path).to eq("/directors")
  end

  # As a visitor
  # When I visit the parent index page
  # Next to every parent, I see a link to edit that parent's info
  # When I click the link
  # I should be taken to that parents edit page where I can update its information

  it 'links to the edit page' do
    director = Director.create!(name: 'Jordan Peele', birthdate: '1979-02-21', hometown: 'New York', active: true, imdb_rating: 16)

    visit "/directors"

    click_link "Edit #{director.name}"

    expect(current_path).to eq("/directors/#{director.id}/edit")
  end

  # As a visitor
  # When I visit the parent index page
  # Next to every parent, I see a link to delete that parent
  # When I click the link
  # I am returned to the Parent Index Page where I no longer see that parent

  it 'has a link to delete director' do
    director_1 = Director.create!(name: 'Jordan Peele', birthdate: '1979-02-21', hometown: 'New York', active: true, imdb_rating: 16)

    director_2 = Director.create!(name: 'Chloe Zhao', birthdate: '1984-03-31', hometown: 'Beijing', active: true, imdb_rating: 3)

    visit "/directors"

    click_link "Delete #{director_1.name}"

    expect(page).to_not have_content('Jordan Peele')
    expect(page).to have_content('Chloe Zhao')
    expect(current_path).to eq("/directors")
  end
end
