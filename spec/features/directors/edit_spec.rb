require 'rails_helper'
# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info

RSpec.describe 'the director edit' do
  it 'links to the edit page' do
    director = Director.create!(name: 'Jordan Peele', birthdate: '1979-02-21', hometown: 'New York', active: true, imdb_rating: 16)

    visit "/directors/#{director.id}"

    click_link "Update #{director.name}"

    expect(current_path).to eq("/directors/#{director.id}/edit")
  end

  it 'can edit a director attributes' do
    director = Director.create!(name: 'Jordan Peal', birthdate: '1979-02-21', hometown: 'New York', active: true, imdb_rating: 16)

    visit "/directors/#{director.id}"

    expect(page).to have_content('Jordan Peal')

    click_link "Update Jordan Peal"

    fill_in 'Name', with: 'Jordan Peele'
    fill_in 'Birthdate', with: '1979-02-21'
    fill_in 'Hometown', with: 'New York'
    select 'True', from: 'Active?'
    fill_in 'Imdb rating', with: '13'
    click_button 'Update Director'

    expect(current_path).to eq("/directors/#{director.id}")
    expect(page).to have_content('Jordan Peele')
  end
end
