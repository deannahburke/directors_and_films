require 'rails_helper'
# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information

RSpec.describe 'the film edit', type: :feature do
  it 'links to the edit page' do
    jordan = Director.create!(name: 'Jordan Peele', birthdate: '1979-02-21', hometown: 'New York', active: true, imdb_rating: 16)

    nope = jordan.films.create!(title: 'Nope', oscar_nominated: false, oscar_wins: 0, budget: 15000000, revenue: 30000000, release_date: '2022-04-29')

    visit "/films/#{nope.id}"

    click_link "Update #{nope.title}"

    expect(current_path).to eq("/films/#{nope.id}/edit")
  end

  it 'can edit a film attributes' do
    jordan = Director.create!(name: 'Jordan Peele', birthdate: '1979-02-21', hometown: 'New York', active: true, imdb_rating: 16)

    nope = jordan.films.create!(title: 'Noope', oscar_nominated: false, oscar_wins: 0, budget: 15000000, revenue: 30000000, release_date: '2022-04-29')

    visit "/films/#{nope.id}"

    expect(page).to have_content('Noope')

    click_link "Update Noope"

    fill_in('Title', with: 'Nope')
    select('False', from: 'Oscar nominated')
    fill_in('Oscar wins', with: '0')
    fill_in('Budget', with: '2000000')
    fill_in('Revenue', with: '3000000')
    fill_in('Release date', with: '2022-05-20')
    click_button('Update Film')

    expect(current_path).to eq("/films/#{nope.id}")
    expect(page).to have_content('Nope')
    expect(page).to_not have_content('Noope')
  end
end
