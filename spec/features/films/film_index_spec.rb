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

  # As a visitor
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Child Index

  it 'links to films index page' do
    visit "/films"

    click_on "Films Index"

    expect(current_path).to eq("/films")
  end

  # As a visitor
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Parent Index

  it 'links to the director index page' do
    visit "/films"

    click_on "Director Index"

    expect(current_path).to eq("/directors")
  end

  # As a visitor
  # When I visit the child index
  # Then I only see records where the boolean column is `true`

  it 'displays only oscar nominated films' do
    director_1 = Director.create!(name: 'Jordan Peele', birthdate: '1979-02-21', hometown: 'New York', active: true, imdb_rating: 16)

    film_1 = director_1.films.create!(title: 'Get Out', oscar_nominated: true, oscar_wins: 0, budget: 2000000, revenue: 3000000, release_date: '2017-02-24')

    film_2 = director_1.films.create!(title: 'Us', oscar_nominated: false, oscar_wins: 0, budget: 2750000, revenue: 2800000, release_date: '2019-03-22')

    film_3 = director_1.films.create!(title: 'Nope', oscar_nominated: true, oscar_wins: 0, budget: 1500000, revenue: 37500000, release_date: '2022-05-18')

    visit "/films"

    expect(page).to have_content('Get Out')
    expect(page).to have_content('Nope')
    expect(page).to_not have_content('Us')
  end

  # As a visitor
  # When I visit the `child_table_name` index page or a parent `child_table_name` index page
  # Next to every child, I see a link to edit that child's info
  # When I click the link
  # I should be taken to that `child_table_name` edit page where I can update its information

  it 'links to the edit page' do
    director = Director.create!(name: 'Jordan Peele', birthdate: '1979-02-21', hometown: 'New York', active: true, imdb_rating: 16)

    film = director.films.create!(title: 'Get Out', oscar_nominated: true, oscar_wins: 0, budget: 2000000, revenue: 3000000, release_date: '2017-02-24')

    visit "/films"

    click_link "Edit #{film.title}"

    expect(current_path).to eq("/films/#{film.id}/edit")
  end

  # As a visitor
  # When I visit the `child_table_name` index page or a parent `child_table_name` index page
  # Next to every child, I see a link to delete that child
  # When I click the link
  # I should be taken to the `child_table_name` index page where I no longer see that child

  it 'has a link to delete film from film index page' do
    director_1 = Director.create!(name: 'Jordan Peele', birthdate: '1979-02-21', hometown: 'New York', active: true, imdb_rating: 16)

    film_1 = director_1.films.create!(title: 'Get Out', oscar_nominated: true, oscar_wins: 0, budget: 2000000, revenue: 3000000, release_date: '2017-02-24')

    film_2 = director_1.films.create!(title: 'Us', oscar_nominated: false, oscar_wins: 0, budget: 2750000, revenue: 2800000, release_date: '2019-03-22')

    film_3 = director_1.films.create!(title: 'Nope', oscar_nominated: true, oscar_wins: 0, budget: 1500000, revenue: 37500000, release_date: '2022-05-18')

    visit "/films"

    click_link "Delete #{film_2.title}"

    expect(page).to_not have_content('Us')
    expect(page).to have_content('Get Out')
    expect(page).to have_content('Nope')
    expect(current_path).to eq("/films")
  end
end
