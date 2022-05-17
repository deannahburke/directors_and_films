require 'rails_helper'

RSpec.describe 'delete parent record' do

  # As a visitor
  # When I visit a parent show page
  # Then I see a link to delete the parent
  # When I click the link "Delete Parent"
  # Then a 'DELETE' request is sent to '/parents/:id',
  # the parent is deleted, and all child records are deleted
  # and I am redirected to the parent index page where I no longer see this parent
  it 'can delete a director from the director show page' do
    jordan = Director.create!(name: 'Jordan Peele', birthdate: '1979-02-21', hometown: 'New York', active: true, imdb_rating: 16)

    chloe = Director.create!(name: 'Chloe Zhao', birthdate: '1982-03-31', hometown: 'Beijing', active: true, imdb_rating: 20)

    get_out = jordan.films.create!(title: 'Get Out', oscar_nominated: true, oscar_wins: 0, budget: 2000000, revenue: 3000000, release_date: '2017-02-24')

    visit "/directors/#{jordan.id}"

    click_link "Delete #{jordan.name}"

    visit "/directors"

    expect(page).to_not have_content('Jordan Peele')
    expect(page).to have_content('Chloe Zhao')
    expect(current_path).to eq("/directors")
  end
end
