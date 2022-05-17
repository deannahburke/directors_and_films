require 'rails_helper'

RSpec.describe 'delete child record' do
  # As a visitor
  # When I visit a child show page
  # Then I see a link to delete the child "Delete Child"
  # When I click the link
  # Then a 'DELETE' request is sent to '/child_table_name/:id',
  # the child is deleted,
  # and I am redirected to the child index page where I no longer see this child
  it 'can delete a film record' do
    jordan = Director.create!(name: 'Jordan Peele', birthdate: '1979-02-21', hometown: 'New York', active: true, imdb_rating: 16)

    get_out = jordan.films.create!(title: 'Get Out', oscar_nominated: true, oscar_wins: 0, budget: 2000000, revenue: 3000000, release_date: '2017-02-24')

    nope = jordan.films.create!(title: 'Nope', oscar_nominated: false, oscar_wins: 0, budget: 3500000, revenue: 43000000, release_date: '2022-05-16')

    visit "/films/#{nope.id}"

    click_link "Delete #{nope.title}"

    visit "/films"

    expect(current_path).to eq("/films")
    expect(page).to_not have_content("Nope")
    expect(page).to_not have_content('2022-05-16')
    expect(page).to have_content("Get Out")
    expect(page).to have_content('2017-02-24')
  end
end
