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

  # As a visitor
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Parent Index
  it 'links to director index page' do
    director = Director.create!(name: 'Jordan Peele', birthdate: '1979-02-21', hometown: 'New York', active: true, imdb_rating: 16)
    film = director.films.create!(title: 'Get Out', oscar_nominated: true, oscar_wins: 0, budget: 2000000, revenue: 3000000, release_date: '2017-02-24', director_id: 1)

    visit "/directors/#{director.id}/films"

    click_on "Director Index"

    expect(current_path).to eq("/directors")
  end

  # As a visitor
  # When I visit the Parent's children Index Page
  # Then I see a link to sort children in alphabetical order
  # When I click on the link
  # I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order
  it 'has link to alphabetize films' do
    director_1 = Director.create!(name: 'Jordan Peele', birthdate: '1979-02-21', hometown: 'New York', active: true, imdb_rating: 16)

    film_1 = director_1.films.create!(title: 'Get Out', oscar_nominated: true, oscar_wins: 0, budget: 2000000, revenue: 3000000, release_date: '2017-02-24')

    film_2 = director_1.films.create!(title: 'Us', oscar_nominated: false, oscar_wins: 0, budget: 2750000, revenue: 2800000, release_date: '2019-03-22')

    film_3 = director_1.films.create!(title: 'Nope', oscar_nominated: true, oscar_wins: 0, budget: 1500000, revenue: 37500000, release_date: '2022-05-18')

    visit "/directors/#{director_1.id}/films"

    click_link "Alphabetize Films"

    expect(current_path).to eq("/directors/#{director_1.id}/films")
  end

  # As a visitor
  # When I visit the `child_table_name` index page or a parent `child_table_name` index page
  # Next to every child, I see a link to edit that child's info
  # When I click the link
  # I should be taken to that `child_table_name` edit page where I can update its information

  it 'links to the film edit page' do
    director = Director.create!(name: 'Jordan Peele', birthdate: '1979-02-21', hometown: 'New York', active: true, imdb_rating: 16)

    film = director.films.create!(title: 'Get Out', oscar_nominated: true, oscar_wins: 0, budget: 2000000, revenue: 3000000, release_date: '2017-02-24')

    visit "/directors/#{director.id}/films"

    click_link "Edit #{film.title}"

    expect(current_path).to eq("/films/#{film.id}/edit")
  end

  # As a visitor
  # When I visit the Parent's children Index Page
  # I see a form that allows me to input a number value
  # When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
  # Then I am brought back to the current index page with only the records that meet that threshold shown.

  it 'has a form to filter number of oscar wins' do
    director_1 = Director.create!(name: 'Jordan Peele', birthdate: '1979-02-21', hometown: 'New York', active: true, imdb_rating: 16)

    film_1 = director_1.films.create!(title: 'Get Out', oscar_nominated: true, oscar_wins: 2, budget: 2000000, revenue: 3000000, release_date: '2017-02-24')

    film_2 = director_1.films.create!(title: 'Us', oscar_nominated: false, oscar_wins: 0, budget: 2750000, revenue: 2800000, release_date: '2019-03-22')

    film_3 = director_1.films.create!(title: 'Nope', oscar_nominated: true, oscar_wins: 3, budget: 1500000, revenue: 37500000, release_date: '2022-05-18')

    visit "/directors/#{director_1.id}/films"

    fill_in('Oscar Wins', with: '2')

    click_button "Only show films with more than this many Oscar wins!"

    expect(page).to have_content('Get Out')
    expect(page).to have_content('Nope')
    expect(page).to_not have_content('Us')

    expect(current_path).to eq("/directors/#{director_1.id}/films")
  end
end
