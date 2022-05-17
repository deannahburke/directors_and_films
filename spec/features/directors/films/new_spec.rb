require 'rails_helper'

# As a visitor
# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

RSpec.describe 'the director films creation', type: :feature do
  it 'links to new film page from directors films index' do
    jordan = Director.create!(name: 'Jordan Peele', birthdate: '1979-02-21', hometown: 'New York', active: true, imdb_rating: 16)

    visit "/directors/#{jordan.id}/films"

    click_link "Add Film"

    expect(current_path).to eq("/directors/#{jordan.id}/films/new")
  end

  it 'can add a new film to director films' do
    jordan = Director.create!(name: 'Jordan Peele', birthdate: '1979-02-21', hometown: 'New York', active: true, imdb_rating: 16)

    visit "/directors/#{jordan.id}/films/new"

    fill_in('Title', with: 'Nope')
    select('False', from: 'Oscar nominated')
    fill_in('Oscar wins', with: '0')
    fill_in('Budget', with: '2000000')
    fill_in('Revenue', with: '3000000')
    fill_in('Release date', with: '2022-05-20')
    click_button('Add Film')

    expect(current_path).to eq("/directors/#{jordan.id}/films")
    expect(page).to have_content('Nope')
  end
end
